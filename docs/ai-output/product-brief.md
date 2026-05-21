Here is the structured product management documentation for the **Export & Share Statistics for Instagram** feature, based on the approved user stories and project context.

---

## 2. Acceptance Criteria

### Story 1: Share Icon in Statistics AppBar
* **AC 1.1:** An Amber-colored share icon (`Icons.share` or similar) is displayed in the `AppBar` actions of the `StatisticsScreen`.
* **AC 1.2:** Long-pressing or hovering over the icon displays a tooltip with the localized text for "Share statistics".
* **AC 1.3:** Tapping the icon triggers the image generation process and disables the button temporarily to prevent multiple simultaneous taps.

### Story 2: Generate Instagram-Optimized Image (Canvas Replication)
* **AC 2.1:** The app successfully uses a `PictureRecorder` and `Canvas` (via `CustomPainter` logic) to draw the image off-screen without requiring a visible widget tree render.
* **AC 2.2:** The generated PNG image has a resolution of 1080x1920 (Instagram Story) or 1080x1350 (Instagram Feed).
* **AC 2.3:** The background of the canvas is filled with a dark theme color (e.g., `#121212`).
* **AC 2.4:** A pixel-perfect visual replica of the `_GlobalProgressCard` (including the gold gradient, text, and progress bar) is drawn centered on the canvas.
* **AC 2.5:** The app's icon (`assets/app_icon.png`) and the localized `appTitle` are drawn at the bottom or top of the canvas with appropriate padding.

### Story 3: Native Share Menu and Localized Message
* **AC 3.1:** Upon successful image generation, the device's native share sheet is invoked (e.g., using the `share_plus` package).
* **AC 3.2:** The generated PNG file is saved to a temporary directory and attached to the share payload.
* **AC 3.3:** The share payload includes a pre-filled text message containing the user's actual completion percentage (e.g., "I have completed 45% of my album!").
* **AC 3.4:** The pre-filled text includes a promotional download link for the app.
* **AC 3.5:** The text message is fully localized based on the device's current locale.

### Story 4: Architectural and Localization Constraints
* **AC 4.1:** All state and logic for sharing are housed within the existing `StatisticsProvider` (or the specific Riverpod provider managing the `StatisticsScreen`). No new provider files are created.
* **AC 4.2:** The keys `shareStatisticsTooltip` and `shareStatisticsMessage` are present in all 11 `.arb` files.
* **AC 4.3:** The `shareStatisticsMessage` key accepts parameters for the percentage and the app link (e.g., `I have completed {percentage}% of my album! Download here: {link}`).
* **AC 4.4:** The `appTitle` is fetched dynamically from the localization file and drawn onto the canvas.

---

## 3. Data Model Impact

* **Supabase:** No changes required. This is a purely client-side presentation and sharing feature.
* **Brick Models:** No changes required. The feature relies on existing offline-first inventory data to calculate the percentage.
* **Relationships:** N/A.

---

## 4. UI Flow Description

* **Screens Needed:** No new screens. The feature operates entirely within the existing `StatisticsScreen`.
* **Navigation Flow:**
  1. User navigates to the `StatisticsScreen`.
  2. User taps the Share icon in the `AppBar`.
  3. A brief loading indicator (e.g., a `CircularProgressIndicator` replacing the share icon or a subtle snackbar) appears while the canvas renders the image.
  4. The native OS Share Sheet overlays the screen.
  5. User selects a destination (e.g., Instagram Stories, WhatsApp).
  6. Upon completion or cancellation, the user remains on the `StatisticsScreen`.
* **Key Interactions:**
  * **Canvas Rendering:** The `_GlobalProgressCard` UI needs to be translated into canvas drawing commands (`drawRect`, `drawText`, `drawImage`).
  * **Temporary Storage:** The generated image must be written to the device's temporary directory (`path_provider`) so it can be picked up by the native share sheet.

---

## 5. Edge Cases & Constraints

* **Offline Behavior:** 
  * **Constraint:** The feature must work 100% offline. Since the inventory data is stored locally via Brick (SQLite), the percentage calculation and image generation will function perfectly without an internet connection.
  * **Edge Case:** The download link included in the shared text will not be clickable by the recipient if *they* are offline, but the sharing action itself from the user's device via Bluetooth/AirDrop/SMS will still work.
* **Guest User Behavior:** 
  * **Constraint:** Guest users must be able to share their progress just like authenticated users. Since guest data is stored locally, the `StatisticsProvider` will read the local state and generate the image without requiring a Supabase session.
* **Geographic Variant Considerations:** 
  * **Constraint:** The progress percentage drawn on the canvas and injected into the text message must accurately reflect the specific geographic variant (LATAM, Europe, USA) the user has currently selected. The `StatisticsProvider` already handles this filtering, so the sharing logic must ensure it uses the currently active variant's state.
* **Performance Considerations:** 
  * **Constraint:** Drawing complex gradients and text to a high-resolution canvas can be CPU-intensive. 
  * **Mitigation:** The `PictureRecorder` logic should be executed asynchronously (e.g., using `compute` or an `Isolate` if it causes UI jank, though standard canvas drawing is usually fast enough on the main thread). Ensure the temporary image file is deleted after sharing or overwritten on subsequent shares to prevent storage bloat.
* **Permissions:** 
  * **Constraint:** Depending on the sharing package used (`share_plus`), writing to the temporary directory and sharing does not typically require explicit `WRITE_EXTERNAL_STORAGE` permissions on modern Android/iOS versions, but this must be verified during implementation to prevent crashes on older Android devices.
