# 🟠 Product Owner: Feature Specification

## Feature: Export & Share Statistics for Instagram (Canvas Replication)

### 1. User Stories

**Story 1: Share Global Progress**
```text
AS A collector
I WANT TO export and share my global progress card
SO THAT I can show off my album completion percentage to my friends on Instagram and other social media.

Given I am viewing the Statistics Screen and my progress data is loaded
When I tap the Amber share icon in the AppBar
Then the app generates a high-resolution image of my progress card and opens the native share menu with a localized message.
```

### 2. Acceptance Criteria

- [ ] **UI Trigger:** An Amber-colored share icon (`Icons.share`) is present in the `AppBar` of the `StatisticsScreen`.
- [ ] **Tooltip:** The share icon uses the localized `shareStatisticsTooltip` key for its tooltip.
- [ ] **Canvas Dimensions:** The generated image uses a base canvas size of 1080x1920 (9:16) or 1080x1350 (4:5).
- [ ] **Canvas Background:** The canvas background is painted with a dark theme color (e.g., `#121212` or `#1E1E1E`).
- [ ] **Card Replication:** The gold gradient `_GlobalProgressCard` is replicated pixel-perfectly using `CustomPainter` and is perfectly centered on the canvas.
- [ ] **Branding:** `assets/app_icon.png` and the localized `appTitle` are drawn tastefully at the top or bottom of the canvas.
- [ ] **Native Share:** The device's native share menu is invoked (e.g., using `share_plus`), attaching the generated PNG and the localized `shareStatisticsMessage`.
- [ ] **Dynamic Variables:** The `{percentage}` and `{appLink}` variables in the message are correctly replaced with the user's actual completion percentage and the app's store link.
- [ ] **Architecture Constraints:** No new files are created. The sharing logic and `CustomPainter` are integrated into existing files (`statistics_screen.dart` and the existing `StatisticsProvider`).
- [ ] **Localization (ARB):** The keys `shareStatisticsTooltip` and `shareStatisticsMessage` are appended to all 11 specified `.arb` files (`ar`, `de`, `en`, `es`, `fa`, `fr`, `he`, `hi`, `it`, `ja`, `ko`).
- [ ] **Translation Accuracy:** The base Spanish text is accurately translated into all 11 languages without overwriting or deleting any existing ARB keys.

### 3. Data Model Impact

- **Supabase / Database:** No changes required.
- **Brick Models:** No changes required.
- **State Management:** 
  - The existing `StatisticsProvider` must be updated to include the image generation and sharing logic.
  - It must read the current offline-first statistics state (total stickers, collected stickers) to pass to the `CustomPainter`.
- **RLS:** N/A.

### 4. UI Flow Description

- **Screens Needed:** Existing `StatisticsScreen`.
- **Navigation Flow:**
  1. User navigates to the Statistics tab/screen.
  2. User taps the Amber share icon in the top right of the `AppBar`.
  3. A brief loading state occurs (if Canvas rendering takes > 100ms, show a subtle `CircularProgressIndicator` overlay or change the icon to a spinner).
  4. The native OS Share Bottom Sheet appears with the image and text pre-filled.
- **Key Interactions & States:**
  - **Loading:** Ensure the UI doesn't freeze during image generation. Run the canvas rendering efficiently.
  - **Empty/Zero State:** If the user has 0 stickers, the generated card should accurately reflect 0% progress.

### 5. Edge Cases

- **Offline Behavior:** This feature must work 100% offline. The statistics are calculated from the local SQLite Brick database, and the Canvas generation happens entirely on-device.
- **Guest User Behavior:** Guest users must be able to share their local progress exactly like authenticated users. No auth checks should block this action.
- **Geographic Variant Considerations (LATAM / Europe / USA):** The total number of stickers varies by region (e.g., 638 vs 670). The `CustomPainter` must dynamically use the correct total from the user's selected variant, ensuring the math and visual progress bar match the actual UI.
- **RTL Languages (Arabic, Farsi, Hebrew):** The `CustomPainter` must handle text direction correctly if rendering localized text inside the canvas, ensuring Arabic/Farsi/Hebrew text is aligned properly.
- **Storage Permissions:** Use temporary directories (`path_provider` -> `getTemporaryDirectory()`) to save the generated PNG before sharing to avoid requiring explicit storage permissions on newer Android versions.
