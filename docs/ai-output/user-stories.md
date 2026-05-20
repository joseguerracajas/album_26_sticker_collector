# Feature Specification: Export and Share Album Collection Statistics as PNG

## 1. User Stories

### User Story 1: Export Statistics as a PNG
**AS A** user of the app  
**I WANT TO** export my album collection statistics as a high-quality PNG image  
**SO THAT** I can share my progress on social media or with friends.  

**Given** I am on the Statistics page of the app  
**When** I tap on the amber-colored share icon in the AppBar  
**Then** the app generates a high-quality PNG image of my collection statistics and opens the device's native share menu to share the image.  

---

### User Story 2: Localization of Shared Content
**AS A** user of the app  
**I WANT TO** have all text in the generated PNG image and the sharing message localized to my selected language  
**SO THAT** I can share my progress in my preferred language.  

**Given** I have selected a specific language in the app settings  
**When** I generate and share my album collection statistics  
**Then** the text in the generated PNG and the sharing message is displayed in my selected language.  

---

### User Story 3: Offline Support for Exporting Statistics
**AS A** user of the app  
**I WANT TO** export my album collection statistics even when offline  
**SO THAT** I can share my progress without requiring an internet connection.  

**Given** I am offline  
**When** I tap on the amber-colored share icon in the AppBar  
**Then** the app generates the PNG image using locally stored data and opens the native share menu.  

---

## 2. Acceptance Criteria

### Functional
1. The amber-colored share icon is added to the AppBar of the `StatisticsScreen` (`lib/features/catalog/presentation/statistics_screen.dart`).
2. Tapping the share icon triggers the generation of a high-quality PNG image containing:
   - Overall completion percentage
   - Number of owned stickers
   - Number of missing stickers
   - Number of duplicate stickers
   - App branding (logo and colors)
3. The generated image adheres to the app's design and branding standards.
4. The app uses the device's native share menu to share the PNG image.
5. The generated PNG image and the sharing message are fully localized based on the app's current language.
6. The feature works offline by using locally stored data via existing Brick repositories and Riverpod providers.

### Non-Functional
1. The PNG image is optimized for social media sharing (e.g., 1080x1080 resolution, appropriate aspect ratio).
2. The feature does not introduce noticeable performance lag when generating the image.
3. The feature does not require additional backend changes or Supabase integration.
4. The feature supports all geographic variants of the album (LATAM, Europe, USA).

---

## 3. Data Model Impact

This feature does not require changes to the Supabase schema or the Brick models. It will reuse the existing data models and providers for statistics.

---

## 4. UI Flow Description

### Screens
- **Statistics Screen (`StatisticsScreen`)**:  
  The amber-colored share icon will be added to the AppBar of this screen.

### Navigation Flow
1. **User navigates to the Statistics Screen**:  
   The user opens the Statistics Screen from the app's navigation menu.
2. **User taps the share icon**:  
   The amber-colored share icon is located in the AppBar. Tapping it triggers the PNG generation and sharing process.
3. **PNG generation and sharing**:  
   - The app generates a high-quality PNG image of the user's statistics.
   - The app opens the device's native share menu with the generated PNG preloaded.

### Key Interactions
- **Amber-colored share icon**:  
  - Positioned in the AppBar of the Statistics Screen.
  - Tooltip: "Compartir estadísticas" (localized).
- **Native share menu**:  
  - Automatically opens after the PNG is generated.
  - Allows the user to select a sharing method (e.g., social media, messaging apps).

---

## 5. Edge Cases & Constraints

### Offline Behavior
- The feature must work offline by relying on locally stored data via Brick repositories and Riverpod providers.
- If no data is available locally (e.g., the user has not added any stickers to their inventory), the app should display an error message:  
  **"No hay datos disponibles para compartir. Por favor, actualiza tu colección primero."**

### Guest User Behavior
- Guest users should have access to the feature without restrictions.
- The generated PNG should not include any user-specific identifiers (e.g., email, username).

### Geographic Variant Considerations
- The statistics displayed in the PNG should reflect the user's selected geographic variant (LATAM, Europe, USA).
- The app should ensure that the correct catalog data is used when generating the image.

### Localization
- All text in the PNG image and the sharing message must be dynamically localized based on the user's selected language.
- Localization strings should be added to all ARB files under `lib/l10n/`.

### Performance Considerations
- PNG generation should be optimized to avoid noticeable delays.
- The app should use Flutter's `RepaintBoundary` widget to capture the statistics widget as an image efficiently.

---

## Implementation Notes

### PNG Generation
- Use Flutter's `RepaintBoundary` widget to capture the statistics widget as an image.
- Convert the widget to a PNG using `ui.Image` and `dart:ui`.

### Sharing
- Use the `share_plus` package to open the device's native share menu.
- Ensure the generated PNG is temporarily stored in the device's cache directory before sharing.

### Localization
- Add new localization keys for the sharing message and any additional text in the PNG image:
  ```json
  {
    "shareStatisticsMessage": "¡Mira mi progreso en el álbum de cromos del Mundial 2026! 🏆",
    "shareStatisticsErrorNoData": "No hay datos disponibles para compartir. Por favor, actualiza tu colección primero."
  }
  ```

### Design
- Follow the app's existing design system for colors, fonts, and layout.
- Include the app logo (`assets/app_icon.png`) in the PNG image.

---

## Example PNG Layout

```
+----------------------------------------------------+
|                                                    |
|   [App Logo]                                       |
|                                                    |
|   ¡Mira mi progreso en el álbum de cromos!         |
|                                                    |
|   Completado: 75%                                  |
|   Cromos obtenidos: 500                            |
|   Cromos faltantes: 150                            |
|   Cromos repetidos: 50                             |
|                                                    |
|   #StickerAlbum2026                                |
|                                                    |
+----------------------------------------------------+
```
