Here are the user stories based on the provided feature request, written in the Given/When/Then format.

### Epic: Export & Share Statistics for Instagram

#### User Story 1: Share Icon in Statistics AppBar
**As a** user
**I want** to see a share button on my statistics page
**So that** I can easily initiate the process of sharing my collection progress with others.

* **Given** I am navigating the app and viewing the `StatisticsScreen`
* **When** I look at the AppBar at the top of the screen
* **Then** I should see an Amber-colored share icon
* **And** hovering over or long-pressing the icon should display the localized tooltip (e.g., "Share statistics").

#### User Story 2: Generate Instagram-Optimized Image (Canvas Replication)
**As a** user
**I want** the app to generate a beautiful, high-resolution image of my progress card
**So that** it looks perfect when I post it to my Instagram Stories or Feed.

* **Given** I am on the `StatisticsScreen`
* **When** I tap the Amber share icon
* **Then** the app should use a `CustomPainter` to generate a high-resolution PNG image with standard Instagram dimensions (1080x1920 for Stories or 1080x1350 for Feed)
* **And** the canvas must have a dark background (e.g., #121212 or #1E1E1E) matching the app's theme
* **And** a pixel-perfect replica of the gold gradient `_GlobalProgressCard` must be drawn perfectly centered on the canvas
* **And** the app's branding (`assets/app_icon.png` and the localized `appTitle`) must be tastefully positioned at the top or bottom of the generated image.

#### User Story 3: Native Share Menu and Localized Message
**As a** user
**I want** the app to open my phone's native sharing options with a pre-filled message
**So that** I can quickly send my progress image and a download link to my friends.

* **Given** I have tapped the share icon and the image generation is complete
* **When** the app triggers the sharing action
* **Then** the device's native share menu should be invoked
* **And** the generated PNG image should be attached to the share payload
* **And** a pre-filled text message should be included, dynamically displaying my actual completion percentage and the app link
* **And** the message must be correctly translated into my device's current language (supporting all 11 languages).

#### User Story 4: Architectural and Localization Constraints (Technical Story)
**As a** developer
**I want** to implement the sharing feature using existing architecture and localization files
**So that** the codebase remains clean, offline-first, and strictly adheres to the project's ARB policies.

* **Given** I am implementing the "Export and Share" feature
* **When** I write the logic and update the localization files
* **Then** the sharing logic must be integrated directly into the existing `StatisticsProvider` (or the provider managing `StatisticsScreen` data) without creating new state management classes or files
* **And** the new translation keys (`shareStatisticsTooltip` and `shareStatisticsMessage`) must be appended to all 11 target `.arb` files without deleting or overwriting existing content
* **And** the base Spanish text must be accurately translated into the respective language for each ARB file
* **And** the `appTitle` key must be used dynamically inside the generated image and the shared message rather than being hardcoded.
