Here is the product management documentation for the **Share Stats** feature, written in English as requested.

# 🔵 Feature Specifications: Share Stats (Instagram Canvas Replication)

## 1. User Stories

**Story 1: Export and Share Progress**
```text
AS A collector
I WANT TO export my global progress card as an image
SO THAT I can share my collection milestones on Instagram and other social media platforms.

Given I am viewing the StatisticsScreen
When I tap the amber share icon in the AppBar
Then the app generates a high-resolution image of my progress card and opens the native share menu with a pre-filled, localized message.
```

## 2. Acceptance Criteria

- [ ] **UI Trigger:** An Amber-colored share icon (`Icons.share`) is present in the `AppBar` of the `StatisticsScreen`.
- [ ] **Canvas Generation:** Tapping the icon generates a PNG image in memory using `Canvas` and `CustomPainter`.
- [ ] **Image Specifications:**
  - Dimensions must be either 1080x1920 (9:16) or 1080x1350 (4:5).
  - Background must be a solid dark theme color (e.g., `#121212` or `#1E1E1E`).
- [ ] **Visual Replication:** The generated image contains a pixel-perfect, centered replica of the `_GlobalProgressCard` (gold gradient, typography, layout) currently found in `StatisticsScreen`.
- [ ] **Branding:** The `assets/icon/app_icon.png` and the localized `appTitle` are tastefully positioned at the top or bottom of the canvas.
- [ ] **State Integration:** The logic is integrated into the existing `StatisticsProvider` (or equivalent provider managing this screen). No new state management classes are created.
- [ ] **Native Sharing:** The device's native share menu is invoked (via `share_plus`) passing the generated image and a localized text message.
- [ ] **Strict Localization (ARB):** 
  - The keys `shareStatisticsTooltip` and `shareStatisticsMessage` are appended to all 11 specified `.arb` files (`ar`, `de`, `en`, `es`, `fa`, `fr`, `he`, `hi`, `it`, `ja`, `ko`).
  - The base Spanish text is accurately translated for each language.
  - The `{percentage}` and `{appLink}` variables are correctly interpolated in the message.
  - The `appTitle` key is used dynamically; the app name is not hardcoded.

## 3. Data Model Impact

- **Supabase (Backend):** No changes required.
- **Brick Models (Offline-First):** No changes required.
- **Localization Data:** 
  - Two new keys added to 11 ARB files.
  - `shareStatisticsTooltip`: Tooltip for the AppBar icon.
  - `shareStatisticsMessage`: The text payload sent to the native share sheet.

## 4. UI Flow Description

- **Screens Needed:** No new screens. Modifications are isolated to `lib/features/catalog/presentation/statistics_screen.dart`.
- **Navigation Flow:** 
  1. User navigates to the Statistics tab/screen.
  2. User taps the Share icon in the top right of the AppBar.
  3. A brief loading state (e.g., a localized `SnackBar` saying "Generating image..." or a subtle circular progress indicator) may appear to prevent spam-clicking.
  4. The OS native Share Bottom Sheet appears, allowing the user to select Instagram, WhatsApp, Messages, etc.
- **Key Interactions:**
  - The `CustomPainter` must read the current state from `StatisticsProvider` (total stickers, collected stickers, percentage) to draw the exact numbers the user sees on their screen.

## 5. Edge Cases & Constraints

- **Offline Behavior:** 
  - **Supported.** Image generation happens entirely on-device via Flutter's rendering engine. The native share sheet also works offline. The `{appLink}` in the text payload will simply require the recipient to have an internet connection when clicked.
- **Guest User Behavior:** 
  - **Supported.** Guest users have local statistics. They can generate and share their progress just like authenticated users.
- **Geographic Variant Considerations:** 
  - The `StatisticsProvider` already filters data based on the user's selected variant (LATAM, Europe, USA). The canvas must simply consume the *current* state of the provider so the shared image accurately reflects the active variant's math (e.g., out of 638 vs 670 stickers).
- **Performance Considerations:** 
  - `picture.toImage()` and `image.toByteData()` are computationally expensive. This logic must be executed asynchronously to avoid dropping frames or freezing the UI thread.
  - The generated image should be saved to the device's temporary directory (`getTemporaryDirectory()`) to be shared via `XFile` using the `share_plus` package, ensuring memory is freed up after sharing.
- **RTL (Right-to-Left) Languages:** 
  - For Arabic (`ar`), Farsi (`fa`), and Hebrew (`he`), ensure the `TextPainter` used inside the `CustomPainter` respects RTL text direction for the localized `appTitle` and any other text rendered on the canvas.
