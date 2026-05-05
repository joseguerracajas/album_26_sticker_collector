-- =============================================================================
-- TRADE FEATURE MIGRATION
-- Ejecutar en Supabase SQL Editor
-- =============================================================================

-- 1. Tabla de códigos de intercambio por usuario
CREATE TABLE IF NOT EXISTS user_trade_codes (
  user_id   UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  trade_code CHAR(6) NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE UNIQUE INDEX IF NOT EXISTS idx_user_trade_codes_code ON user_trade_codes(trade_code);

ALTER TABLE user_trade_codes ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone authenticated can read trade codes"
  ON user_trade_codes FOR SELECT
  USING (auth.role() = 'authenticated');

CREATE POLICY "Users manage their own trade code"
  ON user_trade_codes FOR ALL
  USING (auth.uid() = user_id);

-- 2. Tabla de sesiones de intercambio
-- status values:
--   pending_acceptance  → iniciador esperando que el receptor acepte
--   selecting           → receptor aceptó, ambos seleccionando cromos
--   initiator_confirmed → iniciador confirmó su oferta
--   receiver_confirmed  → receptor confirmó su oferta
--   reserved            → ambos confirmaron; cromos reservados (entrega física pendiente)
--   completed           → entrega física completada
--   cancelled           → intercambio cancelado
CREATE TABLE IF NOT EXISTS trade_sessions (
  id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  initiator_id  UUID NOT NULL REFERENCES auth.users(id),
  receiver_id   UUID NOT NULL REFERENCES auth.users(id),
  status        TEXT NOT NULL DEFAULT 'pending_acceptance',
  created_at    TIMESTAMPTZ DEFAULT NOW(),
  updated_at    TIMESTAMPTZ DEFAULT NOW()
);

ALTER TABLE trade_sessions ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Participants can view their trade sessions"
  ON trade_sessions FOR SELECT
  USING (auth.uid() = initiator_id OR auth.uid() = receiver_id);

CREATE POLICY "Authenticated users can create trade sessions"
  ON trade_sessions FOR INSERT
  WITH CHECK (auth.uid() = initiator_id);

CREATE POLICY "Participants can update their trade sessions"
  ON trade_sessions FOR UPDATE
  USING (auth.uid() = initiator_id OR auth.uid() = receiver_id);

-- Trigger para actualizar updated_at automáticamente
CREATE OR REPLACE FUNCTION update_trade_session_timestamp()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trade_sessions_updated_at
  BEFORE UPDATE ON trade_sessions
  FOR EACH ROW EXECUTE FUNCTION update_trade_session_timestamp();

-- 3. Tabla de ofertas de cromos (qué ofrece cada usuario)
-- status values:
--   selected   → usuario seleccionó este cromo
--   reserved   → intercambio bloqueado, entrega pendiente
--   delivered  → entrega física confirmada
--   returned   → entrega cancelada, cromo devuelto al propietario original
CREATE TABLE IF NOT EXISTS trade_offers (
  id                UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  trade_session_id  UUID NOT NULL REFERENCES trade_sessions(id) ON DELETE CASCADE,
  offerer_id        UUID NOT NULL REFERENCES auth.users(id),
  sticker_id        TEXT NOT NULL,
  quantity          INT NOT NULL DEFAULT 1,
  delivered         BOOLEAN NOT NULL DEFAULT FALSE,
  created_at        TIMESTAMPTZ DEFAULT NOW()
);

ALTER TABLE trade_offers ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Participants can view offers in their trades"
  ON trade_offers FOR SELECT
  USING (
    EXISTS (
      SELECT 1 FROM trade_sessions ts
      WHERE ts.id = trade_session_id
        AND (ts.initiator_id = auth.uid() OR ts.receiver_id = auth.uid())
    )
  );

CREATE POLICY "Users can manage their own offers"
  ON trade_offers FOR ALL
  USING (auth.uid() = offerer_id);

-- =============================================================================
-- FUNCIÓN AUXILIAR: Generar código de 6 dígitos único
-- (Solo para uso interno de la app vía RPC)
-- =============================================================================
CREATE OR REPLACE FUNCTION generate_unique_trade_code()
RETURNS TEXT AS $$
DECLARE
  new_code TEXT;
  max_attempts INT := 100;
  attempt INT := 0;
BEGIN
  LOOP
    -- Genera código numérico de 6 dígitos (100000–999999)
    new_code := LPAD((FLOOR(RANDOM() * 900000) + 100000)::TEXT, 6, '0');
    EXIT WHEN NOT EXISTS (SELECT 1 FROM user_trade_codes WHERE trade_code = new_code);
    attempt := attempt + 1;
    IF attempt >= max_attempts THEN
      RAISE EXCEPTION 'No se pudo generar un código único después de % intentos', max_attempts;
    END IF;
  END LOOP;
  RETURN new_code;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- RPC: Obtener o crear el código de intercambio del usuario actual
CREATE OR REPLACE FUNCTION get_or_create_my_trade_code()
RETURNS TEXT AS $$
DECLARE
  existing_code TEXT;
  new_code TEXT;
BEGIN
  -- Buscar código existente
  SELECT trade_code INTO existing_code
  FROM user_trade_codes
  WHERE user_id = auth.uid();

  IF existing_code IS NOT NULL THEN
    RETURN existing_code;
  END IF;

  -- Crear nuevo código único
  new_code := generate_unique_trade_code();

  INSERT INTO user_trade_codes (user_id, trade_code)
  VALUES (auth.uid(), new_code);

  RETURN new_code;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- RPC: Buscar usuario por código de intercambio
CREATE OR REPLACE FUNCTION find_user_by_trade_code(p_code TEXT)
RETURNS TABLE(user_id UUID, trade_code TEXT, email TEXT) AS $$
BEGIN
  RETURN QUERY
  SELECT
    utc.user_id,
    utc.trade_code,
    au.email::TEXT
  FROM user_trade_codes utc
  JOIN auth.users au ON au.id = utc.user_id
  WHERE utc.trade_code = p_code;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
