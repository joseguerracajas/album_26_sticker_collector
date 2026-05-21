# 🔵 Product Manager AI: Feature Specification

## Feature: Export & Share Statistics for Instagram

### 1. User Stories

**Story 1: Export and Share Progress**
```text
AS A collector
I WANT TO export my global progress card as a high-resolution image
SO THAT I can share my collection status on Instagram and other social media platforms.

Given I am on the StatisticsScreen
When I tap the amber share icon in the AppBar
Then the app generates a high-resolution image of my global progress card and opens the native share menu.
```

**Story 2: Localized Sharing Experience**
```text
AS A user in any supported region
I WANT TO share a pre-filled message in my native language
SO THAT my friends can easily understand my progress and download the app.

Given I have generated a shareable statistics image
When the native share menu opens
Then the accompanying text message is translated into my app's current language and includes my completion percentage and the app link.
```

---

### 2. Acceptance Criteria

- [ ] **UI Trigger**: An Amber-colored share icon (`Icons.share`) is present in the `AppBar` actions of `StatisticsScreen`.
- [ ] **Canvas Generation**: Tapping the share icon triggers a `CustomPainter` to draw on a high-resolution `Canvas` with dimensions of 1080x1920 (9:16) or 1080x1350 (4:5).
- [ ] **Background & Branding**: The canvas background is painted dark (`#121212` or `#1E1E1E`). The app icon (`assets/icon/app_icon.png`) and the localized `appTitle` are tastefully positioned at the top or bottom.
- [ ] **Visual Replication**: The gold gradient progress card (`_GlobalProgressCard`) is rendered perfectly centered on the canvas, visually identical to the existing UI implementation.
- [ ] **Native Share**: The generated Canvas is converted to a PNG and shared via the `share_plus` package alongside the localized `shareStatisticsMessage`.
- [ ] **State Management**: The logic is integrated into the existing provider managing the `StatisticsScreen` data (no new state management classes are created).
- [ ] **Localization**: The 11 specified `.arb` files are updated (append-only) with the keys `shareStatisticsTooltip` and `shareStatisticsMessage`, correctly translated from the base Spanish text, utilizing `{percentage}` and `{appLink}` placeholders.

---

### 3. Data Model Impact

- **Supabase**: No changes required.
- **Brick Models**: No changes required.
- **Relationships**: No changes required.
- *Note*: This is a purely Presentation (UI) and Localization feature. It relies entirely on existing data already fetched by the `StatisticsProvider`.

---

### 4. UI Flow Description

**Screens Needed:**
- No new screens. Modifications will be strictly within `lib/features/catalog/presentation/statistics_screen.dart`.

**Navigation Flow & Key Interactions:**
1. User navigates to the **Statistics** tab/screen.
2. User taps the **Share** icon (Amber) in the top right of the `AppBar`.
3. *(Optional but recommended)* A brief loading overlay or indicator appears to prevent spam-clicking while the Canvas renders and encodes the PNG.
4. The app uses `ui.PictureRecorder` and `Canvas` to draw the layout, then converts it to a `ui.Image`, and finally to a PNG byte array.
5. The byte array is saved to a temporary directory using `path_provider`.
6. The `share_plus` package is invoked using `Share.shareXFiles` with the temporary PNG file and the localized text message.
7. The OS native share sheet appears, allowing the user to post to Instagram Stories, Feed, WhatsApp, etc.

---

### 5. Edge Cases & Constraints

- **Offline Behavior**: This feature must work 100% offline. Canvas generation and PNG encoding are local processes. The native share sheet will still open offline, though posting to social media will pend until the device regains connectivity (handled by the OS/target app).
- **Guest User Behavior**: Guest users can share their stats just like authenticated users. The local progress is used.
- **Geographic Variant Considerations**: The `_GlobalProgressCard` replication must dynamically use the stats of the currently selected geographic variant (LATAM, Europe, USA), which is already handled by the existing `StatisticsProvider`.
- **Performance Considerations**: 
  - Generating a 1080x1920 image on the UI thread can cause a brief frame drop. The PNG encoding (`image.toByteData(format: ui.ImageByteFormat.png)`) should ideally be awaited properly, and UI feedback (like a loading spinner) should be provided if it takes more than 16ms.
