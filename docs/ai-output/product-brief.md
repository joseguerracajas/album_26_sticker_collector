# 🔵 Feature Specification: Export & Share Statistics for Instagram

## Epic Overview
This feature allows users to export their global collection progress as a high-quality, Instagram-ready image and share it via their device's native share menu. This serves as a growth loop for the app, leveraging user milestones to increase organic discovery.

---

## 1. User Stories & Acceptance Criteria

### User Story 1: Share Icon in Statistics AppBar
**AS A** user  
**I WANT TO** see a share button on my statistics page  
**SO THAT** I can easily initiate the process of sharing my collection progress with others.

**Acceptance Criteria:**
* **Given** I am viewing the `StatisticsScreen`
* **When** the screen is fully loaded
* **Then** I should see an Amber-colored share icon located in the AppBar
* **And** when I long-press or hover over the icon, it should display the localized tooltip defined by the `shareStatisticsTooltip` key.

### User Story 2: Generate Instagram-Optimized Progress Image (Canvas Replication)
**AS A** user  
**I WANT TO** have my progress converted into a high-quality image  
**SO THAT** I can post a visually appealing update to my Instagram Stories or Feed.

**Acceptance Criteria:**
* **Given** I tap the Amber share icon in the AppBar
* **When** the `StatisticsProvider` processes the share action
* **Then** the app generates a high-resolution PNG image in the background using `Canvas` and `CustomPainter`
* **And** the canvas dimensions are strictly set to either 1080x1920 (9:16) or 1080x1350 (4:5)
* **And** the canvas background is painted with a dark theme color (e.g., #121212 or #1E1E1E)
* **And** a pixel-perfect, visually identical replica of the `_GlobalProgressCard` (including the gold gradient, layout, and typography) is drawn perfectly centered on the canvas.

### User Story 3: App Branding on Exported Image
**AS A** Product Owner  
**I WANT TO** ensure the exported statistics image includes the app's branding  
**SO THAT** viewers on social media know which app was used and can discover it.

**Acceptance Criteria:**
* **Given** the app is generating the high-resolution progress image
* **When** the custom painter is drawing the canvas elements
* **Then** the app icon (`assets/app_icon.png`) and the dynamically localized `appTitle` must be tastefully positioned at the top or bottom of the canvas
* **And** the app name must not be hardcoded, but fetched from the existing localization keys.

### User Story 4: Invoke Native Share Menu with Dynamic Message
**AS A** user  
**I WANT TO** open my phone's native sharing options with a pre-filled message  
**SO THAT** I can quickly post my progress image and a link to the app on my social media.

**Acceptance Criteria:**
* **Given** the high-resolution PNG image has been successfully generated
* **When** the image generation process completes
* **Then** the device's native share menu is automatically invoked (e.g., using `share_plus`)
* **And** the generated PNG is attached to the share payload
* **And** the share text is populated using the localized `shareStatisticsMessage` key
* **And** the `{percentage}` and `{appLink}` variables in the message are dynamically replaced with my actual progress data and the correct app link.

### User Story 5: Strict ARB Localization Updates
**AS A** global user  
**I WANT TO** read the share tooltip and pre-filled message in my native language  
**SO THAT** I can share my progress with my friends in a language we both understand.

**Acceptance Criteria:**
* **Given** the app supports 11 different languages
* **When** the developer implements the localization for the share feature
* **Then** the keys `shareStatisticsTooltip` and `shareStatisticsMessage` are appended to all 11 target `.arb` files
* **And** the base Spanish text is accurately translated into the respective language for each file
* **And** no existing keys or content in the `.arb` files are deleted, overwritten, or lost during this update.

---

## 2. Data Model Impact

**No database or offline-sync changes are required for this feature.** 
This is strictly a Presentation and Domain layer enhancement.

* **Supabase:** No new tables, columns, or Edge Functions needed.
* **Brick Models:** No changes to existing offline-first models.
* **State Management:** The `StatisticsProvider` (Riverpod) will need a new method (e.g., `exportAndShareStatistics()`) to handle the image generation and native share invocation without mutating the underlying inventory state.

---

## 3. UI Flow Description

### Screens Needed
* No new screens are required. We are modifying the existing `StatisticsScreen` (likely located in `lib/features/inventory/presentation/screens/`).

### Navigation Flow
1. User navigates to the `StatisticsScreen`.
2. User taps the new Amber **Share Icon** in the AppBar.
3. A brief loading state (e.g., a subtle `CircularProgressIndicator` replacing the share icon or a non-blocking snackbar) appears while the Canvas renders the image.
4. The OS Native Share Bottom Sheet appears.
5. User selects their target app (Instagram, WhatsApp, etc.).
6. User returns to the `StatisticsScreen` once the share flow is completed or dismissed.

### Key Interactions
* **Canvas Rendering:** The `_GlobalProgressCard` UI must be translated into a `CustomPainter` implementation. This requires mapping Flutter widgets to Canvas drawing commands (text painters, rounded rectangles, gradient shaders).
* **Native Share:** Integration with a package like `share_plus` to pass the generated `Uint8List` (converted to an XFile) and the localized string payload.

---

## 4. Edge Cases & Constraints

### Offline Behavior
* **Constraint:** Must work 100% offline.
* **Resolution:** Since the statistics are calculated from the local Brick SQLite database, image generation and invoking the native share sheet will work perfectly without an internet connection. The actual posting to Instagram will pend on the OS level until the user regains connectivity.

### Guest User Behavior
* **Constraint:** Guest users should not be blocked from sharing.
* **Resolution:** Guest users have local inventory data. The share feature will function identically for them, acting as a great hook to show them the app's value and potentially drive them to create an account later.

### Geographic Variant Considerations
* **Constraint:** The progress percentage and totals must accurately reflect the user's selected album variant (e.g., LATAM vs. USA).
* **Resolution:** Ensure the `StatisticsProvider` passes the variant-specific totals (e.g., 638 vs 670 stickers) to the `CustomPainter` so the generated image matches exactly what the user sees on their screen.

### Performance Considerations
* **Constraint:** Generating a 1080x1920 high-resolution image on the main thread might cause UI jank.
* **Resolution:** 
  * If the `CustomPainter` rendering and `toImage()` conversion takes longer than 16ms, consider offloading the image generation to an `Isolate` (using Flutter's `compute` function).
  * Ensure the generated PNG is temporarily saved to the device's cache directory (`path_provider`) and properly garbage-collected after the share sheet is closed to prevent memory leaks.

### Permissions
* **Constraint:** Saving files to share them might require storage permissions on older Android versions.
* **Resolution:** Use `share_plus` with `XFile.fromData` or save to the temporary app cache directory, which bypasses the need for explicit user storage permissions on modern iOS and Android versions.
