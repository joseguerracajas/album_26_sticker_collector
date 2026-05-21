# 🔵 Product Manager AI: Feature Specification

## Feature: Export & Share Statistics for Instagram

### 1. User Stories

**Story 1: Share Progress Card**
```text
AS A collector
I WANT TO export and share my global progress card as a high-resolution image
SO THAT I can showcase my album completion status to my friends on Instagram and other social media.

Given I am viewing the StatisticsScreen
When I tap the amber Share icon in the AppBar
Then the app generates a high-quality image of my progress card and opens the native share menu with a localized message.
```

### 2. Acceptance Criteria

- [ ] **UI Trigger**: An amber-colored share icon (`Icons.share`) is added to the `AppBar` of `lib/features/catalog/presentation/statistics_screen.dart`.
- [ ] **Canvas Generation**: Tapping the icon triggers a `CustomPainter` routine that draws a 1080x1920 (or 1080x1350) canvas.
- [ ] **Visual Accuracy**: The generated canvas has a dark background (`#121212` or `#1E1E1E`) and perfectly replicates the `_GlobalProgressCard` (gold gradient, typography, layout) centered on the screen.
- [ ] **Branding**: The app icon (`assets/icon/app_icon.png`) and the localized `appTitle` are tastefully positioned at the top or bottom of the generated image.
- [ ] **State Management**: The image generation logic is integrated into the existing `StatisticsProvider` (or equivalent provider managing this screen). No new state classes are created.
- [ ] **Native Share**: The `share_plus` package is invoked with the generated PNG file and the localized `shareStatisticsMessage`.
- [ ] **Localization**: All 11 specified `.arb` files are updated with the new keys (`shareStatisticsTooltip`, `shareStatisticsMessage`) translated accurately, without deleting any existing keys.

### 3. Data Model Impact

- **Supabase**: No changes required.
- **Brick Models**: No changes required.
- **Relationships**: No changes required.
*Note: This feature is strictly presentation-layer and relies entirely on existing local data provided by the `StatisticsProvider`.*

### 4. UI Flow Description

- **Screens Needed**: No new screens. Modifications will be made exclusively to `lib/features/catalog/presentation/statistics_screen.dart`.
- **Navigation Flow**: 
  1. User navigates to the Statistics tab/screen.
  2. User taps the Share icon in the AppBar.
  3. The OS native share bottom sheet (iOS Activity View / Android Share Sheet) slides up.
  4. User selects the target app (e.g., Instagram Stories) and the image + text are passed to it.
- **Key Interactions**: 
  - To prevent UI freezing during the Canvas generation (which can take a few milliseconds for high-res images), the generation should be awaited asynchronously. A subtle loading state (like replacing the share icon with a small `CircularProgressIndicator` temporarily) is recommended.

### 5. Edge Cases & Constraints

- **Offline Behavior**: Fully supported. Image generation happens locally via Flutter's `Canvas` API, and native sharing works offline. (Note: The recipient needs internet to open the `{appLink}`, but the sender does not need it to generate the image).
- **Guest User Behavior**: Fully supported. Guest users can share their local SQLite progress just like authenticated users.
- **Geographic Variant Considerations**: The `StatisticsProvider` already filters data based on the selected geographic variant (LATAM, Europe, USA). The generated image **must** use the currently active variant's data (e.g., if the user is viewing the USA variant, the percentage and counts on the shared image must reflect the USA variant).
- **Performance Considerations**: 
  - The generated PNG must be saved to the device's temporary directory (`path_provider` -> `getTemporaryDirectory()`) before being passed to `share_plus`.
  - Ensure the `CustomPainter` does not leak memory; dispose of any `ui.Image` instances properly after the PNG bytes are extracted.
- **RTL (Right-to-Left) Languages**: For Arabic (`ar`), Farsi (`fa`), and Hebrew (`he`), ensure the Canvas text rendering respects the RTL directionality for the localized `appTitle` and any text inside the replicated progress card.

