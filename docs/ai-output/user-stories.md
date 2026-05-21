# 🔵 Product Manager AI — Feature Specification

## Feature: Export & Share Statistics for Instagram (Canvas Replication)

Based on the feature request, here is the detailed product specification for implementing the Statistics Export & Share functionality. 

---

### 1. User Stories

**Story 1: Export and Share Progress**
```text
AS A collector
I WANT TO export my global progress card as a high-resolution image
SO THAT I can share my collection milestones on Instagram Stories, Feed, or other social media platforms.

Given I am on the StatisticsScreen
When I tap the share icon in the AppBar
Then the app should generate an image of my progress card and open the native share menu.
```

**Story 2: Localized Sharing Experience**
```text
AS A global user
I WANT TO share my progress with a pre-filled message in my native language
SO THAT my friends can understand the message and download the app via the provided link.

Given my device is set to a supported language (e.g., Japanese)
When I share my statistics
Then the pre-filled text in the native share menu should be translated to Japanese.
```

---

### 2. Acceptance Criteria

- [ ] **UI Trigger**: An Amber-colored `IconButton` (e.g., `Icons.share`) is added to the `AppBar` of `lib/features/catalog/presentation/statistics_screen.dart`.
- [ ] **Canvas Generation**: Tapping the icon triggers a `CustomPainter` routine that draws a 1080x1920 (or 1080x1350) canvas.
- [ ] **Visual Accuracy**: The canvas must have a dark background (`#121212` or `#1E1E1E`). The gold gradient `_GlobalProgressCard` must be drawn perfectly centered, matching the existing UI's gradients, typography, and layout.
- [ ] **Branding**: `assets/icon/app_icon.png` and the localized `appTitle` are drawn tastefully at the top or bottom of the canvas.
- [ ] **State Integration**: The image generation logic is integrated into the existing `StatisticsProvider` (or directly in the screen using existing state). **No new files or state management classes are created.**
- [ ] **Native Share**: The generated `Canvas` is converted to a PNG byte array, saved to a temporary directory, and shared using the existing `share_plus` package.
- [ ] **Localization (Strict)**: The 11 specified `.arb` files are updated (appended only) with the keys `shareStatisticsTooltip` and `shareStatisticsMessage`. The message must dynamically accept `{percentage}` and `{appLink}`.
- [ ] **No Data Loss**: Existing ARB keys are untouched.

---

### 3. Data Model Impact

- **Supabase (PostgreSQL)**: No changes required.
- **Brick Models (Offline-first)**: No changes required.
- **Relationships**: No changes required.
- *Note*: This feature relies entirely on local UI rendering (Canvas) and existing state from `StatisticsProvider`.

---

### 4. UI Flow Description

**Screens Needed:**
- Modifications to existing `StatisticsScreen` (`lib/features/catalog/presentation/statistics_screen.dart`).

**Navigation Flow:**
1. User navigates to the Statistics tab/screen.
2. User taps the Amber share icon in the top right of the `AppBar`.
3. *(Optional but recommended)* A brief loading overlay or indicator appears while the Canvas renders and encodes the PNG (to prevent UI freezing).
4. The OS native share bottom sheet appears (via `share_plus`), displaying the generated image and the localized text.
5. User selects a target app (Instagram, WhatsApp, etc.) and completes the share.

**Key Interactions:**
- The `CustomPainter` must accurately read the current progress percentage and counts from the `StatisticsProvider` to render the text on the canvas.
- The `{appLink}` parameter in the share message should point to the app's store link or landing page (can be a hardcoded constant in the provider for now if a dynamic link service isn't set up).

---

### 5. Edge Cases & Constraints

- **Offline Behavior**: This feature must work 100% offline. The Canvas generation is local. The native share menu will still open, though the `{appLink}` won't be clickable by the recipient until they have an internet connection.
- **Guest Users**: Guest users should be able to share their local progress just like authenticated users. No auth checks should block this feature.
- **Geographic Variants**: The progress percentage and counts drawn on the canvas must reflect the currently selected geographic variant (LATAM, Europe, USA). Since we are reusing `StatisticsProvider`, this should be handled automatically.
- **Performance Considerations**: 
  - Generating a 1080x1920 image and encoding it to PNG can be CPU-intensive. The `Picture.toImage()` and `Image.toByteData()` calls should be handled carefully so they don't drop frames.
  - Ensure the temporary file created for `share_plus` is written to the correct temporary directory (`getTemporaryDirectory()` from `path_provider`) to avoid OS permission issues on Android 13+ and iOS.

---

### 🌐 Appendix: ARB Translations Required

To strictly comply with the ARB policy, append the following key-value pairs to the end of the respective `lib/l10n/app_*.arb` files (before the final closing brace `}`).

**1. `lib/l10n/app_en.arb`**
```json
  "shareStatisticsTooltip": "Share statistics",
  "shareStatisticsMessage": "Check out my progress in Album 26! I have completed {percentage}% of my album. Download the app and collect with me: {appLink}"
```

**2. `lib/l10n/app_es.arb`**
```json
  "shareStatisticsTooltip": "Compartir estadísticas",
  "shareStatisticsMessage": "¡Mira mi progreso en Album 26! He completado el {percentage}% de mi álbum. Descarga la app y colecciona conmigo: {appLink}"
```

**3. `lib/l10n/app_ar.arb`**
```json
  "shareStatisticsTooltip": "مشاركة الإحصائيات",
  "shareStatisticsMessage": "تحقق من تقدمي في Album 26! لقد أكملت {percentage}% من ألبومي. قم بتنزيل التطبيق واجمع معي: {appLink}"
```

**4. `lib/l10n/app_de.arb`**
```json
  "shareStatisticsTooltip": "Statistiken teilen",
  "shareStatisticsMessage": "Sieh dir meinen Fortschritt in Album 26 an! Ich habe {percentage}% meines Albums vervollständigt. Lade die App herunter und sammle mit mir: {appLink}"
```

**5. `lib/l10n/app_fa.arb`**
```json
  "shareStatisticsTooltip": "اشتراک‌گذاری آمار",
  "shareStatisticsMessage": "پیشرفت من را در Album 26 ببینید! من {percentage}٪ از آلبوم خود را کامل کرده‌ام. برنامه را دانلود کنید و با من جمع‌آوری کنید: {appLink}"
```

**6. `lib/l10n/app_fr.arb`**
```json
  "shareStatisticsTooltip": "Partager les statistiques",
  "shareStatisticsMessage": "Découvrez mes progrès dans Album 26 ! J'ai terminé {percentage}% de mon album. Téléchargez l'application et collectionnez avec moi : {appLink}"
```

**7. `lib/l10n/app_he.arb`**
```json
  "shareStatisticsTooltip": "שתף סטטיסטיקות",
  "shareStatisticsMessage": "בדוק את ההתקדמות שלי ב-Album 26! השלמתי {percentage}% מהאלבום שלי. הורד את האפליקציה ואסוף איתי: {appLink}"
```

**8. `lib/l10n/app_hi.arb`**
```json
  "shareStatisticsTooltip": "आँकड़े साझा करें",
  "shareStatisticsMessage": "एल्बम 26 में मेरी प्रगति देखें! मैंने अपना {percentage
