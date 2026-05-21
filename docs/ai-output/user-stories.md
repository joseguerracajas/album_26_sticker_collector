# 🔵 Product Manager: Export & Share Statistics Feature

Here is the product specification for the "Export & Share Statistics" feature, based on your request.

## 1. User Stories

**Story 1: Share Global Progress**
```text
AS A sticker collector
I WANT TO export and share my global progress card as an image
SO THAT I can show off my album completion status to my friends and invite them to trade.

Given I am viewing the Statistics Screen
When I tap the amber share icon in the AppBar
Then the app generates a pixel-perfect image of my global progress card and opens the native share menu with a localized message.
```

## 2. Acceptance Criteria

- [ ] **UI Update**: An Amber-colored share icon (`Icons.share`) is added to the `AppBar` of the `StatisticsScreen`.
- [ ] **Tooltip**: The share icon uses the localized tooltip `shareStatisticsTooltip`.
- [ ] **Image Generation**: Tapping the icon triggers a `Canvas` and `CustomPainter` routine that draws an exact visual replica of the `_GlobalProgressCard` (including the gold gradient, typography, progress bars, and the transparent `assets/app_icon.png`).
- [ ] **State Management**: The image generation and sharing logic is integrated directly into the existing `StatisticsProvider` (or the provider managing the `StatisticsScreen`). No new state management classes or files are created.
- [ ] **Native Share**: The app invokes the native share menu (via `share_plus`) containing the generated PNG file and the localized text from `shareStatisticsMessage`.
- [ ] **Dynamic Text**: The shared message dynamically injects the calculated `{percentage}`, a placeholder/actual `{appLink}`, and uses the existing `appTitle` key for the app name.
- [ ] **Localization (Strict)**: The keys `"shareStatisticsTooltip"` and `"shareStatisticsMessage"` are appended to **ALL 11** `lib/l10n/app_*.arb` files. No existing keys or data are deleted or overwritten.

## 3. Data Model Impact

- **Supabase (PostgreSQL)**: No changes required.
- **Brick Models (Offline-First)**: No changes required.
- **Relationships**: N/A. 
- *Note: This is strictly a UI and local processing feature. It relies entirely on the existing data provided by the `StatisticsProvider`.*

## 4. UI Flow Description

- **Screens Needed**: No new screens. Modifications will be made exclusively to `lib/features/catalog/presentation/statistics_screen.dart`.
- **Navigation Flow**: 
  1. User navigates to the Statistics tab/screen.
  2. User taps the new Share icon in the top right of the AppBar.
  3. A brief loading state may occur internally while the `PictureRecorder` converts the Canvas to a PNG.
  4. The OS native share sheet appears (iOS UIActivityViewController / Android Share Intent).
- **Key Interactions**: 
  - The `CustomPainter` must read the current state (total stickers, collected stickers, percentage) directly from the active Riverpod provider to ensure the generated image matches what the user sees on screen.
  - The generated image must be temporarily saved to the device's cache/temp directory (using `path_provider`) so it can be attached to the `share_plus` payload.

## 5. Edge Cases & Constraints

- **Offline Behavior**: Fully supported. Canvas drawing, file saving to the temporary directory, and invoking the native share menu do not require an internet connection. The feature must work flawlessly offline.
- **Guest User Behavior**: Fully supported. Guest users have local statistics, which the `StatisticsProvider` already handles. The share feature will simply render whatever local data is present.
- **Geographic Variant Considerations**: The total number of stickers in the album varies by region (e.g., LATAM vs. USA). The Canvas implementation must not hardcode the total sticker count (e.g., 638 or 670); it must dynamically use the `total` and `collected` variables provided by the `StatisticsProvider` for the user's selected variant.
- **Performance Considerations**: 
  - Generating an image via `Canvas.toImage()` can be slightly heavy. Ensure the UI doesn't freeze. If necessary, show a brief `CircularProgressIndicator` overlay or disable the share button while processing.
  - **Storage Cleanup**: Ensure the temporary PNG file created in the cache directory for sharing is overwritten on subsequent shares or cleaned up to prevent unnecessary storage bloat over time.
- **Architectural Constraint**: As requested, **do not create new files**. The `CustomPainter` class and the sharing extension/method must reside within the existing `statistics_screen.dart` or its corresponding provider file.