- **Architectural Constraints**: 
  - **Strictly no new files**. The `CustomPainter` logic and sharing function must be added to `statistics_screen.dart` or its immediate existing provider file.
  - Do not hardcode the app name; use `AppLocalizations.of(context)!.appTitle`.

---

### 6. Localization (ARB Translations)

The following keys must be appended to the respective `lib/l10n/app_*.arb` files. 

*Note for the developer: Ensure the placeholders `{percentage}` and `{appLink}` are properly defined in the English template file so the code generator creates the correct method signature.*

**app_en.arb (Template)**
```json
  "shareStatisticsTooltip": "Share statistics",
  "shareStatisticsMessage": "Check out my progress in {appTitle}! I have completed {percentage}% of my album. Download the app and collect with me: {appLink}",
  "@shareStatisticsMessage": {
    "placeholders": {
      "appTitle": {"type": "String"},
      "percentage": {"type": "String"},
      "appLink": {"type": "String"}
    }
  }
```

**app_es.arb**
```json
  "shareStatisticsTooltip": "Compartir estadísticas",
  "shareStatisticsMessage": "¡Mira mi progreso en {appTitle}! He completado el {percentage}% de mi álbum. Descarga la app y colecciona conmigo: {appLink}"
```

**app_ar.arb**
```json
  "shareStatisticsTooltip": "مشاركة الإحصائيات",
  "shareStatisticsMessage": "تحقق من تقدمي في {appTitle}! لقد أكملت {percentage}% من ألبومي. قم بتنزيل التطبيق واجمع معي: {appLink}"
```

**app_de.arb**
```json
  "shareStatisticsTooltip": "Statistiken teilen",
  "shareStatisticsMessage": "Sieh dir meinen Fortschritt in {appTitle} an! Ich habe {percentage}% meines Albums vervollständigt. Lade die App herunter und sammle mit mir: {appLink}"
```

**app_fa.arb**
```json
  "shareStatisticsTooltip": "اشتراک‌گذاری آمار",
  "shareStatisticsMessage": "پیشرفت من را در {appTitle} ببینید! من {percentage}٪ از آلبوم خود را کامل کرده‌ام. برنامه را دانلود کنید و با من جمع‌آوری کنید: {appLink}"
```

**app_fr.arb**
```json
  "shareStatisticsTooltip": "Partager les statistiques",
  "shareStatisticsMessage": "Découvrez mon avancement dans {appTitle} ! J'ai complété {percentage}% de mon album. Téléchargez l'application et collectionnez avec moi : {appLink}"
```

**app_he.arb**
```json
  "shareStatisticsTooltip": "שתף סטטיסטיקות",
  "shareStatisticsMessage": "בדוק את ההתקדמות שלי ב-{appTitle}! השלמתי {percentage}% מהאלבום שלי. הורד את האפליקציה ואסוף איתי: {appLink}"
```

**app_hi.arb**
```json
  "shareStatisticsTooltip": "आँकड़े साझा करें",
  "shareStatisticsMessage": "{appTitle} में मेरी प्रगति देखें! मैंने अपना {percentage}% एल्बम पूरा कर लिया है। ऐप डाउनलोड करें और मेरे साथ इकट्ठा करें: {appLink}"
```

**app_it.arb**
```json
  "shareStatisticsTooltip": "Condividi statistiche",
  "shareStatisticsMessage": "Guarda i miei progressi in {appTitle}! Ho completato il {percentage}% del mio album. Scarica l'app e colleziona con me: {appLink}"
```

**app_ja.arb**
```json
  "shareStatisticsTooltip": "統計を共有する",
  "shareStatisticsMessage": "{appTitle}での私の進捗を見てください！アルバムの{percentage}％を完了しました。アプリをダウンロードして、一緒に集めましょう：{appLink}"
```

**app_ko.arb**
```json
  "shareStatisticsTooltip": "통계 공유",
  "shareStatisticsMessage": "{appTitle}에서 내 진행 상황을 확인하세요! 앨범의 {percentage}%를 완료했습니다. 앱
