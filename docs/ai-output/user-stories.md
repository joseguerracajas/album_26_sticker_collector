Here are the user stories based on the provided feature request, written in the Given/When/Then format.

## Epic: Export & Share Statistics for Instagram

### User Story 1: Share Icon in Statistics AppBar
**As a** user  
**I want** to see a share button on my statistics page  
**So that** I can easily initiate the process of sharing my collection progress with others.

**Acceptance Criteria:**
* **Given** I am viewing the `StatisticsScreen`
* **When** the screen is fully loaded
* **Then** I should see an Amber-colored share icon located in the AppBar
* **And** when I long-press or hover over the icon, it should display the localized tooltip defined by the `shareStatisticsTooltip` key.

---

### User Story 2: Generate Instagram-Optimized Progress Image (Canvas Replication)
**As a** user  
**I want** my progress to be converted into a high-quality image  
**So that** I can post a visually appealing update to my Instagram Stories or Feed.

**Acceptance Criteria:**
* **Given** I tap the Amber share icon in the AppBar
* **When** the `StatisticsProvider` processes the share action
* **Then** the app generates a high-resolution PNG image in the background using `Canvas` and `CustomPainter`
* **And** the canvas dimensions are strictly set to either 1080x1920 (9:16) or 1080x1350 (4:5)
* **And** the canvas background is painted with a dark theme color (e.g., #121212 or #1E1E1E)
* **And** a pixel-perfect, visually identical replica of the `_GlobalProgressCard` (including the gold gradient, layout, and typography) is drawn perfectly centered on the canvas.

---

### User Story 3: App Branding on Exported Image
**As a** Product Owner  
**I want** the exported statistics image to include the app's branding  
**So that** viewers on social media know which app was used and can discover it.

**Acceptance Criteria:**
* **Given** the app is generating the high-resolution progress image
* **When** the custom painter is drawing the canvas elements
* **Then** the app icon (`assets/app_icon.png`) and the dynamically localized `appTitle` must be tastefully positioned at the top or bottom of the canvas
* **And** the app name must not be hardcoded, but fetched from the existing localization keys.

---

### User Story 4: Invoke Native Share Menu with Dynamic Message
**As a** user  
**I want** the app to open my phone's native sharing options with a pre-filled message  
**So that** I can quickly post my progress image and a link to the app on my social media.

**Acceptance Criteria:**
* **Given** the high-resolution PNG image has been successfully generated
* **When** the image generation process completes
* **Then** the device's native share menu is automatically invoked
* **And** the generated PNG is attached to the share payload
* **And** the share text is populated using the localized `shareStatisticsMessage` key
* **And** the `{percentage}` and `{appLink}` variables in the message are dynamically replaced with my actual progress data and the correct app link.

---

### User Story 5: Strict ARB Localization Updates
**As a** global user  
**I want** the share tooltip and pre-filled message to be in my native language  
**So that** I can share my progress with my friends in a language we both understand.

**Acceptance Criteria:**
* **Given** the app supports 11 different languages
* **When** the developer implements the localization for the share feature
* **Then** the keys `shareStatisticsTooltip` and `shareStatisticsMessage` are appended to all 11 target `.arb` files
* **And** the base Spanish text is accurately translated into the respective language for each file
* **And** no existing keys or content in the `.arb` files are deleted, overwritten, or lost during this update.
