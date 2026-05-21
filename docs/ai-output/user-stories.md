# 🔵 Product Manager: Feature Specification

## Feature: Export & Share Statistics for Instagram (Canvas Replication)

### 1. User Stories

**Story 1: Share Progress to Social Media**
```text
AS A collector (authenticated or guest)
I WANT TO export my global progress card as an image
SO THAT I can share my collection status on Instagram and other social media platforms.

Given I am viewing the StatisticsScreen
When I tap the amber share icon in the AppBar
Then the app generates a high-resolution, branded image of my progress card and opens the native share menu with a localized message.
```

### 2. Acceptance Criteria

- **UI / Trigger:**
  - [ ] An Amber-colored share icon (`Icons.share`) is present in the `AppBar` of `StatisticsScreen`.
  - [ ] Tapping the icon triggers the image generation and sharing process without navigating away from the screen.
- **Image Generation (Canvas):**
  - [ ] The image is generated in memory using `Canvas` and `CustomPainter` (no new screens or files created).
  - [ ] Dimensions are exactly `1080x1920` (9:16) or `1080x1350` (4:5).
  - [ ] The background is painted a solid dark theme color (e.g., `#121212` or `#1E1E1E`).
  - [ ] The `_GlobalProgressCard` is visually replicated pixel-perfectly and centered on the canvas.
  - [ ] App branding is added: `assets/icon/app_icon.png` and the localized `appTitle` are tastefully positioned at the top or bottom.
- **Sharing & Localization:**
  - [ ] The device's native share menu is invoked using the `share_plus` package.
  - [ ] The shared text includes the localized `shareStatisticsMessage` with the correct `{percentage}` and `{appLink}` injected.
  - [ ] **Strict ARB Policy:** The following 11 files are updated (appended only, no deletions) with the translated keys: `app_ar.arb`, `app_de.arb`, `app_en.arb`, `app_es.arb`, `app_fa.arb`, `app_fr.arb`, `app_he.arb`, `app_hi.arb`, `app_it.arb`, `app_ja.arb`, `app_ko.arb`.
  - [ ] *English Translation Reference:* 
    - `"shareStatisticsTooltip": "Share statistics"`
    - `"shareStatisticsMessage": "Check out my progress in Album 26! I have completed {percentage}% of my album. Download the app and collect with me: {appLink}"`
- **Architecture:**
  - [ ] Logic is integrated into the existing `StatisticsProvider` (or the provider managing `StatisticsScreen`).
  - [ ] No new files or state management classes are created.

### 3. Data Model Impact

- **Supabase:** No changes required.
- **Brick Models:** No changes required.
- **Relationships:** No changes required.
- *Note:* This is a purely presentation-layer feature utilizing existing local state.

### 4. UI Flow Description

- **Screens Needed:** None (Modifications to existing `lib/features/catalog/presentation/statistics_screen.dart`).
- **Navigation Flow:** 
  1. User navigates to Statistics.
  2. User taps the Share icon in the AppBar.
  3. A brief loading state may occur (if canvas rendering takes > 16ms).
  4. The native OS share bottom sheet appears.
- **Key Interactions:** 
  - The `CustomPainter` must read the current state from the `StatisticsProvider` (total stickers, collected stickers, percentage) to draw the replicated card.
  - The `share_plus` package will be called with `Share.shareXFiles` passing the generated PNG bytes converted to an `XFile` in the temporary directory.

### 5. Edge Cases & Constraints

- **Offline Behavior:** 
  - **Fully Supported.** Image generation happens entirely on-device via Flutter's rendering engine. The native share sheet will still open. (Note: The recipient of the shared link will need internet to open the `{appLink}`, but the sender does not need internet to generate and share the image to local apps like Photos or SMS).
- **Guest User Behavior:** 
  - **Fully Supported.** Guest users have local statistics via SQLite/Brick. The canvas will render their local progress exactly the same as an authenticated user.
- **Geographic Variants:** 
  - The progress card must reflect the stats of the currently active geographic variant (LATAM, Europe, USA). Since we are reusing the existing `StatisticsProvider`, this should be handled automatically, but ensure the canvas reads the *filtered* totals, not the absolute global totals if a variant is selected.
- **Performance Considerations:** 
  - `PictureRecorder` and `Canvas` operations should be highly optimized. If rendering causes UI jank, consider wrapping the generation logic in an `Isolate` (via `compute`), though standard UI replication usually executes fast enough on the main thread.
  - Ensure the temporary PNG file created for `share_plus` is written to the `getTemporaryDirectory()` so it gets cleared by the OS and doesn't bloat the app's storage.
- **RTL Languages (Arabic, Hebrew, Persian):**
  - Ensure the `CustomPainter` respects text directionality (Right-to-Left) when drawing the text on the canvas for `app_ar.arb`, `app_he.arb`, and `app_fa.arb`.
