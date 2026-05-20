# Feature: Export and Share Album Collection Statistics as PNG

## 1. User Stories

### Story 1: Export Statistics as a Shareable Image
**AS A** user of the Album 26 Sticker Collector app  
**I WANT TO** export my album collection statistics as a high-quality PNG image  
**SO THAT** I can share my progress with friends on social media.  

- **Given** I am on the Statistics page  
- **When** I tap the amber-colored share icon in the AppBar  
- **Then** a PNG image of my album statistics is generated, styled with app branding and localized text, and the device's native share menu is opened to share the image.

---

## 2. Acceptance Criteria

1. **UI/UX Requirements**:
   - The share icon must be amber-colored and placed in the AppBar of the existing `StatisticsScreen` (`lib/features/catalog/presentation/statistics_screen.dart`).
   - The generated PNG must include:
     - The app logo (`assets/app_icon.png`) with a transparent background.
     - Album completion percentage.
     - Total stickers owned, missing, and duplicates.
     - The app's branding colors and typography.
   - All text in the image must be localized based on the user's current language.

2. **Functionality**:
   - The share icon must trigger the generation of the PNG image.
   - The generated image must be passed to the device's native share menu using the `share_plus` package.
   - The sharing message accompanying the image must also be localized.

3. **Performance**:
   - The image generation process must not block the UI for more than 2 seconds.
   - The feature must work offline using locally stored data from Brick.

4. **Localization**:
   - All text in the generated image and the sharing message must support all languages defined in the `lib/l10n/` ARB files.

5. **Error Handling**:
   - If the image generation fails, display a localized error message using a `SnackBar`.
   - If the sharing process fails, display a localized error message using a `SnackBar`.

---

## 3. Data Model Impact

No changes are required to the Supabase database schema or existing Brick models. The feature will use the locally cached data from the `StatisticsScreen` provider.

---

## 4. UI Flow Description

### Updated Screen: `StatisticsScreen`
- **Location**: `lib/features/catalog/presentation/statistics_screen.dart`
- **Changes**:
  - Add an amber-colored share icon (`Icons.share`) to the AppBar.
  - On tapping the share icon:
    1. Generate a PNG image of the statistics using the `flutter_canvas` package.
    2. Open the device's native share menu using the `share_plus` package.

### Image Design
- **Layout**:
  - App logo at the top center (`assets/app_icon.png`).
  - Album completion percentage prominently displayed below the logo.
  - Total stickers owned, missing, and duplicates displayed as a horizontal row.
  - Footer text: "Shared via Album 26 Sticker Collector" (localized).

- **Styling**:
  - Use the app's primary colors (dark background with amber accents).
  - Typography must match the app's global theme.

---

## 5. Edge Cases & Constraints

### Edge Cases
1. **Offline Mode**:
   - The feature must work offline by using locally cached statistics data from Brick.
   - If no data is available (e.g., first-time user with no statistics), display a localized error message: "No statistics available to share."

2. **Guest Users**:
   - The feature must be available to guest users.
   - The sharing message should not include any user-specific information (e.g., email).

3. **Localization**:
   - Ensure all text in the image and the sharing message is dynamically localized based on the user's current language.
   - Handle languages with right-to-left (RTL) text direction, such as Arabic.

4. **Performance**:
   - Ensure the image generation process does not block the UI for more than 2 seconds.
   - Use asynchronous image generation and display a loading indicator while the image is being generated.

5. **Device Compatibility**:
   - Ensure the generated PNG image is compatible with common social media platforms (e.g., Instagram, Twitter, WhatsApp).
   - Test the share functionality on both iOS and Android devices.

### Constraints
- The feature must not introduce new dependencies beyond `share_plus` and `flutter_canvas` (already in use in the project).
- The image must strictly adhere to the app's branding guidelines.
- The feature must not require any changes to the Supabase backend.

---

## Implementation Notes

### Localization
- Update all ARB files in `lib/l10n/` to include:
  ```json
  {
    "shareStatisticsMessage": "Check out my FIFA World Cup 2026 sticker album progress! 🏆",
    "@shareStatisticsMessage": {
      "description": "Message accompanying the shared statistics image."
    },
    "shareNoDataError": "No statistics available to share.",
    "@shareNoDataError": {
      "description": "Error message when no statistics data is available for sharing."
    }
  }
  ```

### Image Generation
- Use the `flutter_canvas` package to create a custom canvas for the PNG image.
- Save the generated image to a temporary directory using `path_provider`.

### Sharing
- Use the `share_plus` package to open the device's native share menu:
  ```dart
  final box = await getTemporaryDirectory();
  final filePath = '${box.path}/album_statistics.png';
  await File(filePath).writeAsBytes(pngBytes);
  await Share.shareFiles([filePath], text: AppLocalizations.of(context).shareStatisticsMessage);
  ```

### Error Handling
- Wrap the image generation and sharing logic in a `try-catch` block.
- Display localized error messages using the `scaffoldMessengerKey`:
  ```dart
  scaffoldMessengerKey.currentState?.showSnackBar(
    SnackBar(content: Text(AppLocalizations.of(context).shareNoDataError)),
  );
  ```
