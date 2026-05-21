Here is the product management documentation for the **Export & Share Statistics** feature, based on your request. 

Since the feature request was written in English, this response is provided in English.

---

# 📱 Feature: Export & Share Statistics for Instagram

## 1. User Stories

**Story 1: Share Progress Image**
```text
AS A collector
I WANT TO export and share my global progress card as an image
SO THAT I can showcase my collection progress to my friends on Instagram and other social media platforms.
```

**Story 2: Localized Sharing Experience**
```text
AS A non-English speaking user
I WANT TO see the share tooltip and default share message in my native language
SO THAT I can easily share my progress with my local network without having to translate the text manually.
```

## 2. Acceptance Criteria

- [ ] **UI Trigger:** An Amber-colored share icon (`Icons.share`) is present in the `AppBar` of the `StatisticsScreen`.
- [ ] **Canvas Generation:** Tapping the share icon triggers a background process that generates a high-resolution PNG image.
- [ ] **Image Specifications:** 
  - The image dimensions are exactly 1080x1920 (9:16) or 1080x1350 (4:5).
  - The background is a solid dark theme color (e.g., `#121212` or `#1E1E1E`).
- [ ] **Visual Replication:** The generated image contains a pixel-perfect, centered replication of the `_GlobalProgressCard` (gold gradient, typography, layout) using `CustomPainter` and `Canvas`.
- [ ] **Branding:** The `assets/app_icon.png` and the localized `appTitle` are tastefully positioned (e.g., at the bottom center) of the generated canvas.
- [ ] **Native Share:** Once generated, the device's native share menu (`share_plus`) is invoked, attaching the PNG file and the localized `shareStatisticsMessage`.
- [ ] **Architecture Compliance:** No new files or state management classes are created. The logic is integrated into the existing `StatisticsScreen` and its corresponding provider.
- [ ] **Localization:** All 11 specified `.arb` files are updated with the `shareStatisticsTooltip` and `shareStatisticsMessage` keys, accurately translated, without overwriting or deleting any existing keys.

## 3. Data Model Impact

- **Supabase / Database:** No changes required.
- **Brick Models (Offline-first):** No changes required.
- **Relationships:** None. 
*Note: This is strictly a presentation and local processing feature. It relies entirely on the existing data already loaded into memory by the `StatisticsProvider`.*

## 4. UI Flow Description

- **Screens Needed:** Modifications to existing `lib/features/catalog/presentation/statistics_screen.dart`.
- **Navigation Flow:** 
  1. User navigates to the Statistics tab/screen.
  2. User taps the new Amber share icon in the top right of the `AppBar`.
  3. (Optional but recommended) A brief loading overlay or indicator appears while the canvas renders and encodes the PNG.
  4. The native OS Share Bottom Sheet appears.
- **Key Interactions:**
  - **Canvas Rendering:** The app must use `PictureRecorder`, `Canvas`, and `CustomPainter` to draw the UI off-screen.
  - **File Handling:** The resulting image must be converted to byte data (`image.toByteData(format: ImageByteFormat.png)`), saved to the device's temporary directory (`path_provider`), and passed to `share_plus` as an `XFile`.

## 5. Edge Cases & Constraints

- **Offline Behavior:** This feature must work 100% offline. Canvas drawing and native sharing do not require an internet connection. (Note: The `{appLink}` in the shared text will require the recipient to have internet, but the sender does not need it to generate and queue the share).
- **Guest User Behavior:** Guest users should be able to share their progress exactly like authenticated users. No restrictions should be applied.
- **Geographic Variants:** The `_GlobalProgressCard` replication must accurately reflect the statistics of the currently selected geographic variant (LATAM, Europe, USA). By reusing the existing `StatisticsProvider`, this should be handled automatically.
- **Performance Considerations:** Rendering a 1080x1920 canvas and encoding it to PNG can be CPU-intensive. This logic should ideally be executed asynchronously to prevent UI jank or freezing the main thread.
- **Storage Permissions:** Ensure the generated PNG is written to the temporary directory (`getTemporaryDirectory()`) to avoid requiring explicit storage permissions on Android/iOS.

