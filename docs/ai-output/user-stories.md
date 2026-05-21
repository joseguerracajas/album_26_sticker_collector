Here is the Product Manager breakdown for the **Export & Share Statistics** feature.

# 🔵 Feature Specifications: Export & Share Statistics

## 1. User Stories

**Story 1: Share Global Progress**
```text
AS A sticker collector
I WANT TO export and share my global progress as an image
SO THAT I can show my friends and community how close I am to completing the album.

Given I am viewing the Statistics Screen
When I tap the amber share icon in the AppBar
Then the app generates a pixel-perfect image of my global progress card and opens the native share dialog with a localized message and the image attached.
```

## 2. Acceptance Criteria

- [ ] **UI Update:** An Amber-colored share icon (`Icons.share`) is added to the `AppBar` of the existing `StatisticsScreen` (`lib/features/catalog/presentation/statistics_screen.dart`).
- [ ] **Canvas Rendering:** Tapping the share icon triggers a `CustomPainter` / `Canvas` routine that draws a pixel-perfect replica of the `_GlobalProgressCard` (including the gold gradient, typography, progress bars, and layout).
- [ ] **Asset Integration:** The transparent app icon (`assets/app_icon.png`) is successfully drawn onto the generated Canvas image.
- [ ] **Native Sharing:** The app invokes the native share menu (via `share_plus`) attaching the generated PNG file and the localized text message.
- [ ] **Dynamic Localization:** The shared text message dynamically injects the `appTitle` key, the user's current completion `{percentage}`, and an `{appLink}`.
- [ ] **Strict ARB Policy:** ALL 11 `app_*.arb` files are updated by appending `shareStatisticsTooltip` and `shareStatisticsMessage`. **No existing keys are deleted or modified.**
- [ ] **Architectural Constraint:** **Zero new files are created.** All painting logic, sharing logic, and state handling are integrated into the existing `StatisticsScreen` and its corresponding provider.

## 3. Data Model Impact

- **Supabase (PostgreSQL):** No impact. This is a purely client-side UI/UX feature.
- **Brick Models (Offline-First):** No impact. The feature will read from the existing in-memory state provided by the `StatisticsProvider`.
- **Relationships:** N/A.

## 4. UI Flow Description

- **Screens Needed:** No new screens. Modifications will be strictly confined to `lib/features/catalog/presentation/statistics_screen.dart`.
- **Navigation Flow:** 
  1. User navigates to the Statistics tab/screen.
  2. User taps the new Share icon in the top right of the AppBar.
  3. A brief loading state (e.g., a `CircularProgressIndicator` replacing the share icon temporarily) may appear while the PNG is encoded.
  4. The OS native Share Bottom Sheet appears over the app.
  5. User completes or dismisses the share action; remains on the Statistics screen.
- **Key Interactions:** 
  - The Canvas generation must capture the *current* state of the user's progress (calculating the exact percentage and counts currently displayed on the screen).

## 5. Edge Cases & Constraints

- **Offline Behavior:** 
  - *Constraint:* Must work 100% offline. 
  - *Handling:* Since the data is already available locally via Brick and the image generation is done on-device via Flutter's `Canvas`, no network request is needed. The native share sheet will still function offline (e.g., sharing via SMS or saving to local gallery).
- **Guest User Behavior:** 
  - *Constraint:* Guest users must be able to share their progress just like authenticated users.
  - *Handling:* The `StatisticsProvider` already abstracts the user's auth state. The Canvas painter simply reads the current progress numbers regardless of the user's auth status.
- **Geographic Variant Considerations:** 
  - *Constraint:* The progress percentage and counts must accurately reflect the user's selected album variant (LATAM, Europe, USA).
  - *Handling:* Ensure the Canvas painter reads the derived state from the `StatisticsProvider` which already accounts for the active geographic variant filter.
- **Performance Considerations:** 
  - *Constraint:* Converting a Canvas `Picture` to a PNG (`toByteData(format: ImageByteFormat.png)`) can be an expensive operation and might cause UI jank if done synchronously on the main thread for very large images.
  - *Handling:* Keep the generated image resolution reasonable (e.g., 2x or 3x logical pixels to ensure it looks sharp but doesn't consume excessive memory). Ensure the UI doesn't freeze completely (use async/await properly during the byte data conversion).
- **Localization Constraints:**
  - *Constraint:* The prompt explicitly requires updating 11 ARB files. The AI developer agent must ensure it parses the `l10n` directory and appends the exact keys provided in the issue description to every single language file without breaking the JSON structure.
