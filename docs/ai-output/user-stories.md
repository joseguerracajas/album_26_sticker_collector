# Feature Specification: Export and Share Album Statistics as PNG

## 1. User Stories

### User Story 1: Export Statistics as a PNG
**AS A** user of the app  
**I WANT TO** export my album collection statistics as a high-quality PNG image  
**SO THAT** I can share my progress visually on social media or with friends.  

- **Given** I am on the Statistics page  
- **When** I tap the Amber-colored share icon in the AppBar  
- **Then** a PNG image of my statistics is generated, styled according to the app's branding, and the device's native share menu is invoked.

---

## 2. Acceptance Criteria

1. **UI Integration**  
   - The share icon must be Amber-colored and placed in the AppBar of the `StatisticsScreen` (`lib/features/catalog/presentation/statistics_screen.dart`).
   - The icon must have a tooltip labeled "Compartir estadísticas" (localized).

2. **Image Generation**  
   - The PNG must include:
     - The app's transparent icon (`assets/app_icon.png`) at the top.
     - The user's album completion percentage.
     - The number of stickers owned, missing, and duplicates.
     - A footer with the app name and tagline (localized).
   - The design must follow the app's branding (colors, fonts, and layout).

3. **Localization**  
   - All text in the generated PNG must be localized using the ARB files in `lib/l10n/`.
   - The sharing message accompanying the image must also be localized.

4. **Native Sharing**  
   - The generated PNG must be passed to the device's native share menu using the `share_plus` package.
   - The sharing message must include the app name and a call-to-action, e.g., "¡Mira mi progreso en Album 26!".

5. **Offline Support**  
   - The feature must work offline by retrieving statistics from the local Brick database.

6. **Performance**  
   - The image generation process must complete within 2 seconds on a mid-range device.
   - The image file size must not exceed 1MB to ensure smooth sharing on social media platforms.

---

## 3. Data Model Impact

No changes to the Supabase schema or Brick models are required, as the feature will reuse existing data from the `StatisticsScreen` and its associated Riverpod providers.

---

## 4. UI Flow Description

### Screens and Navigation
- **Existing Screen**: `StatisticsScreen` (`lib/features/catalog/presentation/statistics_screen.dart`)
  - Add an Amber-colored share icon to the AppBar.
  - Tapping the icon triggers the PNG generation and invokes the native share menu.

### Key Interactions
1. **Trigger Sharing**  
   - User taps the share icon in the AppBar.
   - The app retrieves the current statistics from the existing Riverpod providers.
   - A PNG image is generated using Flutter's `Canvas` and `CustomPainter`.
   - The image is saved temporarily to the device's storage.

2. **Invoke Native Share Menu**  
   - The `share_plus` package is used to invoke the native share menu.
   - The generated PNG and a localized sharing message are passed to the share menu.

---

## 5. Edge Cases & Constraints

### Offline Behavior
- The feature must function offline by retrieving statistics from the local SQLite database via Brick.
- If the statistics cannot be retrieved (e.g., corrupted local data), an error message must be displayed: "No se pudieron cargar las estadísticas. Intenta de nuevo."

### Guest User Behavior
- Guest users must be able to use the feature without restrictions.
- The sharing message should not include any user-specific identifiers, as guest users do not have accounts.

### Geographic Variants
- The statistics must reflect the user's selected geographic variant (e.g., LATAM, Europe, USA).
- Ensure that the correct catalog variant is used when calculating statistics.

### Performance Considerations
- The PNG generation process must be optimized to complete within 2 seconds.
- The image resolution must be high enough for social media sharing but not exceed 1MB in file size.
- Use efficient Flutter rendering techniques (e.g., `RepaintBoundary`).

### Design Constraints
- The PNG must strictly adhere to the app's branding guidelines (colors, fonts, logo placement).
- The layout must be responsive to different screen sizes and orientations.

### Localization
- All text in the PNG and the sharing message must be localized using the ARB files in `lib/l10n/`.
- Ensure that the text dynamically adapts to the user's current language.

---

## Implementation Notes

### Steps for Implementation
1. **Add Share Icon**  
   - Update the AppBar in `StatisticsScreen` to include an Amber-colored share icon with a tooltip ("Compartir estadísticas").

2. **Retrieve Statistics**  
   - Use the existing Riverpod providers to fetch the user's statistics (completion percentage, owned, missing, duplicates).

3. **Generate PNG**  
   - Use Flutter's `Canvas` and `CustomPainter` to create the PNG image.
   - Include the app icon, statistics, and footer text in the image.

4. **Save PNG Temporarily**  
   - Save the generated PNG to the device's temporary storage using the `path_provider` package.

5. **Invoke Native Share Menu**  
   - Use the `share_plus` package to invoke the native share menu.
   - Pass the PNG file and a localized sharing message to the share menu.

6. **Localization**  
   - Update all ARB files in `lib/l10n/` to include the following keys:
     ```json
     {
       "shareStatisticsTooltip": "Compartir estadísticas",
       "shareStatisticsMessage": "¡Mira mi progreso en Album 26! He completado el {percentage}% de mi álbum. Descarga la app y colecciona conmigo: {appLink}"
     }
     ```
   - Replace `{percentage}` and `{appLink}` dynamically at runtime.

---

## Example PNG Layout

```
+-----------------------------------+
|        [App Icon - Centered]      |
|                                   |
|   ¡Mira mi progreso en Album 26!  |
|                                   |
|   Progreso: 75%                  |
|   Stickers: 500/670              |
|   Duplicados: 120                |
|                                   |
|       [App Name + Tagline]        |
+-----------------------------------+
```

---

## Packages to Use
- **`share_plus`**: For invoking the native share menu.
- **`path_provider`**: For saving the PNG temporarily.
- **`flutter_canvas`**: For generating the PNG image.

---

## Out of Scope
- No changes to the backend or Supabase schema.
- No additional screens or navigation changes.
