# Feature Specification: Export and Share Album Collection Statistics as PNG

## 1. User Stories

### User Story 1: Export Statistics as a PNG Image
**AS A** user of the app  
**I WANT TO** export my album collection statistics as a high-quality PNG image  
**SO THAT** I can share my progress with others on social media or via messaging apps  

**Given** I am on the Statistics page  
**When** I tap the amber-colored share icon in the AppBar  
**Then** a PNG image is generated with my album statistics and the app branding, and the device's native share menu is displayed  

---

## 2. Acceptance Criteria

1. **UI Integration**:
   - The amber-colored share icon is added to the AppBar of the existing `StatisticsScreen` (`lib/features/catalog/presentation/statistics_screen.dart`).
   - Tapping the share icon triggers the export and share functionality.

2. **Image Generation**:
   - The generated PNG image includes:
     - The app's transparent logo (`assets/app_icon.png`).
     - The user's album completion percentage.
     - The total number of owned, missing, and duplicate stickers.
     - Branding and color standards consistent with the app's design.
   - All text in the image is localized based on the user's current language setting.

3. **Sharing Functionality**:
   - The app invokes the device's native share menu using the `share_plus` package.
   - The generated PNG image is attached to the share intent.
   - The share message is localized and includes a link to the app's download page.

4. **Offline Support**:
   - The statistics data for the image is retrieved from the local Brick repository to ensure offline functionality.

5. **Performance**:
   - The image generation process should not cause noticeable delays or UI freezes.
   - The generated image should be optimized for social media sharing (e.g., 1080x1080 resolution).

6. **Error Handling**:
   - If the image generation or sharing process fails, the user is shown a localized error message via a SnackBar.

---

## 3. Data Model Impact

No changes to the Supabase schema or Brick models are required, as the necessary statistics data (e.g., owned, missing, duplicates, completion percentage) is already available via existing Riverpod providers and the Brick repository.

---

## 4. UI Flow Description

### Screens and Navigation
- **Existing Screen**: `StatisticsScreen` (`lib/features/catalog/presentation/statistics_screen.dart`)
  - Add an amber-colored share icon to the AppBar.
  - On tapping the share icon:
    1. Generate a PNG image containing the user's statistics.
    2. Display the device's native share menu with the generated image attached.

### Key Interactions
1. **Tapping the Share Icon**:
   - Triggers the image generation process.
   - Invokes the native share menu with the generated PNG attached.

2. **Image Design**:
   - The image includes:
     - App logo (top-center).
     - Title: "Mi progreso en el álbum de stickers 2026" (localized).
     - Completion percentage (e.g., "Completado: 75%").
     - Owned, missing, and duplicate counts (e.g., "Cromos: 500/670, Faltantes: 170, Repetidos: 50").
     - App branding (e.g., "Descarga la app: Album 26").
   - The design uses the app's primary color palette (amber, dark gray, white).

3. **Sharing**:
   - The `share_plus` package is used to invoke the device's native share menu.
   - The share message is localized and includes a link to the app's download page (e.g., "¡Mira mi progreso en el álbum de stickers del Mundial 2026! Descarga la app aquí: [link]").

---

## 5. Edge Cases & Constraints

### Offline Behavior
- The statistics data is retrieved from the local Brick repository to ensure offline functionality.
- If the app is offline, the feature works seamlessly without requiring a network connection.

### Guest User Behavior
- Guest users can use the feature without restrictions.
- The generated image does not include any user-specific identifiers (e.g., username or email).

### Geographic Variants
- The statistics data reflects the user's selected geographic variant (e.g., LATAM, Europe, USA).
- Localization ensures that all text in the image is displayed in the user's selected language.

### Performance Considerations
- The image generation process must be efficient and avoid blocking the UI thread.
- The generated PNG image is optimized for social media sharing (e.g., 1080x1080 resolution).

### Error Handling
- If image generation fails, the user is shown a localized error message via a SnackBar (e.g., "Error al generar la imagen. Inténtalo de nuevo.").
- If the share intent fails, the user is notified with a localized error message.

---

## Implementation Notes

1. **Image Generation**:
   - Use the `flutter_canvas` or `dart:ui` library to create a custom PNG image.
   - Ensure the image adheres to the app's branding and design standards.

2. **Localization**:
   - Add new keys to the ARB files in `lib/l10n/` for the share message and image text.
   - Ensure all text in the image and share message is localized.

3. **Integration with `share_plus`**:
   - Use the `share_plus` package to invoke the native share menu.
   - Attach the generated PNG image to the share intent.

4. **Testing**:
   - Test the feature on both iOS and Android devices.
   - Verify that the feature works offline and with different language settings.
   - Ensure the generated image displays correctly on popular social media platforms.
