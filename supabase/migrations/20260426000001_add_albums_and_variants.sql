-- ============================================================
-- Migration: Multi-album + Geographic Album Variants
-- Date: 2026-04-26
-- Description:
--   Adds support for:
--     - Multiple album editions (2026, 2027, 2028...)
--     - Geographic variants per album (LATAM, Europa, USA...)
--     - Per-variant sticker membership (join table)
--     - User variant preference per album
--     - album_id FK on categories (tie categories to a specific album)
-- ============================================================


-- ============================================================
-- 1. ALBUMS
--    Represents each yearly/edition album.
--    Example: { name: "FIFA World Cup 2026", year: 2026 }
-- ============================================================
CREATE TABLE IF NOT EXISTS public.albums (
  id          TEXT        PRIMARY KEY,
  name        TEXT        NOT NULL,
  year        INTEGER     NOT NULL,
  is_active   BOOLEAN     NOT NULL DEFAULT FALSE,  -- the "current" album shown by default
  cover_url   TEXT,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Only one album should be active at a time (partial unique index)
CREATE UNIQUE INDEX IF NOT EXISTS albums_single_active
  ON public.albums (is_active)
  WHERE is_active = TRUE;

-- ============================================================
-- 2. ALBUM VARIANTS
--    Geographic editions of the same album.
--    Example: LATAM, Europa, USA, Asia-Pacific
--    Stickers are mostly shared but some may differ per variant.
-- ============================================================
CREATE TABLE IF NOT EXISTS public.album_variants (
  id          TEXT        PRIMARY KEY,
  album_id    TEXT        NOT NULL REFERENCES public.albums(id) ON DELETE CASCADE,
  name        TEXT        NOT NULL,          -- "LATAM", "Europa", "USA"
  is_default  BOOLEAN     NOT NULL DEFAULT FALSE,  -- variant selected when user picks an album
  created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Only one default variant per album
CREATE UNIQUE INDEX IF NOT EXISTS album_variants_single_default
  ON public.album_variants (album_id, is_default)
  WHERE is_default = TRUE;

-- ============================================================
-- 3. ALBUM VARIANT STICKERS (join table)
--    Controls which stickers belong to each geographic variant.
--    A sticker not present in this table for a given variant
--    is simply not shown to users on that variant.
--
--    NOTE: Inventory (sticker quantities) is NEVER deleted
--    when a user changes variant — those rows are just hidden
--    by the UI filter. If the user switches back, quantities
--    reappear intact.
-- ============================================================
CREATE TABLE IF NOT EXISTS public.album_variant_stickers (
  id                TEXT  PRIMARY KEY,  -- UUID; required for Brick ORM single-PK constraint
  album_variant_id  TEXT  NOT NULL REFERENCES public.album_variants(id) ON DELETE CASCADE,
  sticker_id        TEXT  NOT NULL REFERENCES public.stickers(id)        ON DELETE CASCADE,
  UNIQUE (album_variant_id, sticker_id)
);

-- ============================================================
-- 4. USER VARIANT PREFERENCES
--    Stores which geographic variant each user has chosen
--    for each album. One row per (user, album) pair.
--
--    Changing variant: UPDATE album_variant_id.
--    Inventory remains untouched.
-- ============================================================
CREATE TABLE IF NOT EXISTS public.user_variant_preferences (
  id                TEXT        PRIMARY KEY,
  user_id           TEXT        NOT NULL,
  album_id          TEXT        NOT NULL REFERENCES public.albums(id)         ON DELETE CASCADE,
  album_variant_id  TEXT        NOT NULL REFERENCES public.album_variants(id) ON DELETE RESTRICT,
  updated_at        TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  UNIQUE (user_id, album_id)
);

-- ============================================================
-- 5. ADD album_id TO categories
--    Categories (countries/groups) belong to a specific album.
--    Existing rows get NULL; backfill after inserting albums.
-- ============================================================
ALTER TABLE public.categories
  ADD COLUMN IF NOT EXISTS album_id TEXT REFERENCES public.albums(id) ON DELETE SET NULL;

-- ============================================================
-- INDEXES
-- ============================================================
CREATE INDEX IF NOT EXISTS idx_album_variants_album_id
  ON public.album_variants (album_id);

CREATE INDEX IF NOT EXISTS idx_album_variant_stickers_variant
  ON public.album_variant_stickers (album_variant_id);

CREATE INDEX IF NOT EXISTS idx_album_variant_stickers_sticker
  ON public.album_variant_stickers (sticker_id);

CREATE INDEX IF NOT EXISTS idx_user_variant_prefs_user
  ON public.user_variant_preferences (user_id);

CREATE INDEX IF NOT EXISTS idx_user_variant_prefs_album
  ON public.user_variant_preferences (album_id);

CREATE INDEX IF NOT EXISTS idx_categories_album_id
  ON public.categories (album_id);

-- ============================================================
-- ROW LEVEL SECURITY (RLS)
-- ============================================================

-- albums: anyone authenticated can read, only service role can write
ALTER TABLE public.albums ENABLE ROW LEVEL SECURITY;
CREATE POLICY "albums_select" ON public.albums
  FOR SELECT TO authenticated USING (TRUE);

-- album_variants: read-only for authenticated users
ALTER TABLE public.album_variants ENABLE ROW LEVEL SECURITY;
CREATE POLICY "album_variants_select" ON public.album_variants
  FOR SELECT TO authenticated USING (TRUE);

-- album_variant_stickers: read-only for authenticated users
ALTER TABLE public.album_variant_stickers ENABLE ROW LEVEL SECURITY;
CREATE POLICY "album_variant_stickers_select" ON public.album_variant_stickers
  FOR SELECT TO authenticated USING (TRUE);

-- user_variant_preferences: users can only read and write their own rows
ALTER TABLE public.user_variant_preferences ENABLE ROW LEVEL SECURITY;
CREATE POLICY "uvp_select_own" ON public.user_variant_preferences
  FOR SELECT TO authenticated USING (auth.uid()::TEXT = user_id);
CREATE POLICY "uvp_insert_own" ON public.user_variant_preferences
  FOR INSERT TO authenticated WITH CHECK (auth.uid()::TEXT = user_id);
CREATE POLICY "uvp_update_own" ON public.user_variant_preferences
  FOR UPDATE TO authenticated USING (auth.uid()::TEXT = user_id);

-- ============================================================
-- SEED DATA: Album 2026 with its variants
-- Run this block manually after applying the migration.
-- Replace UUIDs with your actual generated IDs.
-- ============================================================

/*
-- Step 1: Insert the 2026 album
INSERT INTO public.albums (id, name, year, is_active)
VALUES ('album-2026', 'FIFA World Cup 2026', 2026, TRUE);

-- Step 2: Insert geographic variants
INSERT INTO public.album_variants (id, album_id, name, is_default)
VALUES
  ('variant-2026-latam',   'album-2026', 'LATAM',         TRUE),
  ('variant-2026-europa',  'album-2026', 'Europa',         FALSE),
  ('variant-2026-usa',     'album-2026', 'USA',            FALSE);

-- Step 3: Backfill existing categories to belong to album 2026
UPDATE public.categories SET album_id = 'album-2026' WHERE album_id IS NULL;

-- Step 4: Populate album_variant_stickers for each variant
-- For LATAM (all existing stickers are LATAM by default):
INSERT INTO public.album_variant_stickers (id, album_variant_id, sticker_id)
SELECT gen_random_uuid()::TEXT, 'variant-2026-latam', id FROM public.stickers;

-- For Europa and USA: same as LATAM initially, then remove/add variant-specific stickers
INSERT INTO public.album_variant_stickers (id, album_variant_id, sticker_id)
SELECT gen_random_uuid()::TEXT, 'variant-2026-europa', id FROM public.stickers;

INSERT INTO public.album_variant_stickers (id, album_variant_id, sticker_id)
SELECT gen_random_uuid()::TEXT, 'variant-2026-usa', id FROM public.stickers;
*/
