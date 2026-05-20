# Feature Specification: Export and Share Album Statistics as PNG

## 1. User Stories

### Story 1: Export Album Statistics as a Shareable Image
**AS A** user of the app  
**I WANT TO** export my album collection statistics as a high-quality PNG image  
**SO THAT** I can share my progress on social media or with friends.  

**Given** I am viewing the Statistics page of the app  
**When** I tap the Amber-colored share icon in the AppBar  
**Then** the app generates a PNG image of my album statistics and opens the device's native share menu.

---

### Story 2: Localized Text in the Generated Image
**AS A** user of the app  
**I WANT TO** see all text in the generated image in my selected app language  
**SO THAT** the image is understandable to me and my audience.  

**Given** I have selected a specific language in the app settings  
**When** I generate the statistics image  
**Then** all text in the image is displayed in the selected language.

---

### Story 3: Offline Support for Exporting Statistics
**AS A** user of the app  
**I WANT TO** export my statistics as an image even when offline  
**SO THAT** I can share my progress without needing an internet connection.  

**Given** I am offline  
**When** I tap the share icon  
**Then** the app generates the PNG image using locally stored data and opens the share menu.

---

## 2. Acceptance Criteria

1. **UI Integration**:
   - The Amber-colored share icon is added to the AppBar of the `StatisticsScreen` (`lib/features/catalog/presentation/statistics_screen.dart`).
   - Tapping the share icon triggers the PNG generation and opens the native share menu.

2. **Image Design**:
   - The image includes:
     - App icon (transparent background, `assets/app_icon.png`).
     - Overall completion percentage.
     - Count of owned, missing, and duplicate stickers.
     - App branding and colors (consistent with the app's design system).
   - The image is high-quality and optimized for social media sharing.

3. **Localization**:
   - All text in the generated image is dynamically localized based on the user's selected language.
   - The sharing message accompanying the image is also localized.

4. **Offline Support**:
   - The image generation uses locally stored data (via Brick providers) when offline.
   - The feature works seamlessly without requiring internet connectivity.

5. **Performance**:
   - The PNG generation process completes within 2 seconds on mid-range devices.
   - The app does not freeze or lag during the process.

---

## 3. Data Model Impact

### No Changes to Supabase or Brick Models
- This feature relies entirely on existing local data (via Brick) and does not require any new tables, columns, or models.

---

## 4. UI Flow Description

### Screens and Navigation
- **Statistics Screen (`lib/features/catalog/presentation/statistics_screen.dart`)**:
  - Add an Amber-colored share icon to the AppBar.
  - Tapping the icon triggers the PNG generation and opens the native share menu.

### Key Interactions
1. **User Action**: Tap the share icon in the AppBar.
2. **Image Generation**:
   - Fetch statistics data from the existing Riverpod providers.
   - Render the statistics data into a custom Flutter widget designed for the PNG.
   - Use the `RepaintBoundary` widget to capture the widget as an image.
   - Convert the image to a PNG file.
3. **Sharing**:
   - Use the `share_plus` package to open the device's native share menu with the generated PNG file and a localized sharing message.

---

## 5. Edge Cases & Constraints

### Offline Behavior
- **Edge Case**: User is offline when tapping the share icon.
  - **Solution**: Use locally cached data (via Brick) to generate the image.

### Guest User Behavior
- **Edge Case**: Guest users attempt to share their statistics.
  - **Solution**: The feature works identically for guest users since statistics data is stored locally.

### Geographic Variants
- **Edge Case**: Users with different album variants (LATAM, Europe, USA) share their statistics.
  - **Solution**: Ensure the statistics reflect the correct album variant based on the user's selection.

### Localization
- **Edge Case**: User's selected language is not fully translated in the ARB files.
  - **Solution**: Fallback to English for any missing translations.

### Performance
- **Edge Case**: Image generation takes too long, causing the app to freeze.
  - **Solution**: Use `FutureBuilder` or `AsyncNotifier` to show a loading indicator while the image is being generated.

### PNG File Size
- **Edge Case**: Generated PNG file is too large for sharing on certain platforms.
  - **Solution**: Optimize the image resolution and compression settings to balance quality and file size.

---

## 6. Technical Implementation Plan

### Step 1: Add Share Icon to AppBar
- Modify `StatisticsScreen` (`lib/features/catalog/presentation/statistics_screen.dart`) to include an Amber-colored share icon in the AppBar.

### Step 2: Create PNG Generation Logic
- Use a `RepaintBoundary` widget to wrap the statistics content.
- Capture the widget as an image using `RenderRepaintBoundary.toImage()`.
- Convert the image to PNG format using `dart:ui` and `ui.Image.toByteData()`.

### Step 3: Localize Text in the Image
- Use `AppLocalizations` to fetch localized strings for all text elements in the image.
- Ensure the localization logic is consistent with the app's existing i18n setup.

### Step 4: Integrate Sharing Functionality
- Use the `share_plus` package to open the native share menu with:
  - The generated PNG file.
  - A localized sharing message (e.g., "¡Mira mi progreso en Album 26!").

### Step 5: Test Offline Functionality
- Ensure the feature works when the device is offline by using data from the Brick repository.

### Step 6: Optimize Performance
- Test the image generation process on various devices to ensure it completes within 2 seconds.
- Optimize the widget rendering and image compression if necessary.

---

## 7. Localization (i18n)

### ARB File Updates
Add the following keys to all ARB files (`lib/l10n/`):

```json
{
  "shareStatisticsMessage": "¡Mira mi progreso en Album 26!",
  "statisticsCompletion": "Porcentaje completado: {percentage}%",
  "statisticsOwned": "Cromos propios: {owned}",
  "statisticsMissing": "Cromos faltantes: {missing}",
  "statisticsDuplicates": "Cromos repetidos: {duplicates}"
}
```

**Placeholders**:
- `percentage`: Overall completion percentage.
- `owned`: Count of owned stickers.
- `missing`: Count of missing stickers.
- `duplicates`: Count of duplicate stickers.

---

## 8. Dependencies

- **`share_plus`**: For opening the native share menu.
- **`flutter/rendering`**: For capturing widgets as images.
- **`dart:ui`**: For image manipulation and PNG encoding.

---

## 9. Testing Plan

### Unit Tests
- Test the PNG generation logic with various data inputs.
- Verify that the generated image matches the app's branding and design standards.

### Integration Tests
- Test the entire flow: tapping the share icon, generating the image, and opening the share menu.
- Test offline behavior by disabling network connectivity.

### Localization Tests
- Verify that the generated image and sharing message are correctly localized for all supported languages.

---

## 10. Deliverables

- Updated `StatisticsScreen` with the share icon.
- PNG generation logic.
- Localized sharing message.
- Comprehensive tests for the feature.
