# Feature Specification: Share User Statistics as PNG for Social Media

## 1. User Stories

### Story 1: Share Statistics as PNG
**AS A** user  
**I WANT TO** share my collection statistics as a visually appealing PNG image  
**SO THAT** I can showcase my progress on social media  

**Given** I am on the Statistics screen  
**When** I tap the "Share" action icon  
**Then** a PNG image of my statistics is generated and the native device share sheet is invoked  

---

## 2. Acceptance Criteria

1. **UI Integration**:
   - A share action icon is added to the Statistics screen AppBar.
   - The icon uses the app's design guidelines (consistent size, padding, and color).

2. **PNG Generation**:
   - The generated PNG includes:
     - User statistics (e.g., percentage completion, total stickers collected, duplicates, etc.).
     - App branding (logo from `assets/icon/app_icon.png` with a transparent background).
     - A visually appealing layout that adheres to the app's design guidelines.
   - The layout is localized to the app's supported languages (via ARB files).

3. **Native Share Sheet**:
   - Tapping the share icon invokes the native device share sheet.
   - The generated PNG is attached to the share intent.

4. **Offline Behavior**:
   - The feature works offline, using locally stored statistics data.

5. **Guest User Support**:
   - Guest users can use this feature without restrictions.

6. **Performance**:
   - PNG generation and share sheet invocation should not exceed 2 seconds on mid-tier devices.

---

## 3. Data Model Impact

No changes to the Supabase schema or Brick models are required, as the statistics data is already available in the app's local storage and provided via the existing Statistics provider.

---

## 4. UI Flow Description

### Screens & Navigation
1. **Statistics Screen**:
   - Add a share action icon (`Icons.share`) to the AppBar.
   - The icon triggers the PNG generation and invokes the native share sheet.

### Key Interactions
1. **Tap Share Icon**:
   - User taps the share icon in the AppBar.
   - A loading indicator (e.g., `CircularProgressIndicator`) is displayed while the PNG is being generated.
   - Once the PNG is ready, the native share sheet is invoked.

2. **Native Share Sheet**:
   - The share sheet displays the generated PNG as an attachment.
   - User selects a sharing option (e.g., WhatsApp, Instagram, etc.).

---

## 5. Edge Cases & Constraints

### Edge Cases
1. **Offline Mode**:
   - Ensure the feature works offline by using locally cached statistics data.
   - If no statistics data is available (e.g., first-time app use), disable the share icon and show a tooltip: "Estadísticas no disponibles para compartir."

2. **Guest Users**:
   - Guest users can access the feature without restrictions.

3. **Localization**:
   - Ensure all text in the PNG is localized to the user's selected language.
   - Update all ARB files to include new strings related to the PNG content.

4. **Incomplete Data**:
   - If some statistics are missing (e.g., no duplicates recorded), display "N/A" or a localized equivalent.

5. **Performance**:
   - Ensure PNG generation is optimized for performance to avoid blocking the UI thread.
   - Test on mid-tier devices to confirm acceptable performance.

### Constraints
1. **Design Consistency**:
   - The PNG layout must adhere to the app's design guidelines (e.g., colors, fonts, spacing).
   - The app logo must be used as branding and positioned prominently.

2. **File Size**:
   - The generated PNG file size must be optimized for social media sharing (e.g., ≤ 1 MB).

3. **Platform Compatibility**:
   - The feature must work on both iOS and Android devices.

---

## 6. Technical Implementation

### Steps
1. **Add Share Icon**:
   - Update the `StatisticsScreen` AppBar to include a `Share` icon button.
   - On tap, call a new `shareStatistics()` method.

2. **Generate PNG**:
   - Use the `RepaintBoundary` widget to capture the statistics UI as an image.
   - Render the statistics data and app branding into a custom widget.
   - Use `RepaintBoundary.toImage()` to capture the widget as an image.
   - Convert the image to PNG format using `Image.toByteData()`.

3. **Invoke Share Sheet**:
   - Use the `share_plus` package to invoke the native share sheet.
   - Attach the generated PNG to the share intent.

4. **Localization**:
   - Add new strings for the PNG content to all ARB files in `lib/l10n/`.
   - Use `AppLocalizations` to render localized text in the PNG.

5. **Testing**:
   - Test the feature on both iOS and Android devices.
   - Verify performance, localization, and offline behavior.

---

### Code Snippets

#### Add Share Icon
```dart
AppBar(
  title: Text(AppLocalizations.of(context)!.statisticsTitle),
  actions: [
    IconButton(
      icon: Icon(Icons.share),
      onPressed: () async {
        await shareStatistics(context);
      },
    ),
  ],
);
```

#### Generate PNG
```dart
Future<void> shareStatistics(BuildContext context) async {
  try {
    final boundary = globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    final image = await boundary.toImage(pixelRatio: 3.0);
    final byteData = await image.toByteData(format: ImageByteFormat.png);
    final pngBytes = byteData!.buffer.asUint8List();

    final tempDir = await getTemporaryDirectory();
    final file = await File('${tempDir.path}/statistics.png').create();
    await file.writeAsBytes(pngBytes);

    await Share.shareFiles([file.path], text: AppLocalizations.of(context)!.shareStatisticsMessage);
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(AppLocalizations.of(context)!.shareError)),
    );
  }
}
```

#### Localized Strings (Example in `app_es.arb`)
```json
{
  "statisticsTitle": "Estadísticas",
  "shareStatisticsMessage": "¡Mira mi progreso en Album 26!",
  "shareError": "Error al compartir estadísticas. Inténtalo de nuevo."
}
```

---

## 7. Testing Plan

1. **Unit Tests**:
   - Test the `shareStatistics()` method for successful PNG generation and sharing.
   - Test error handling (e.g., missing statistics data, file write errors).

2. **Integration Tests**:
   - Verify the share icon appears on the Statistics screen.
   - Test the end-to-end flow: tap share icon → generate PNG → invoke share sheet.

3. **Manual Testing**:
   - Test on both iOS and Android devices.
   - Verify localization for all supported languages.
   - Test offline behavior and guest user access.

---

## 8. Localization (i18n)

- Update all ARB files in `lib/l10n/` to include new strings for the PNG content and error messages.
- Ensure the PNG layout dynamically adjusts for text length in different languages.

---

## 9. Dependencies

- **share_plus**: Used to invoke the native device share sheet.
- **path_provider**: Used to save the generated PNG to a temporary directory.
- **RepaintBoundary**: Used to capture the statistics UI as an image.

---

## 10. Deliverables

1. Updated `StatisticsScreen` with a share icon.
2. PNG generation logic integrated into the app.
3. Localized strings for the PNG content and error messages.
4. Unit and integration tests for the new feature.
5. Documentation updates (if necessary).
