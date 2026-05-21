# 🔵 Product Manager AI Agent

Here is the product specification for the **Export & Share Statistics** feature, based on your request.

## 1. User Stories

**Story 1: Share Progress Card**
```text
AS A sticker collector
I WANT TO export and share my global progress card as an image
SO THAT I can show my friends and social networks how close I am to completing the Album 26.
```

## 2. Acceptance Criteria

- **AC 1: UI Trigger:** An Amber-colored share icon (`Icons.share`) must be present in the `AppBar` of the `StatisticsScreen`. It must use the `shareStatisticsTooltip` for its tooltip.
- **AC 2: Image Generation:** Tapping the share icon must trigger a function that uses `Canvas`, `PictureRecorder`, and `CustomPainter` to draw a pixel-perfect replica of the `_GlobalProgressCard` (including the gold gradient, typography, and progress bars).
- **AC 3: Asset Inclusion:** The generated image must successfully load and paint the `assets/app_icon.png` (with transparency) within the canvas layout.
- **AC 4: Native Sharing:** Once the PNG is generated, the app must invoke the device's native share menu (using the `share_plus` package).
- **AC 5: Localized Message:** The shared payload must include the generated PNG and the localized text from `shareStatisticsMessage`, dynamically injecting the `{percentage}`, `{appLink}`, and the localized `appTitle`.
- **AC 6: Strict ARB Policy:** All 11 `app_*.arb` files must be updated with the exact keys `"shareStatisticsTooltip"` and `"shareStatisticsMessage"`. Existing keys must **not** be modified or deleted.
- **AC 7: Architectural Constraints:** No new files can be created. The `CustomPainter` must be added to `lib/features/catalog/presentation/statistics_screen.dart`, and the generation/sharing logic must be added to the existing `StatisticsProvider`.

## 3. Data Model Impact

- **Supabase Schema:** No changes required.
- **Brick Models:** No changes required.
- **Relationships:** No changes required.
- *Note:* This is a purely local, presentation-layer feature. It relies entirely on the existing data already computed by the `StatisticsProvider`.

## 4. UI Flow Description

- **Screens Needed:** No new screens. Modifications will be strictly contained within `lib/features/catalog/presentation/statistics_screen.dart`.
- **Navigation Flow:** 
  1. User navigates to the Statistics tab/screen.
  2. User taps the Amber share icon in the top right of the `AppBar`.
  3. A brief loading indicator may appear (if rendering takes >16ms, though usually instantaneous).
  4. The OS native Share Bottom Sheet appears.
  5. User selects the destination (WhatsApp, Instagram, Save to Gallery, etc.).
- **Key Interactions:** 
  - The `StatisticsProvider` will need a new method (e.g., `shareStatistics(BuildContext context, double percentage)`) that handles the conversion of the `CustomPainter` to a PNG image, saves it to the temporary directory using `path_provider`, and triggers `Share.shareXFiles`.

## 5. Edge Cases & Constraints

- **Offline Behavior:** This feature must work 100% offline. The image generation is done locally via Flutter's rendering engine. The native share sheet will still open offline, allowing users to save the image locally or queue it in messaging apps.
- **Guest User Behavior:** Guest users have local statistics just like authenticated users. The feature must work identically for them without prompting for login.
- **Geographic Variant Considerations:** The `StatisticsProvider` already filters data based on the selected geographic variant (LATAM, Europe, USA). The generated image must simply reflect whatever data is currently active in the provider.
- **Performance Considerations:** 
  - Loading `assets/app_icon.png` as a `ui.Image` for the canvas requires an asynchronous byte-loading step. This should be cached or awaited properly before calling `toImage()` on the `PictureRecorder`.
  - Writing the PNG to the device's temporary directory must be handled asynchronously to avoid blocking the main UI thread.
- **Localization Constraints:** The `shareStatisticsMessage` requires dynamic parameters. Ensure the Flutter `intl` package correctly parses `{percentage}` and `{appLink}`. The `appTitle` must be fetched from the existing localization context and passed into the share string or drawn onto the canvas, avoiding any hardcoded "Album 26" strings.
