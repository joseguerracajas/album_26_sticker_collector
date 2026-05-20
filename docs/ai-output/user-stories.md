# Feature Specification: Share User Statistics as PNG for Social Media

## 1. User Stories

### Story 1: Sharing Statistics as a PNG
**AS A** user  
**I WANT TO** share my sticker collection statistics as a visually appealing PNG image  
**SO THAT** I can showcase my progress on social media  

- **Given** I am on the Statistics page  
- **When** I tap the share icon  
- **Then** the app generates a PNG image of my statistics and opens the native share sheet to share it on social media  

---

## 2. Acceptance Criteria

### General
- The feature must be accessible via a share icon on the Statistics page.
- The generated PNG must include:
  - The app icon (transparent background from `assets/icon/app_icon.png`).
  - User statistics (e.g., total stickers collected, missing, duplicates, and completion percentage).
  - A design that aligns with the app's visual guidelines (dark theme, amber accents).
  - A footer with the app name and a call-to-action (e.g., "¡Descarga Album 26 y colecciona tus cromos del Mundial!").
- The share action must invoke the native share sheet on both Android and iOS.
- The feature must support localization (e.g., Spanish, English, etc.).
- The feature must work offline (using locally stored statistics data).

### UI/UX
- The share icon must be placed in the app bar of the Statistics page.
- Tapping the share icon must provide visual feedback (e.g., a loading spinner while the PNG is being generated).
- If the PNG generation fails, a localized error message must be shown using a SnackBar.

### Performance
- PNG generation must not block the main UI thread.
- The generated PNG size must be optimized for social media sharing (e.g., 1080x1080 pixels).

---

## 3. Data Model Impact

### Supabase
- **No changes required.** The feature will use locally stored statistics data.

### Brick Models
- **No changes required.** The feature will use existing Brick models for statistics data.

---

## 4. UI Flow Description

### Screens
1. **Statistics Page** (`lib/features/inventory/presentation/statistics_page.dart`):
   - Add a share icon (`Icons.share`) to the app bar.

### Navigation Flow
1. User navigates to the **Statistics Page**.
2. User taps the share icon in the app bar.
3. The app generates a PNG image of the statistics.
4. The native share sheet is invoked, allowing the user to share the image via social media or other apps.

### Key Interactions
1. **Tapping the Share Icon**:
   - Trigger a loading spinner while the PNG is being generated.
   - Use a Flutter package like `screenshot` to capture the statistics widget as an image.
   - Overlay the app icon and footer text onto the image.
   - Save the image temporarily to the device's storage.
   - Use the `share_plus` package to invoke the native share sheet with the generated PNG.

---

## 5. Edge Cases & Constraints

### Offline Behavior
- The feature must work offline using locally stored statistics data.
- If the user has no statistics data (e.g., a new user), the share icon should be disabled or show a message like "No hay estadísticas para compartir."

### Guest User Behavior
- Guest users should have access to the feature without restrictions.
- The shared PNG should not include any personal information (e.g., email or username).

### Geographic Variant Considerations
- The statistics data should reflect the user's selected geographic variant (LATAM, Europe, USA, etc.).
- The footer text in the PNG should be localized based on the user's selected language.

### Performance Considerations
- Ensure that the PNG generation process is optimized and does not cause noticeable delays.
- The generated PNG size should be optimized for social media sharing without compromising quality.

---

## 6. Technical Implementation

### Flutter Packages
- **screenshot**: To capture the Statistics widget as an image.
- **share_plus**: To invoke the native share sheet for sharing the PNG.
- **path_provider**: To save the PNG temporarily to the device's storage.

### Steps
1. **Add Share Icon**:
   - Add a `IconButton` with `Icons.share` to the app bar of the Statistics page.

2. **Capture Statistics Widget**:
   - Wrap the statistics content in a `RepaintBoundary` widget.
   - Use the `screenshot` package to capture the widget as an image.

3. **Overlay App Icon and Footer**:
   - Use the `dart:ui` library to draw the app icon and footer text onto the captured image.

4. **Save PNG to Temporary Storage**:
   - Use the `path_provider` package to get the temporary directory.
   - Save the PNG file to the temporary directory.

5. **Invoke Native Share Sheet**:
   - Use the `share_plus` package to share the PNG file via the native share sheet.

### Code Snippets

#### Adding the Share Icon
```dart
AppBar(
  title: Text(AppLocalizations.of(context)!.statistics),
  actions: [
    IconButton(
      icon: Icon(Icons.share),
      onPressed: () async {
        await StatisticsShareService.shareStatisticsAsImage(context);
      },
    ),
  ],
);
```

#### StatisticsShareService
```dart
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:screenshot/screenshot.dart';

class StatisticsShareService {
  static final ScreenshotController _screenshotController = ScreenshotController();

  static Future<void> shareStatisticsAsImage(BuildContext context) async {
    try {
      // Capture the statistics widget
      final image = await _screenshotController.capture();

      if (image == null) throw Exception("Failed to capture image");

      // Add app icon and footer text
      final ui.Image finalImage = await _addOverlay(image);

      // Save the image to temporary storage
      final directory = await getTemporaryDirectory();
      final filePath = '${directory.path}/statistics_share.png';
      final file = await File(filePath).writeAsBytes(finalImage);

      // Share the image
      await Share.shareFiles([file.path], text: AppLocalizations.of(context)!.shareMessage);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.shareError)),
      );
    }
  }

  static Future<ui.Image> _addOverlay(Uint8List imageBytes) async {
    // Add app icon and footer text to the image
    // Implementation details go here
  }
}
```

---

## 7. Localization (i18n)

Add the following keys to `app_en.arb` and `app_es.arb`:

### English (`app_en.arb`)
```json
"statistics": "Statistics",
"shareMessage": "Check out my sticker collection progress on Album 26!",
"shareError": "Failed to share statistics. Please try again.",
"noStatisticsToShare": "No statistics available to share."
```

### Spanish (`app_es.arb`)
```json
"statistics": "Estadísticas",
"shareMessage": "¡Mira mi progreso en la colección de cromos en Album 26!",
"shareError": "No se pudieron compartir las estadísticas. Por favor, inténtalo de nuevo.",
"noStatisticsToShare": "No hay estadísticas para compartir."
```
