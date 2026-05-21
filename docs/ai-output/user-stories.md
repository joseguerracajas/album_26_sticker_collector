# 🔵 Product Manager: Feature Specification

## Feature: Export & Share Statistics (Canvas Replication)

### 1. User Stories

**Story 1: Share Global Progress**
```text
AS A sticker collector
I WANT TO export and share a visual replica of my global progress card
SO THAT I can show my friends my album completion status and invite them to collect with me.

Given I am viewing the Statistics screen
When I tap the Amber share icon in the AppBar
Then the app generates a pixel-perfect image of my global progress card and opens the native share menu with a localized message.
```

**Story 2: Offline Sharing Generation**
```text
AS A user without an active internet connection
I WANT TO generate the progress image
SO THAT I can save it to my gallery or prepare it for sharing once I am back online.

Given I have no internet connection
When I tap the share icon on the Statistics screen
Then the image is successfully generated using my locally cached (Brick) statistics and the native share menu is invoked.
```

---

### 2. Acceptance Criteria

- [ ] **UI Update**: An Amber-colored share icon (`Icons.share`) is added to the `AppBar` of the `StatisticsScreen`.
- [ ] **Tooltip**: The share icon uses the localized tooltip `"shareStatisticsTooltip"`.
- [ ] **Image Generation**: Tapping the share icon triggers a function that uses `PictureRecorder`, `Canvas`, and `CustomPainter` to draw a pixel-perfect replica of the `_GlobalProgressCard` (including the gold gradient, typography, and progress bars).
- [ ] **Asset Integration**: The generated image successfully loads and draws the `assets/app_icon.png` (transparent app icon) within the layout.
- [ ] **State Management**: The sharing logic and image generation trigger are integrated into the existing `StatisticsProvider` (or the provider managing the `StatisticsScreen`). No new state management classes are created.
- [ ] **Native Share**: The `share_plus` package is used to invoke the native share menu, passing the generated PNG file and the localized text from `"shareStatisticsMessage"`.
- [ ] **Dynamic Text**: The shared message dynamically replaces `{percentage}` with the user's actual completion percentage and uses the existing `appTitle` key for the app name.
- [ ] **Strict ARB Policy**: The keys `"shareStatisticsTooltip"` and `"shareStatisticsMessage"` are appended to **ALL 11** `lib/l10n/app_*.arb` files without deleting or modifying existing keys.
- [ ] **Architectural Constraint**: No new files are created. The `CustomPainter` and sharing logic are added to existing files (`statistics_screen.dart` and its respective provider).

---

### 3. Data Model Impact

- **Supabase**: No changes required. This is a purely client-side UI/UX feature.
- **Brick Models**: No changes required.
- **Relationships**: The feature will strictly read from the existing offline-first Brick repositories via the current `StatisticsProvider` to get the total stickers, collected stickers, and percentage.

---

### 4. UI Flow Description

- **Screens Needed**: No new screens. All changes occur on the existing `lib/features/catalog/presentation/statistics_screen.dart`.
- **Navigation Flow**:
  1. User navigates to the Statistics tab/screen.
  2. User taps the new Amber share icon in the top right of the `AppBar`.
  3. A brief asynchronous operation occurs (loading the asset image and rendering the canvas). *Consider showing a subtle loading overlay or disabling the button temporarily to prevent spam-clicking.*
  4. The OS native Share Bottom Sheet appears over the app.
- **Key Interactions**:
  - **Canvas Rendering**: The `CustomPainter` must accurately replicate the `Container` decoration (gradients, border radius) and `Text` styles of `_GlobalProgressCard`.
  - **Asset Loading**: The app must asynchronously load `assets/app_icon.png` via `rootBundle` and decode it to a `dart:ui.Image` before the `Canvas` can draw it.

---

### 5. Edge Cases & Constraints

- **Offline Behavior**: 
  - **Constraint**: Must work 100% offline. 
  - **Handling**: Since it relies on the existing `StatisticsProvider` (which uses Brick's local SQLite cache), data retrieval will work offline. The native share menu also works offline (users can save to device, Bluetooth, etc.).
- **Guest User Behavior**: 
  - **Constraint**: Guest users must be able to share their progress.
  - **Handling**: Guest progress is stored locally. The provider will supply the local stats, and the image generation will work identically to authenticated users.
- **Geographic Variant Considerations**: 
  - **Constraint**: The stats must reflect the currently selected album variant (e.g., LATAM vs. USA).
  - **Handling**: By reusing the existing `StatisticsProvider`, the data will automatically reflect the filtered variant totals. No extra logic is needed for the Canvas, it just paints the numbers provided.
- **Performance Considerations**: 
  - **Constraint**: Generating a PNG from a Canvas requires converting a `dart:ui.Image` to `ByteData` (`toByteData(format: ImageByteFormat.png)`). This can be slightly heavy on the main thread.
  - **Handling**: Ensure the canvas drawing is optimized. If the PNG encoding causes UI stutter, consider running the encoding step in an `Isolate` (via `compute`), though for a single card, synchronous generation is usually acceptable.
- **File System Constraints**: 
  - **Handling**: To share the image via `share_plus`, the `ByteData` must be written to a temporary file in the device's `getTemporaryDirectory()`. Ensure the file is overwritten or uniquely named (e.g., `album_26_progress_${DateTime.now().millisecondsSinceEpoch}.png`) to avoid caching issues.