---

## 6. Localization (ARB Updates)

You must append the following keys to the respective files. **Do not delete existing keys.**

**lib/l10n/app_ar.arb** (Already provided in context, ensure it matches)
```json
"shareStatisticsTooltip": "مشاركة الإحصاءات",
"shareStatisticsMessage": "تحقق من تقدمي في {appTitle}! لقد أكملت {percentage}% من ألبومي. قم بتنزيل التطبيق واجمع معي: {appLink}"
```

**lib/l10n/app_de.arb**
```json
"shareStatisticsTooltip": "Statistiken teilen",
"shareStatisticsMessage": "Sieh dir meinen Fortschritt in {appTitle} an! Ich habe {percentage}% meines Albums vervollständigt. Lade die App herunter und sammle mit mir: {appLink}"
```

**lib/l10n/app_en.arb**
```json
"shareStatisticsTooltip": "Share statistics",
"shareStatisticsMessage": "Check out my progress in {appTitle}! I have completed {percentage}% of my album. Download the app and collect with me: {appLink}"
```

**lib/l10n/app_es.arb**
```json
"shareStatisticsTooltip": "Compartir estadísticas",
"shareStatisticsMessage": "¡Mira mi progreso en {appTitle}! He completado el {percentage}% de mi álbum. Descarga la app y colecciona conmigo: {appLink}"
```

**lib/l10n/app_fa.arb**
```json
"shareStatisticsTooltip": "اشتراک‌گذاری آمار",
"shareStatisticsMessage": "پیشرفت من را در {appTitle} ببینید! من {percentage}٪ از آلبوم خود را کامل کرده‌ام. برنامه را دانلود کنید و با من جمع‌آوری کنید: {appLink}"
```

**lib/l10n/app_fr.arb**
```json
"shareStatisticsTooltip": "Partager les statistiques",
"shareStatisticsMessage": "Découvrez mes progrès dans {appTitle} ! J'ai complété {percentage} % de mon album. Téléchargez l'application et collectionnez avec moi : {appLink}"
```

**lib/l10n/app_he.arb**
```json
"shareStatisticsTooltip": "שתף סטטיסטיקות",
"shareStatisticsMessage": "בדוק את ההתקדמות שלי ב-{appTitle}! השלמתי {percentage}% מהאלבום שלי. הורד את האפליקציה ואסוף איתי: {appLink}"
```

**lib/l10n/app_hi.arb**
```json
"shareStatisticsTooltip": "आँकड़े साझा करें",
"shareStatisticsMessage": "{appTitle} में मेरी प्रगति देखें! मैंने अपना {percentage}% एल्बम पूरा कर लिया है। ऐप डाउनलोड करें और मेरे साथ इकट्ठा करें: {appLink}"
```

**lib/l10n/app_it.arb**
```json
"shareStatisticsTooltip": "Condividi statistiche",
"shareStatisticsMessage": "Guarda i miei progressi in {appTitle}! Ho completato il {percentage}% del mio album. Scarica l'app e colleziona con me: {appLink}"
```

**lib/l10n/app_ja.arb**
```json
"shareStatisticsTooltip": "統計を共有する",
"shareStatisticsMessage": "{appTitle}での私の進捗を見てください！アルバムの{percentage}％を完了しました。アプリをダウンロードして、私と一緒に集めましょう：{appLink}"
```

**lib/l10n/app_ko.arb**
```json
"shareStatisticsTooltip": "통계 공유",
"shareStatisticsMessage": "{appTitle}에서 내 진행 상황을 확인하세요! 앨범의 {percentage}%를 완료했습니다. 앱을 다운로드하고 나와 함께 수집하세요: {appLink}"
```

*(Note: Ensure the ARB files include the proper `@shareStatisticsMessage` metadata block for the `{appTitle}`, `{percentage}`, and `{appLink}` placeholders if required by your `l10n.yaml` strictness settings).*
