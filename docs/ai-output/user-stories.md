# Feature Specification: Export and Share Album Collection Statistics as PNG

## 1. User Stories

### User Story 1: Export Statistics as a Shareable Image
```
AS A user
I WANT TO export my album collection statistics as a high-quality PNG image
SO THAT I can share my progress on social media or with friends.

Given I am on the Statistics page
When I tap the Amber-colored share icon in the AppBar
Then a high-quality PNG image of my statistics is generated and the native share menu is opened.
```

### User Story 2: Localization of Exported Content
```
AS A user
I WANT the text in the exported image and sharing message to match my app's current language
SO THAT the content is relevant to my language preferences.

Given my app is set to a specific language
When I export my statistics
Then the text in the generated PNG and the sharing message is localized to my selected language.
```

### User Story 3: Offline Support for Export
```
AS A user
I WANT to export my statistics even when offline
SO THAT I can share my progress without requiring an internet connection.

Given I am offline
When I tap the share icon
Then the statistics are generated from local data and the native share menu is opened.
```

---

## 2. Acceptance Criteria

1. **UI Integration**:
   - The share icon is Amber-colored and located in the AppBar of the `StatisticsScreen` (`lib/features/catalog/presentation/statistics_screen.dart`).
   - Tapping the icon triggers the export and opens the native share menu.

2. **Image Generation**:
   - The PNG image includes:
     - App icon (transparent, `assets/app_icon.png`).
     - Overall completion percentage.
     - Owned vs. missing stickers count.
     - Duplicate count.
     - App branding and colors.
   - The design adheres to the app's official branding and color standards.

3. **Localization**:
   - All text in the generated image is dynamically localized based on the user's current language.
   - The sharing message accompanying the image is also localized.

4. **Offline Support**:
   - The image generation uses local data from the Brick repository when offline.
   - No internet connection is required to generate the image or open the native share menu.

5. **Performance**:
   - The image generation process should not exceed 2 seconds.
   - The feature should not block the UI thread.

6. **Error Handling**:
   - If image generation fails, display a localized error message: "Error al generar la imagen. Por favor, inténtalo de nuevo."
   - If the native share menu fails to open, display a localized error message: "Error al abrir el menú de compartir."

---

## 3. Data Model Impact

No changes to the Supabase schema or Brick models are required. The feature will rely on existing Riverpod providers and the Brick repository to fetch the necessary statistics data.

---

## 4. UI Flow Description

### Screens and Navigation
- **StatisticsScreen (`lib/features/catalog/presentation/statistics_screen.dart`)**:
  - Add an Amber-colored share icon to the AppBar.
  - Tapping the icon triggers the export and opens the native share menu.

### Key Interactions
1. **User taps the share icon**:
   - The app fetches the user's statistics (completion percentage, owned/missing stickers, duplicate count) from the existing Riverpod providers.
   - A high-quality PNG image is generated using the fetched data and app branding.
   - The native share menu is opened with the generated image and a localized sharing message.

2. **Native share menu**:
   - The user selects a sharing option (e.g., social media, messaging app).
   - The image and message are shared via the selected platform.

---

## 5. Edge Cases & Constraints

### Offline Behavior
- The feature must work offline by using local data from the Brick repository.
- If local data is unavailable (e.g., first-time app use without internet), display a localized error message: "No hay datos disponibles para exportar."

### Guest User Behavior
- Guest users can use the feature without restrictions.
- The sharing message should not include any user-specific information (e.g., username) for guest users.

### Geographic Variant Considerations
- The statistics data should reflect the user's selected geographic variant (e.g., LATAM, Europe, USA).
- Ensure the localized text in the image matches the selected variant's language.

### Performance Considerations
- The image generation process must be optimized to avoid blocking the UI thread.
- Use Flutter's `RepaintBoundary` widget to capture the statistics widget as an image efficiently.

### Design Constraints
- The PNG image must strictly adhere to the app's branding and color standards.
- The app icon (`assets/app_icon.png`) must be included in the image with a transparent background.

### Localization
- Update all ARB files under `lib/l10n/` to include new keys for the localized text in the image and sharing message.

---

## Implementation Notes

### Image Generation
- Use Flutter's `RepaintBoundary` widget to capture the statistics widget as an image.
- Convert the captured widget to a PNG using `ui.Image.toByteData()` and `ByteData.buffer.asUint8List()`.

### Native Share Menu
- Use the `share_plus` package to open the native share menu with the generated PNG and localized message.

### Localization Keys
Add the following keys to all ARB files in `lib/l10n/`:
```json
"shareStatisticsMessage": "¡Mira mi progreso en el álbum de cromos del Mundial 2026! He completado el {completionPercentage}% del álbum. ¿Qué tal tú?",
"shareErrorImageGeneration": "Error al generar la imagen. Por favor, inténtalo de nuevo.",
"shareErrorMenu": "Error al abrir el menú de compartir.",
"statisticsCompletion": "Progreso: {completionPercentage}%",
"statisticsOwned": "Cromos obtenidos: {ownedCount}",
"statisticsMissing": "Cromos faltantes: {missingCount}",
"statisticsDuplicates": "Cromos repetidos: {duplicateCount}"
```

### Example Sharing Message
- **Spanish**: "¡Mira mi progreso en el álbum de cromos del Mundial 2026! He completado el 75% del álbum. ¿Qué tal tú?"
- **English**: "Check out my progress in the FIFA World Cup 2026 sticker album! I've completed 75% of the album. How about you?"

### Error Handling
- Wrap the image generation and sharing logic in a `try-catch` block.
- Display localized error messages using the `ScaffoldMessenger`.

---

## Technical Tasks

1. **Add Share Icon**:
   - Update `StatisticsScreen` AppBar to include an Amber-colored share icon.

2. **Generate PNG Image**:
   - Use `RepaintBoundary` to capture the statistics widget.
   - Convert the captured widget to a PNG image.

3. **Open Native Share Menu**:
   - Use the `share_plus` package to open the native share menu with the generated image and localized message.

4. **Localization**:
   - Add new keys to ARB files for the localized text in the image and sharing message.
   - Update `AppLocalizations` to include the new keys.

5. **Error Handling**:
   - Display localized error messages for image generation and share menu failures.

6. **Testing**:
   - Test the feature on both iOS and Android devices.
   - Verify functionality in online and offline scenarios.
   - Test localization for all supported languages.

---

## Estimated Effort

- **UI Updates**: 2 hours
- **Image Generation**: 4 hours
- **Native Share Integration**: 2 hours
- **Localization Updates**: 2 hours
- **Testing and Debugging**: 4 hours
- **Total Estimate**: ~12 hours
