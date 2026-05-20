# Feature Specification: Export and Share Album Collection Statistics as PNG

## 1. User Stories

### Story 1: Export Statistics as a PNG
**AS A** user  
**I WANT TO** export my album collection statistics as a high-quality PNG image  
**SO THAT** I can share my progress visually on social media or with friends.  

**Given** I am on the Statistics page  
**When** I tap the amber-colored share icon in the AppBar  
**Then** a PNG image of my album collection statistics is generated and the device's native share menu is displayed, allowing me to share the image.

---

## 2. Acceptance Criteria

1. **UI Integration**
   - The amber-colored share icon is added to the AppBar of the `StatisticsScreen` (`lib/features/catalog/presentation/statistics_screen.dart`).
   - The icon is visible and functional for all users, including guest users.
   - The icon is styled according to the app's design guidelines.

2. **Image Generation**
   - The generated PNG image includes:
     - Overall album completion percentage.
     - Counts of owned, missing, and duplicate stickers.
     - The app logo (`assets/app_icon.png`) with transparency.
     - Branding and color standards matching the app's design.
   - The image dynamically adapts to the user's current language (based on the app's localization settings).

3. **Sharing Functionality**
   - Tapping the share icon generates the PNG image and opens the device's native share menu.
   - The share menu allows users to share the image via supported apps (e.g., WhatsApp, Instagram, Email).

4. **Offline Support**
   - The feature works offline by utilizing local data from Brick providers.
   - If the user is offline, the generated image reflects the latest locally synced data.

5. **Localization**
   - All text in the generated image is localized based on the user's current language.
   - The sharing message accompanying the image is also localized.

6. **Performance**
   - The image generation process is optimized to ensure minimal delay.
   - The app does not freeze or crash during the image generation and sharing process.

---

## 3. Data Model Impact

No changes are required to the Supabase schema or Brick models, as the feature relies entirely on existing data from the `StatisticsScreen` and its associated providers.

---

## 4. UI Flow Description

### Screens and Navigation
- **Existing Screen Modified**: `StatisticsScreen` (`lib/features/catalog/presentation/statistics_screen.dart`).
  - Add an amber-colored share icon to the AppBar.
  - The share icon triggers the PNG generation and sharing process.

### Key Interactions
1. **Accessing the Share Icon**
   - The user navigates to the `StatisticsScreen`.
   - The amber-colored share icon is visible in the AppBar.

2. **Tapping the Share Icon**
   - The user taps the share icon.
   - A loading indicator is displayed while the PNG image is being generated.
   - Once the image is generated, the device's native share menu is displayed.

3. **Sharing the Image**
   - The user selects an app from the share menu (e.g., WhatsApp, Instagram).
   - The image is shared via the selected app.

---

## 5. Edge Cases & Constraints

### Offline Behavior
- The feature must work offline, using data from local Brick repositories.
- If the user has never synced their data and no local data is available, the share icon should be disabled, and a tooltip should display: "Sin datos disponibles para compartir" (No data available to share).

### Guest User Behavior
- The feature is fully available to guest users.
- The generated image should not include any user-specific identifiers (e.g., email, username).

### Geographic Variant Considerations
- The statistics in the generated image should reflect the user's selected geographic variant (e.g., LATAM, Europe, USA).
- The image layout and text should adapt to the selected language.

### Performance Considerations
- The image generation process should be optimized to avoid blocking the UI thread.
- Use Flutter's `RepaintBoundary` widget to capture the statistics widget as an image.
- Ensure the generated PNG file size is optimized for sharing on social media (e.g., <1MB).

### Localization
- All text in the generated image must be localized using the app's existing ARB files (`lib/l10n/`).
- The sharing message must also be localized, e.g.,  
  - **English**: "Check out my FIFA World Cup 2026 album progress! 🏆"  
  - **Spanish**: "¡Mira mi progreso en el álbum del Mundial 2026! 🏆"

---

## Implementation Steps

### 1. Add Share Icon to AppBar
- Modify `StatisticsScreen` (`lib/features/catalog/presentation/statistics_screen.dart`) to include an amber-colored share icon in the AppBar.
- Use `IconButton` with an `onPressed` callback to trigger the sharing process.

### 2. Generate PNG Image
- Wrap the statistics widget in a `RepaintBoundary` widget to enable rendering it as an image.
- Use Flutter's `RepaintBoundary` and `RenderRepaintBoundary.toImage()` to capture the widget as an image.
- Convert the image to a PNG file using `ui.Image.toByteData()` and save it as a temporary file.

### 3. Implement Sharing Functionality
- Use the `share_plus` package to open the device's native share menu.
- Pass the generated PNG file to the `Share.shareFiles()` method.

### 4. Localization
- Update all ARB files in `lib/l10n/` to include translations for:
  - The sharing message (e.g., "Check out my FIFA World Cup 2026 album progress! 🏆").
- Ensure the text in the generated image dynamically adapts to the user's current language.

### 5. Testing
- Test the feature on both Android and iOS devices.
- Verify that the feature works offline and for guest users.
- Test the feature with different geographic variants and languages.

---

## Example Code Snippet

```dart
IconButton(
  icon: Icon(Icons.share, color: Colors.amber),
  onPressed: () async {
    try {
      // Capture statistics widget as PNG
      final boundary = repaintBoundaryKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      final image = await boundary.toImage(pixelRatio: 2.0);
      final byteData = await image.toByteData(format: ImageByteFormat.png);
      final pngBytes = byteData!.buffer.asUint8List();

      // Save PNG to temporary file
      final tempDir = await getTemporaryDirectory();
      final file = File('${tempDir.path}/album_statistics.png');
      await file.writeAsBytes(pngBytes);

      // Share the file
      await Share.shareFiles([file.path], text: AppLocalizations.of(context)!.shareMessage);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.commonErrorWithMessage(message: e.toString()))),
      );
    }
  },
),
```

---

## 6. Future Enhancements
- Add customization options for the generated image (e.g., themes, layouts).
- Allow users to include their profile picture or username in the image (for authenticated users).
