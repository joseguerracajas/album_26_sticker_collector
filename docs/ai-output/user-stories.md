# Feature: Localization Support for Arabic Language (ar)

## 1. User Stories

### User Story 1: Arabic Language Support
```
AS A user who prefers Arabic
I WANT TO use the app in Arabic
SO THAT I can navigate and interact with the app in my native language.

Given I have selected Arabic as my preferred language
When I navigate through the app
Then all text, labels, and messages should appear in Arabic.
```

### User Story 2: Default Language Fallback
```
AS A user in a region where Arabic is not the default language
I WANT the app to default to English if Arabic translations are unavailable
SO THAT I can still use the app without errors.

Given I have selected Arabic as my preferred language
When I access a part of the app that does not have Arabic translations
Then the app should display the text in English as a fallback.
```

### User Story 3: Language Switching
```
AS A user who speaks multiple languages
I WANT to switch between languages in the app
SO THAT I can use the app in my preferred language at any time.

Given I am on the settings screen
When I select Arabic from the language options
Then the app should immediately switch to Arabic and persist my choice.
```

---

## 2. Acceptance Criteria

### Arabic Language Support
1. All app text, labels, buttons, and messages must be displayed in Arabic when the language is selected.
2. The app must use the `app_ar.arb` file for Arabic translations.
3. The app must support right-to-left (RTL) layout when Arabic is selected.

### Default Language Fallback
1. If a string is not available in the Arabic ARB file, the app must display the English version of the string from `app_en.arb`.
2. No untranslated strings should cause errors or crashes in the app.

### Language Switching
1. The settings screen must include an option to select the Arabic language.
2. The selected language must be saved in the app's local storage using Brick for offline persistence.
3. The app must reload the UI in Arabic immediately after the language is switched.
4. The language selection must persist across app restarts.

---

## 3. Data Model Impact

### New Brick Model
A new Brick model is not required for this feature. However, the existing `Settings` model should be updated to include a field for storing the user's preferred language.

#### Updated `Settings` Model
```dart
import 'package:brick_offline_first_with_rest/offline_first_with_rest.dart';

final settingsProvider = StateNotifierProvider<SettingsNotifier, Settings>((ref) {
  return SettingsNotifier();
});

class Settings extends OfflineFirstModel {
  final String preferredLanguage;

  Settings({
    this.preferredLanguage = 'en', // Default to English
  });
}
```

### Supabase Impact
1. Add a new column `preferred_language` to the `users` table in Supabase to store the user's language preference.
   - **Column Name**: `preferred_language`
   - **Type**: `text`
   - **Default**: `'en'`

---

## 4. UI Flow Description

### Screens Affected
1. **Settings Screen**:
   - Add a dropdown or segmented control for selecting the preferred language.
   - Options: Arabic (`العربية`), English (`English`), and other supported languages.

2. **App Layout**:
   - Ensure all screens adapt to RTL layout when Arabic is selected.
   - Verify that text alignment, navigation drawer, and other UI components behave correctly in RTL.

### Navigation Flow
1. **Settings Screen**:
   - User selects "العربية" from the language dropdown.
   - The app saves the selection to the `Settings` model and updates the UI immediately.
   - The app persists the language preference to local storage and syncs it to Supabase for authenticated users.

2. **App Initialization**:
   - On app launch, check the `preferred_language` field in the local `Settings` model.
   - If the user is authenticated, sync the local `preferred_language` with the value in Supabase.
   - Set the app's locale to the preferred language.

---

## 5. Edge Cases & Constraints

### Offline Behavior
1. If the user is offline:
   - The app should load the language preference from the local `Settings` model.
   - If no preference is found, default to English.

2. Language changes should still take effect offline and be synced to Supabase when the user reconnects.

### Guest User Behavior
1. Guest users should also be able to select Arabic as their preferred language.
2. The language preference for guest users should be stored locally and not synced to Supabase.

### Geographic Variant Considerations
1. Ensure that Arabic translations are compatible with all geographic variants of the app (LATAM, Europe, USA).
2. Verify that region-specific content (e.g., catalog names) is correctly translated or displayed in English if no Arabic translation is available.

### Performance Considerations
1. Ensure that switching languages does not cause noticeable lag or crashes.
2. Minimize the size of ARB files to avoid performance issues on low-end devices.

---

## Implementation Notes

1. **Localization Files**:
   - Ensure `app_ar.arb` is complete and includes translations for all strings in the app.
   - Validate the ARB file using the `intl_translation` package to ensure there are no syntax errors.

2. **RTL Support**:
   - Use `Directionality` widgets in custom UI components to enforce RTL layout.
   - Test all screens for proper alignment and layout in RTL mode.

3. **Testing**:
   - Write unit tests to ensure the `Settings` model correctly saves and retrieves the `preferredLanguage` field.
   - Write integration tests to verify that the app switches languages correctly and persists the selection.

4. **Developer Documentation**:
   - Update the README to include instructions for adding new translations to ARB files.
   - Document the process for testing RTL layouts.

5. **User Education**:
   - Add a tooltip or short description in the settings screen to inform users that they can switch languages.

---

## Example ARB Entry for Arabic
```json
{
  "appTitle": "Sticker Album 2026",
  "authWelcomeTitle": "مرحباً بك في Sticker Album 2026",
  "authEmailLabel": "البريد الإلكتروني",
  "authPasswordLabel": "كلمة المرور",
  "authLoginButton": "تسجيل الدخول",
  "authContinueWith": "أو تابع باستخدام",
  "authContinueGoogle": "المتابعة مع Google",
  "authContinueApple": "المتابعة مع Apple",
  "authContinueGuest": "المتابعة كضيف",
  "authNoAccountRegister": "ليس لديك حساب؟ سجّل الآن",
  "authForgotPassword": "نسيت كلمة المرور؟"
}
```

This ensures that the app is fully localized for Arabic-speaking users while maintaining fallback and offline functionality.
