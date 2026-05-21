Here are the user stories based on the provided feature request, written in the Given/When/Then format.

### **User Story 1: Triggering the Share Action**
**As a** user  
**I want** to tap a share icon on the Statistics screen  
**So that** I can easily export and share my album progress with my friends on social media.  

**Acceptance Criteria:**
* **Given** I am navigating the `StatisticsScreen`  
* **When** I look at the AppBar  
* **Then** I should see an Amber-colored share icon.  
* **Given** I hover over or long-press the share icon  
* **When** the tooltip appears  
* **Then** it should display the localized text for "Share statistics" (`shareStatisticsTooltip`).  
* **Given** I tap the Amber-colored share icon  
* **When** the app processes the request  
* **Then** it should trigger the image generation and subsequently open the device's native share menu.

---

### **User Story 2: Instagram-Optimized Image Generation**
**As a** user  
**I want** the generated image of my statistics to be high-quality and formatted for Instagram  
**So that** it looks visually appealing when I post it to my Stories or Feed.  

**Acceptance Criteria:**
* **Given** I have tapped the share icon  
* **When** the app generates the image in the background  
* **Then** it must create a high-resolution PNG using a base canvas size of 1080x1920 (9:16) or 1080x1350 (4:5).  
* **And** the canvas must have a dark background matching the app's theme (e.g., #121212 or #1E1E1E).  
* **And** the gold gradient `_GlobalProgressCard` must be drawn perfectly centered on the canvas, visually identical to the UI using `CustomPainter`.  
* **And** the app's branding, including `assets/app_icon.png` and the dynamically localized `appTitle`, must be tastefully positioned at the top or bottom of the canvas.

---

### **User Story 3: Localized Sharing Message**
**As a** global user  
**I want** the pre-filled share message to be in my selected language and include my actual progress  
**So that** my followers can read about my achievement and download the app.  

**Acceptance Criteria:**
* **Given** the native share menu is invoked  
* **When** the share sheet appears  
* **Then** it must include a pre-filled text message using the `shareStatisticsMessage` key from the active ARB file.  
* **And** the message must dynamically inject the localized `appTitle`, my actual completion `{percentage}`, and the `{appLink}`.  
* **Given** the app supports 11 languages  
* **When** the codebase is updated  
* **Then** the new `shareStatisticsTooltip` and `shareStatisticsMessage` keys must be appended to all 11 ARB files with accurate translations based on the provided Spanish base text, without overwriting any existing keys.

---

### **User Story 4: Architectural & State Management Constraints (Technical Story)**
**As a** developer  
**I want** to implement the sharing feature using existing providers and files  
**So that** the application architecture remains clean, offline-first, and adheres to strict project constraints.  

**Acceptance Criteria:**
* **Given** I am implementing the share logic  
* **When** I manage the state and data fetching  
* **Then** I must integrate the logic directly into the existing `StatisticsProvider` (or the provider managing `StatisticsScreen` data).  
* **And** I must reuse existing Riverpod providers and Brick repositories.  
* **And** I must not create any new state management classes, constant files, or new screens.
