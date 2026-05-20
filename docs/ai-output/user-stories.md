# Feature Specification: Export and Share Album Collection Statistics as PNG

## 1. User Stories

### Story 1: Export Statistics as a PNG
```
AS A user
I WANT TO export my album collection statistics as a PNG image
SO THAT I can share my progress visually on social media.
```
**Given** I am on the Statistics page,  
**When** I tap on the amber-colored share icon in the AppBar,  
**Then** a high-quality PNG image of my album collection statistics is generated,  
**And** the device's native share menu is opened to share the image.

---

### Story 2: Localized Text in Exported Image
```
AS A user
I WANT the text in the exported image to match my app's language
SO THAT I can share it in my preferred language.
```
**Given** my app is set to a specific language (e.g., Spanish),  
**When** I export my statistics as a PNG image,  
**Then** all text in the image (e.g., "Completion Percentage") is displayed in the selected language.

---

### Story 3: Offline Support for Exporting
```
AS A user
I WANT to export my statistics even when offline
SO THAT I can share my progress without requiring an internet connection.
```
**Given** I am offline,  
**When** I tap the share icon to export my statistics,  
**Then** the app generates the PNG image using locally stored data,  
**And** the native share menu is still invoked.

---

## 2. Acceptance Criteria

### General
- The amber-colored share icon is added to the AppBar of the existing `StatisticsScreen`.
- Tapping the share icon generates a PNG image of the statistics and opens the device's native share menu.
- The exported image includes:
  - App branding (transparent app icon from `assets/app_icon.png`).
  - Completion percentage, owned vs. missing stickers, and duplicate count.
  - Styling that adheres to the app's design and branding standards.
- The feature works offline by using local data from Brick repositories.
- The exported image and sharing message are fully localized based on the app's current language.

### Image Design
- The image is high-quality and optimized for social media sharing.
- The image dimensions are suitable for platforms like Instagram Stories (e.g., 1080x1920 px).
- The image includes:
  - A header with the app icon and title ("Sticker Album 2026").
  - A progress bar or percentage for album completion.
  - A breakdown of owned, missing, and duplicate stickers.
  - A footer with a call-to-action (e.g., "Download Album 26 Sticker Collector").

### Localization
- All text in the image is localized using the app's ARB files.
- The sharing message is also localized (e.g., "Check out my Sticker Album 2026 progress!").

### Offline Behavior
- The feature works seamlessly offline by reading data from local Brick repositories.
- If the user is offline, no network calls are made.

---

## 3. Data Model Impact

No changes to the Supabase schema or Brick models are required. The feature will reuse existing providers and repositories to fetch statistics data.

---

## 4. UI Flow Description

### Screens and Navigation
- **Modified Screen**: `StatisticsScreen` (`lib/features/catalog/presentation/statistics_screen.dart`)
  - Add an amber-colored share icon (`Icons.share`) to the AppBar.
  - On tapping the share icon:
    1. Fetch statistics data (e.g., completion percentage, owned/missing/duplicate counts) using existing providers.
    2. Generate a PNG image using Flutter's `RepaintBoundary` and `ui.Image` APIs.
    3. Save the image to a temporary directory using the `path_provider` package.
    4. Invoke the native share menu using the `share_plus` package.

### Key Interactions
1. **User taps the share icon**:
   - Trigger the image generation process.
   - Show a loading indicator while the image is being generated.
2. **Image generation completes**:
   - Save the image locally.
   - Open the native share menu with the image and a localized sharing message.
3. **User selects a sharing option**:
   - The image and message are shared via the selected platform (e.g., WhatsApp, Instagram, etc.).

---

## 5. Edge Cases & Constraints

### Offline Behavior
- Ensure the feature works offline by fetching data from the local Brick repositories.
- Avoid any network calls when offline.

### Guest User Behavior
- The feature should work for guest users without requiring authentication.
- Guest users should be able to share their statistics without restrictions.

### Geographic Variants
- Ensure the statistics and text in the image respect the user's selected geographic variant (e.g., LATAM, Europe, USA).

### Localization
- All text in the image and sharing message must be localized using the app's ARB files.
- Ensure placeholders (e.g., `{percentage}`) are replaced with the correct localized values.

### Performance Considerations
- Optimize the image generation process to avoid blocking the UI thread.
- Use efficient image rendering techniques (e.g., `RepaintBoundary`) to ensure high-quality output without performance degradation.

### Design Constraints
- The image must strictly adhere to the app's branding and design standards.
- The image should be visually appealing and optimized for social media platforms.

### File Management
- Ensure the generated image is saved to a temporary directory and deleted after sharing to avoid unnecessary storage usage.

### Error Handling
- If image generation fails, show an error message (e.g., "Failed to generate image. Please try again.").
- If the native share menu cannot be opened, show an error message (e.g., "Unable to open sharing options.").

---

## 6. Technical Implementation Details

### Image Generation
- Use `RepaintBoundary` to capture the widget tree as an image.
- Use the `ui.Image` and `dart:ui` libraries to convert the widget to a PNG file.
- Save the PNG file to a temporary directory using the `path_provider` package.

### Sharing
- Use the `share_plus` package to invoke the native share menu.
- Include a localized sharing message (e.g., "Check out my Sticker Album 2026 progress!").

### Localization
- Add new keys to the ARB files for any text used in the image and sharing message.
- Ensure the `AppLocalizations` class is updated to include the new keys.

### Code Changes
- **`lib/features/catalog/presentation/statistics_screen.dart`**:
  - Add the share icon to the AppBar.
  - Implement the logic for generating and sharing the PNG image.
- **`lib/l10n/`**:
  - Add new keys to the ARB files for localized text in the image and sharing message.

---

## 7. Example ARB Additions

### `app_en.arb`
```json
{
  "shareStatisticsTitle": "Sticker Album 2026",
  "shareStatisticsMessage": "Check out my Sticker Album 2026 progress!",
  "shareStatisticsCompletion": "Completion: {percentage}%",
  "shareStatisticsOwned": "Owned: {owned}",
  "shareStatisticsMissing": "Missing: {missing}",
  "shareStatisticsDuplicates": "Duplicates: {duplicates}"
}
```

### `app_es.arb`
```json
{
  "shareStatisticsTitle": "Álbum de Stickers 2026",
  "shareStatisticsMessage": "¡Mira mi progreso en el Álbum de Stickers 2026!",
  "shareStatisticsCompletion": "Completado: {percentage}%",
  "shareStatisticsOwned": "Obtenidos: {owned}",
  "shareStatisticsMissing": "Faltantes: {missing}",
  "shareStatisticsDuplicates": "Repetidos: {duplicates}"
}
```

---

This feature is scoped to ensure minimal disruption to the existing codebase while leveraging existing providers and adhering to the app's architecture and design principles.