---

### 🌐 Localization Implementation Guide (Strict ARB Append)

You must append the following keys to the respective files. **Do not overwrite or delete existing keys.** 

*Note: The `{appTitle}`, `{percentage}`, and `{appLink}` placeholders must remain exactly as written for dynamic injection.*

**`lib/l10n/app_ar.arb`**
```json
  "shareStatisticsTooltip": "مشاركة الإحصاءات",
  "shareStatisticsMessage": "تحقق من تقدمي في {appTitle}! لقد أكملت {percentage}% من ألبومي. قم بتنزيل التطبيق واجمع معي: {appLink}"
```

**`lib/l10n/app_de.arb`**
```json
  "shareStatisticsTooltip": "Statistiken teilen",
  "shareStatisticsMessage": "Sieh dir meinen Fortschritt in {appTitle} an! Ich habe {percentage}% meines Albums abgeschlossen. Lade die App herunter und sammle mit mir: {appLink}"
```

**`lib/l10n/app_en.arb`**
```json
  "shareStatisticsTooltip": "Share statistics",
  "shareStatisticsMessage": "Check out my progress in {appTitle}! I have completed {percentage}% of my album. Download the app and collect with me: {appLink}"
```

**`lib/l10n/app_es.arb`**
```json
  "shareStatisticsTooltip": "Compartir estadísticas",
  "shareStatisticsMessage": "¡Mira mi progreso en {appTitle}! He completado el {percentage}% de mi álbum. Descarga la app y colecciona conmigo: {appLink}"
```

**`lib/l10n/app_fa.arb`**
```json
  "shareStatisticsTooltip": "اشتراک‌گذاری آمار",
  "shareStatisticsMessage": "پیشرفت من را در {appTitle} ببینید! من {percentage}٪ از آلبوم خود را کامل کرده‌ام. برنامه را دانلود کنید و با من جمع‌آوری کنید: {appLink}"
```

**`lib/l10n/app_fr.arb`**
```json
  "shareStatisticsTooltip": "Partager les statistiques",
  "shareStatisticsMessage": "Découvrez mes progrès dans {appTitle} ! J'ai terminé {percentage} % de mon album. Téléchargez l'application et collectionnez avec moi : {appLink}"
```

**`lib/l10n/app_he.arb`**
```json
  "shareStatisticsTooltip": "שתף סטטיסטיקות",
  "shareStatisticsMessage": "בדוק את ההתקדמות שלי ב-{appTitle}! השלמתי {percentage}% מהאלבום שלי. הורד את האפליקציה ואסוף איתי: {appLink}"
```

**`lib/l10n/app_hi.arb`**
```json
  "shareStatisticsTooltip": "आँकड़े साझा करें",
  "shareStatisticsMessage": "{appTitle} में मेरी प्रगति देखें! मैंने अपना {percentage}% एल्बम पूरा कर लिया है। ऐप डाउनलोड करें और मेरे साथ इकट्ठा करें: {appLink}"
```

**`lib/l10n/app_it.arb`**
```json
  "shareStatisticsTooltip": "Condividi statistiche",
  "shareStatisticsMessage": "Guarda i miei progressi in {appTitle}! Ho completato il {percentage}% del mio album. Scarica l'app e colleziona con me: {appLink}"
```

**`lib/l10n/app_ja.arb`**
```json
  "shareStatisticsTooltip": "統計を共有する",
  "shareStatisticsMessage": "{appTitle}での私の進捗を見てください！アルバムの{percentage}％を完了しました。アプリをダウンロードして、一緒に集めましょう：{appLink}"
```

**`lib/l10n/app_ko.arb`**
```json
  "shareStatisticsTooltip": "통계 공유",
  "shareStatisticsMessage": "{appTitle}에서 내 진행 상황을 확인하세요! 앨범의 {percentage}%를 완료했습니다. 앱을 다운로드하고 나와 함께 수집하세요: {appLink}"
```
