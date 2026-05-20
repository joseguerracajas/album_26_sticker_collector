# Feature Specification: Export and Share Album Collection Statistics as a PNG

## 1. User Stories

### Story 1: Export Statistics as a PNG
**AS A** user of the app  
**I WANT TO** export my album collection statistics as a high-quality PNG image  
**SO THAT** I can share my progress visually on social media or with friends.  

**Given** I am on the Statistics page of the app  
**When** I tap the amber-colored share icon in the AppBar  
**Then** a high-quality PNG image of my album statistics is generated, including the app branding and localized text.  

---

### Story 2: Share Statistics via Native Share Menu
**AS A** user of the app  
**I WANT TO** share my album collection statistics using my device's native share menu  
**SO THAT** I can easily send it to my friends or post it on social media.  

**Given** I have generated a PNG image of my album statistics  
**When** I confirm sharing the image  
**Then** the app opens the device's native share menu with the PNG image and a localized sharing message.  

---

### Story 3: Offline Support for Exporting Statistics
**AS A** user of the app  
**I WANT TO** export my statistics even when I am offline  
**SO THAT** I can share my progress without requiring an internet connection.  

**Given** I am offline and on the Statistics page  
**When** I tap the amber-colored share icon in the AppBar  
**Then** the app generates the PNG image using my locally stored statistics.  

---

## 2. Acceptance Criteria

### General
- The feature must be accessible from the existing Statistics page via an amber-colored share icon in the AppBar.
- The generated PNG image must:
  - Include the app icon (`assets/app_icon.png`) with a transparent background.
  - Follow the app's official branding and color standards.
  - Display the user's statistics (completion percentage, owned stickers, missing stickers, duplicate count).
  - Support all languages defined in the ARB files under `lib/l10n/`.
- The feature must work offline by reading local data via Brick.

### Localization
- All text in the generated PNG image must be localized based on the user's current language.
- The sharing message accompanying the image must also be localized and dynamically adapt to the user's language.

### Sharing
- The device's native share menu must be invoked after generating the PNG.
- The PNG image and a localized sharing message must be pre-filled in the share menu.

### Performance
- The PNG generation process must not block the UI for more than 2 seconds.
- The generated PNG file size must not exceed 2 MB to ensure quick sharing.

---

## 3. Data Model Impact

### Supabase
- No changes are required to the Supabase schema.

### Brick Models
- No new Brick models are required. The feature will use existing local data models for statistics.

---

## 4. UI Flow Description

### Updated Statistics Page
- **Existing Screen**: `StatisticsPage` (located in `lib/features/inventory/presentation/statistics_page.dart`).
- **New UI Element**: Add an amber-colored share icon to the AppBar of the `StatisticsPage`.

#### User Flow
1. **Access Statistics Page**: The user navigates to the Statistics page from the app's main menu.
2. **Tap Share Icon**: The user taps the amber-colored share icon in the AppBar.
3. **Generate PNG**: The app generates a high-quality PNG image of the user's statistics.
   - The image includes:
     - App icon (`assets/app_icon.png`).
     - Completion percentage.
     - Owned stickers count.
     - Missing stickers count.
     - Duplicate stickers count.
     - All text localized to the user's current language.
4. **Open Share Menu**: The app invokes the device's native share menu with:
   - The generated PNG image.
   - A localized sharing message (e.g., "¡Mira mi progreso en Album 26! 🎉").
5. **Complete Sharing**: The user selects a sharing option (e.g., WhatsApp, Instagram, etc.) and completes the action.

---

## 5. Edge Cases & Constraints

### Offline Behavior
- The feature must fully support offline usage by reading statistics from the local SQLite database via Brick.
- If the user has no statistics data stored locally, the share icon should be disabled or show a tooltip explaining that no data is available.

### Guest Users
- Guest users should be able to use this feature without restrictions.
- The generated image should not include any user-specific identifiers (e.g., username or email).

### Geographic Variants
- The statistics data should reflect the correct geographic variant of the album (LATAM, Europe, USA, etc.).
- The localized text must match the user's selected language and region.

### Performance Considerations
- The PNG generation process must be optimized to avoid blocking the main thread.
- The image resolution should be high enough for social media but not exceed 2 MB in size.

### Localization
- All text in the generated PNG image and the sharing message must be localized to the user's current language.
- Supported languages include (but are not limited to): English, Spanish, Arabic, Portuguese, French, German, Italian, etc., as defined in the ARB files.

### Design Constraints
- The PNG image must adhere to the app's branding guidelines, including colors, fonts, and layout.
- The app icon must have a transparent background and be prominently displayed on the image.

### Error Handling
- If the PNG generation fails, the app should display a localized error message (e.g., "Error al generar la imagen. Inténtalo de nuevo.").
- If the device's share menu fails to open, the app should display a localized error message (e.g., "No se pudo abrir el menú de compartir.").

---

## 6. Technical Implementation Notes

### PNG Generation
- Use the `RepaintBoundary` widget to capture the statistics UI as an image.
- Utilize the `flutter/rendering` library to convert the widget tree into a PNG file.

### Sharing
- Use the `share_plus` package to invoke the device's native share menu.
- Ensure the sharing message is dynamically localized using `AppLocalizations`.

### Localization
- Update all ARB files in `lib/l10n/` to include the following keys:
  ```json
  {
    "shareStatisticsMessage": "Check out my progress in Album 26! 🎉",
    "@shareStatisticsMessage": {
      "description": "Message to share along with the statistics image"
    }
  }
  ```
- Ensure the `intl` package is updated and `flutter pub get` is run to regenerate the `AppLocalizations` class.

### Testing
- Write unit tests for the PNG generation logic.
- Write widget tests to verify the share icon is displayed and functional on the Statistics page.
- Write integration tests to ensure the share menu is invoked with the correct image and message.

--- 

This feature will enhance user engagement by enabling users to share their progress visually, promoting the app organically through social media.
