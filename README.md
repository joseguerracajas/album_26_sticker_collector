# Album 26 — Sticker Collector

> **Documento de referencia para agentes de IA.**
> Este archivo describe con precisión cada archivo del proyecto, su propósito, sus dependencias internas y las decisiones de diseño tomadas. Está pensado para que un agente pueda comprender, modificar o extender el código sin ambigüedad.

---

## Índice

1. [Visión general](#1-visión-general)
2. [Stack tecnológico](#2-stack-tecnológico)
3. [Arquitectura](#3-arquitectura)
4. [Configuración raíz](#4-configuración-raíz)
5. [Punto de entrada — `lib/main.dart`](#5-punto-de-entrada--libmaindart)
6. [Capa de datos offline — `lib/brick/`](#6-capa-de-datos-offline--libbrick)
7. [Core — `lib/core/`](#7-core--libcore)
8. [Feature: Auth — `lib/features/auth/`](#8-feature-auth--libfeaturesauth)
9. [Feature: Catalog — `lib/features/catalog/`](#9-feature-catalog--libfeaturescatalog)
10. [Feature: Inventory — `lib/features/inventory/`](#10-feature-inventory--libfeaturesinventory)
11. [Feature: Monetization — `lib/features/monetization/`](#11-feature-monetization--libfeaturesmonetization)
12. [Feature: Trade — `lib/features/trade/`](#12-feature-trade--libfeaturestrade)
13. [Localización — `lib/l10n/`](#13-localización--libl10n)
14. [Esquema de base de datos Supabase](#14-esquema-de-base-de-datos-supabase)
15. [Flujos principales](#15-flujos-principales)
16. [Convenciones y reglas](#16-convenciones-y-reglas)

---

## 1. Visión general

**Album 26 Sticker Collector** es una aplicación móvil multiplataforma (iOS/Android) construida en Flutter. Permite a coleccionistas de cromos del álbum oficial del Mundial 2026:

- **Registrar** qué cromos tienen, cuántos repetidos poseen y cuáles les faltan.
- **Escanear** cromos físicos con la cámara usando OCR (ML Kit) para actualizar el inventario automáticamente.
- **Intercambiar** cromos digitalmente con otros usuarios en tiempo real vía Supabase Realtime.
- **Intercambiar físicamente** (cara a cara): escanear un lote de cromos ajenos y ver cuáles necesita cada quien.
- **Consultar estadísticas** de progreso por categoría/país y ordenarlas por múltiples criterios.
- **Compartir** listas de faltantes y repetidos por texto.
- **Operar sin conexión**: el inventario y el catálogo se persisten localmente en SQLite y se sincronizan con Supabase cuando hay red.
- **Funcionar como invitado** sin registrarse; los datos se migran automáticamente al crear cuenta.
- **Soportar variantes geográficas** del álbum (LATAM, Europa, USA, etc.): el catálogo se filtra según la variante elegida por el usuario.

---

## 2. Stack tecnológico

| Capa | Tecnología | Versión aprox. |
|---|---|---|
| UI | Flutter | SDK ≥ 3.11.3 |
| Gestión de estado | Riverpod | ^3.3.1 |
| Backend / Auth | Supabase | ^2.12.0 |
| ORM offline-first | Brick (offline_first_with_supabase) | ^4.x / ^2.x |
| Base de datos local | SQLite vía sqflite | ^2.4.2 |
| OCR / Cámara | ML Kit Text Recognition + camera | ^0.15.1 / ^0.12.0 |
| QR | mobile_scanner, qr_flutter | ^7.0.1 / ^4.1.0 |
| Autenticación social | google_sign_in, sign_in_with_apple | ^7.2.0 / ^7.0.1 |
| Monetización | RevenueCat (purchases_flutter) | ^8.8.0 |
| Publicidad | Google Mobile Ads (AdMob) | ^5.3.0 |
| Localización | Flutter intl / ARB | ^0.20.2 |
| Animaciones | flutter_animate, animations | ^4.5.2 / ^2.1.1 |
| Tutorial coach mark | tutorial_coach_mark | ^1.2.11 |
| Actualización forzada | upgrader | ^11.4.0 |
| Valoración en tienda | in_app_review | ^2.0.10 |
| Compartir | share_plus | ^12.0.1 |
| Generación de código | build_runner + brick_offline_first_with_supabase_build | |

---

## 3. Arquitectura

El proyecto sigue **Clean Architecture** con organización **Feature-First**:

```
lib/
├── main.dart                  ← Punto de entrada
├── brick/                     ← Capa de datos offline (Brick ORM)
├── core/                      ← Utilidades, servicios y widgets transversales
│   ├── constants/
│   ├── tutorial/
│   ├── utils/
│   └── widgets/
├── features/
│   ├── auth/                  ← Autenticación
│   │   ├── data/              ← Providers (lógica de negocio + acceso a datos)
│   │   ├── domain/            ← Modelos de dominio (vacío en auth)
│   │   └── presentation/      ← Pantallas y widgets de UI
│   ├── catalog/               ← Álbum, categorías, stickers
│   ├── inventory/             ← Inventario propio, escaneo, estadísticas
│   ├── monetization/          ← Publicidad y suscripción Pro
│   └── trade/                 ← Intercambio digital entre usuarios
└── l10n/                      ← Archivos de localización
```

**Patrón de capas dentro de cada feature:**
- `domain/` — Modelos de datos (clases Dart puras, anotadas con Brick si se persisten).
- `data/` — Providers de Riverpod que encapsulan lectura/escritura (repositorio, Supabase, SharedPreferences).
- `presentation/` — Widgets de Flutter (pantallas y sub-componentes). Consumen exclusivamente providers.

**Gestión de estado:** Riverpod 3.x. Se usan `FutureProvider`, `StreamProvider`, `NotifierProvider` y `AsyncNotifierProvider` según la naturaleza del dato.

**Acceso a datos:** Todo el acceso pasa por `AppRepository` (singleton de Brick) o directamente por `supabase.from(...)` cuando se requiere tiempo real (streams) o RPCs que no deben ser encoladas offline.

---

## 4. Configuración raíz

### `pubspec.yaml`

Declara el nombre del paquete (`album_26_sticker_collector`), versión (`2.0.1+10`), todas las dependencias y la configuración de los íconos y splash screen nativos.

Puntos clave:
- `generate: true` habilita la generación de archivos de localización (`AppLocalizations`).
- `assets/icon/` es el único directorio de assets declarado.
- `flutter_launcher_icons` genera íconos adaptativos Android y el ícono iOS a partir de `assets/icon/app_icon.png` sobre fondo negro `#000000`.
- `flutter_native_splash` genera la pantalla de carga nativa (iOS y Android 12+) en negro con el logo centrado.

### `analysis_options.yaml`

Extiende las reglas de `flutter_lints`. No agrega lints personalizados significativos.

### `build.yaml`

Configura el builder de Brick (`brick_offline_first_with_supabase_build`) para la generación de adaptadores y el esquema SQLite.

### `l10n.yaml`

```yaml
arb-dir: lib/l10n
template-arb-file: app_en.arb
output-localization-file: app_localizations.dart
```

Indica que el archivo inglés es la plantilla maestra y que la clase generada se llama `AppLocalizations`.

### `GoogleService-Info.plist`

Credenciales de Firebase para iOS (usado por Google Sign-In y el SDK de AdMob). **No modificar manualmente.**

---

## 5. Punto de entrada — `lib/main.dart`

**Archivo:** `lib/main.dart`

**Responsabilidades:**
1. Configura e inicializa `AppRepository` (Brick + Supabase) con la URL y clave anónima de Supabase.
2. Inicializa AdMob (`initializeAdMob()`).
3. Envuelve la app en `ProviderScope` (Riverpod).
4. Define `MainApp` — el `MaterialApp` raíz.

**Globals importantes:**
- `final supabase = Supabase.instance.client;` — Instancia global del cliente Supabase. **Todos los accesos directos a Supabase del resto del código importan este archivo.**
- `final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();` — Permite mostrar SnackBars desde fuera del árbol de widgets.

**Tema:**
- Fondo oscuro `#121212`, AppBar `#1E1E1E`.
- Color primario de acento: `Colors.amber` (dorado).
- `InputDecorationTheme` global con borde dorado al focus y sin borde en reposo.
- `DialogTheme` oscuro con título amber.
- La app muestra un `CustomUpgradeAlert` (upgrader) que verifica actualizaciones en el store al iniciar.

**Localización:**
- Soporta 18 idiomas vía `AppLocalizations`.
- El título de la app se genera dinámicamente con `onGenerateTitle`.

---

## 6. Capa de datos offline — `lib/brick/`

Brick es el ORM offline-first que sincroniza Supabase (remoto) ↔ SQLite (local) ↔ caché en memoria. Los archivos generados por `build_runner` no deben modificarse manualmente.

### `lib/brick/app_repository.dart`

**Clase:** `AppRepository extends OfflineFirstWithSupabaseRepository`

**Patrón:** Singleton (`_singleton`). Se accede con `AppRepository()`.

**Método estático `configure({supabaseUrl, supabaseAnonKey})`:**
- Crea el par `(httpClient, offlineRequestQueue)` con `clientQueue()`.
- La `offlineRequestQueue` intercepta escrituras HTTP y las encola en SQLite cuando no hay red. Se excluyen de la cola los paths:
  - `/auth/v1` — autenticación
  - `/storage/v1` — storage
  - `/rest/v1/rpc/` — llamadas RPC
  - `/rest/v1/trade_sessions` — trades (deben fallar rápido)
  - `/rest/v1/trade_offers` — trades
  - `/rest/v1/user_trade_codes` — códigos de intercambio
- Inicializa Supabase con el `httpClient` modificado de Brick.
- Crea `SupabaseProvider` y `SqliteProvider` apuntando a `album_offline_v1.sqlite`.
- Llama a `clearQueuedRpcRequests()` para limpiar solicitudes RPC heredadas de versiones anteriores.
- Llama a `initialize()` para correr las migraciones SQLite.

**Métodos de instancia:**
- `startSyncQueue()` / `stopSyncQueue()` — Activa/desactiva la cola offline. Se llama en login/logout.

**Método estático `clearQueuedRpcRequests()`:**
- Abre `brick_offline_queue.sqlite` directamente y borra filas de `HttpJobs` cuya URL contenga `/rpc/`.
- Evita que RPCs de versiones anteriores se reintenten indefinidamente al actualizar la app.

### `lib/brick/brick.g.dart`

**Generado automáticamente.** Define los diccionarios de modelos para Supabase y SQLite:
- `supabaseModelDictionary` — mapea cada clase de modelo a su `SupabaseAdapter`.
- `sqliteModelDictionary` — mapea cada clase de modelo a su `SqliteAdapter`.

### `lib/brick/db/schema.g.dart`

**Generado automáticamente.** Contiene el esquema SQLite actual (tablas y columnas de todos los modelos).

### `lib/brick/db/*.migration.dart`

Migraciones SQLite generadas automáticamente por Brick. Cada archivo representa un estado de la base de datos. Los nombres contienen timestamps:
- `20260324221334.migration.dart`
- `20260326041305.migration.dart`
- `20260422225125.migration.dart`
- `20260426172154.migration.dart`

### `lib/brick/adapters/*.adapter.g.dart`

**Generados automáticamente.** Uno por cada modelo de dominio anotado con `@ConnectOfflineFirstWithSupabase`. Contienen la lógica de serialización/deserialización entre JSON de Supabase, SQLite y los objetos Dart.

Adaptadores existentes:
- `album_adapter.g.dart`
- `album_variant_adapter.g.dart`
- `album_variant_sticker_adapter.g.dart`
- `category_adapter.g.dart`
- `inventory_adapter.g.dart`
- `sticker_adapter.g.dart`
- `sticker_variant_adapter.g.dart`
- `user_variant_preference_adapter.g.dart`

---

## 7. Core — `lib/core/`

Módulos transversales reutilizables por cualquier feature.

### `lib/core/constants/app_urls.dart`

**Clase:** `AppUrls` (constructora privada, solo miembros estáticos).

| Constante | Valor |
|---|---|
| `privacyPolicy` | URL de la política de privacidad (flycricket.io) |
| `termsOfUse` | EULA estándar de Apple (aceptado en el proceso de revisión de App Store) |

### `lib/core/utils/connectivity_checker.dart`

**Función:** `Future<bool> hasInternetConnection()`

Realiza un `InternetAddress.lookup('google.com')` con timeout de 5 segundos para verificar conectividad real (no solo si hay red WiFi/celular activa). Retorna `false` en caso de `SocketException` u otro error.

**Uso:** Se llama antes de cada intento de login para mostrar un error amigable si no hay internet.

### `lib/core/utils/supabase_error_mapper.dart`

**Función:** `String mapSupabaseError(Object e, AppLocalizations l10n)`

Convierte excepciones de Supabase (`AuthException`) o de red (`SocketException`) en mensajes localizados legibles por el usuario. Internamente usa `_mapAuthException` que mapea por `e.code` y por substrings del mensaje de error (para compatibilidad con versiones anteriores de la API de Supabase).

Códigos manejados:
- `invalid_credentials` → credenciales inválidas
- `email_not_confirmed` → email sin confirmar
- `user_already_exists` → usuario ya registrado
- `weak_password` → contraseña débil
- `invalid_email` → email inválido
- `otp_expired` / `token_expired` → OTP expirado
- Errores de red → sin conexión

### `lib/core/utils/rating_service.dart`

**Clase:** `RatingService` (constructora privada, solo miembros estáticos).

Gestiona la solicitud de valoración en la tienda de aplicaciones.

**Constantes:**
- `_kAppStoreId = '6745819003'` — ID de la app en App Store.
- `_kPlayStoreId = 'com.album26.sticker_collector'` — ID en Play Store.
- `_kPromptThreshold = 10` — Número de escaneos exitosos antes de pedir valoración.

**Métodos:**
- `openStoreListing()` — Abre la ficha de la app en la tienda correspondiente.
- `trackScanAndMaybePrompt()` — Incrementa el contador de escaneos en `SharedPreferences`. Al llegar a 10 (y solo si el usuario no fue preguntado antes), muestra el diálogo nativo de valoración (`in_app_review`).

### `lib/core/widgets/custom_upgrade_alert.dart`

**Clase:** `CustomUpgradeAlert extends UpgradeAlert`

Sobreescribe el botón "Actualizar" del diálogo de actualización forzada para aplicar el estilo visual de la app (fondo amber, letra negra). Los demás botones ("Después", "Ignorar") usan `TextButton` en color gris.

### `lib/core/tutorial/tutorial_service.dart`

**Clase:** `TutorialService` (estática).

Gestiona mediante `SharedPreferences` si cada tutorial ya fue visto. Un tutorial "hecho" nunca se muestra de nuevo.

Tutoriales registrados (pares de métodos `is*Done()` / `mark*Done()`):
| Key en SharedPreferences | Tutorial |
|---|---|
| `tutorial_home_v1` | Pantalla principal (HomeScreen) |
| `tutorial_global_v1` | Colección global |
| `tutorial_category_v1` | Detalle de categoría |
| `tutorial_lookup_v1` | Búsqueda de sticker |
| `tutorial_sticker_grid_v1` | Grid de stickers (compartido entre GlobalCollection y CategoryDetail) |
| `tutorial_scanner_v1` | Escáner OCR |
| `tutorial_exchange_v1` | Intercambio físico |
| `tutorial_stats_v1` | Estadísticas |

### `lib/core/tutorial/tutorial_keys.dart`

Define `GlobalKey` para cada widget objetivo de los coachmarks. Estos keys deben asignarse al `key:` del widget correspondiente en la UI para que `tutorial_coach_mark` pueda calcular su posición en pantalla.

Keys definidos (por pantalla):
- **HomeScreen:** `tutorialProgressCardKey`, `tutorialSearchBarKey`, `tutorialDrawerKey`, `tutorialScannerKey`, `tutorialShareKey`, `tutorialCategoryTileKey`
- **VariantSelectorSheet:** `tutorialVariantListKey`
- **GlobalCollection / CategoryDetail:** `tutorialFilterBarKey`, `tutorialStickerSearchKey`, `tutorialStickerCardKey`
- **StickerLookupScreen:** `tutorialLookupTabBarKey`, `tutorialLookupSearchFieldKey`, `tutorialLookupSearchButtonKey`
- **ScannerScreen:** `tutorialScannerModeKey`, `tutorialScannerFrameKey`
- **BottomNavigationBar (AppShell):** `tutorialNavAlbumKey`, `tutorialNavScannerKey`, `tutorialNavExchangeKey`, `tutorialNavLookupKey`, `tutorialNavStatsKey`

### `lib/core/tutorial/*_tutorial.dart`

Cada archivo de tutorial define una clase estática con un método `show(BuildContext context)` que usa `tutorial_coach_mark` para mostrar una secuencia de pasos sobre los widgets objetivo. Al terminar, llama al método `mark*Done()` de `TutorialService`.

Archivos:
- `home_tutorial.dart` — Tour de la pantalla principal.
- `global_collection_tutorial.dart` — Tour de la colección global.
- `category_detail_tutorial.dart` — Tour del detalle de categoría.
- `lookup_tutorial.dart` — Tour del buscador de stickers.
- `scanner_tutorial.dart` — Tour del escáner.
- `exchange_tutorial.dart` — Tour del intercambio físico.
- `statistics_tutorial.dart` — Tour de las estadísticas.
- `variant_tutorial.dart` — Tour del selector de variante geográfica.

---

## 8. Feature: Auth — `lib/features/auth/`

### Dominio

No hay modelos de dominio propios en auth. Los modelos de usuario son provistos directamente por Supabase (`User`, `Session`).

### Data

#### `lib/features/auth/data/guest_session_provider.dart`

**Constantes:**
- `guestInventoryUserId = '__guest_local_user__'` — ID ficticio usado como `userId` en el inventario SQLite local cuando el usuario no está autenticado. Permite que un invitado use la app completamente.
- `_guestModeKey = 'guest_mode_enabled'` — Clave en `SharedPreferences`.

**Provider:** `guestSessionProvider` (`AsyncNotifierProvider<GuestSessionNotifier, bool>`)

**Clase:** `GuestSessionNotifier`
- `build()` — Lee el flag de `SharedPreferences`.
- `enableGuestMode()` — Persiste `true` y actualiza el estado.
- `disableGuestMode()` — Persiste `false` y actualiza el estado.

**Uso:** Determina si mostrar el banner de invitado, si omitir llamadas a Supabase y qué `userId` usar en el inventario.

#### `lib/features/auth/data/auth_provider.dart`

**Enum:** `GuestMergeResult` — `none | migratedGuestToNewAccount | usedExistingRemote`

**Notifier:** `GuestMergeResultNotifier` — Estado global del resultado de la fusión de datos de invitado al autenticarse. La UI lo observa para mostrar mensajes informativos.

**Clase:** `AuthController`

Accede a `supabase.auth` y coordina la autenticación con la sincronización del inventario.

**Métodos:**

| Método | Descripción |
|---|---|
| `login(email, password)` | Autenticación email/password con `signInWithPassword`. Llama a `_iniciarSincronizacion`. |
| `sendPasswordResetEmail(email)` | Envía email de recuperación de contraseña. |
| `verifyRecoveryOtp(email, otp)` | Verifica el código OTP de recuperación. Lanza excepción si la sesión es nula. |
| `updatePassword(newPassword)` | Actualiza la contraseña del usuario autenticado. |
| `loginWithGoogle()` | Flujo OAuth Google usando `google_sign_in` v7+. Obtiene `idToken` + `accessToken` y los envía a Supabase con `signInWithIdToken`. |
| `loginWithApple()` | Flujo OAuth Apple con nonce SHA-256. Obtiene `identityToken` y lo envía a Supabase. |
| `_iniciarSincronizacion({hadGuestData})` | Método privado central post-login: desactiva modo invitado, migra o descarta datos de invitado, realiza sincronización espejo, vincula RevenueCat, inicia la cola offline e invalida `inventoryProvider`. |
| `logout()` | Detiene la cola offline, limpia la caché, desactiva modo invitado, limpia `inventoryProvider`, hace `supabase.auth.signOut()`. |
| `deleteAccount()` | Llama al endpoint RPC `delete_own_account` de Supabase. Si falla, propaga el error. |
| `register(email, password)` | Crea cuenta con `supabase.auth.signUp`. |

**Lógica de fusión de datos de invitado (`_iniciarSincronizacion`):**
1. Detecta si había datos de invitado antes del login (`hadGuestData`).
2. Si el usuario ya tiene inventario remoto → descarta los datos locales de invitado (`discardGuestDataAndUseRemote`).
3. Si no tiene inventario remoto → migra los datos locales de invitado al nuevo `userId` (`migrateGuestDataToUser`).
4. Actualiza `guestMergeResultProvider` con el resultado.

### Presentation

#### `lib/features/auth/presentation/auth_screen.dart` (nombre interno: `LoginScreen`)

Pantalla de login con:
- Campo email + campo contraseña.
- Botón "Ingresar" (email/password).
- Botón "Continuar con Google".
- Botón "Continuar con Apple" (solo iOS).
- Botón "Olvidé mi contraseña" → navega a `ForgotPasswordScreen`.
- Enlace a `RegisterScreen`.
- Botón "Continuar como invitado" → activa `guestSessionProvider` y navega a `AppShell`.
- Valida formato de email con regex antes de enviar.
- Usa `_ejecutarLogin()` como wrapper que maneja loading state, verifica conectividad y mapea errores.

#### `lib/features/auth/presentation/register_screen.dart`

Pantalla de registro con campos email y contraseña (x2 para confirmar). Llama a `authControllerProvider.register()`.

#### `lib/features/auth/presentation/forgot_password_screen.dart`

Flujo de recuperación de contraseña en dos pasos:
1. Ingreso de email → llama `sendPasswordResetEmail`.
2. Ingreso del código OTP + nueva contraseña → llama `verifyRecoveryOtp` y `updatePassword`.

#### `lib/features/auth/presentation/profile_screen.dart`

Pantalla del perfil de usuario autenticado. Accesible desde el menú drawer en `HomeScreen`.

Funcionalidades:
- Muestra el email del usuario actual.
- Botón "Cambiar contraseña" → dialog con campos nueva contraseña + confirmación.
- Botón "Cerrar sesión" → llama `authControllerProvider.logout()`.
- Botón "Eliminar cuenta" → dialog de confirmación doble + llamada a `authControllerProvider.deleteAccount()`.
- Swipe desde borde izquierdo para cerrar (compatibilidad con gesto nativo iOS).

---

## 9. Feature: Catalog — `lib/features/catalog/`

El catálogo define la estructura completa del álbum: qué álbum está activo, sus variantes geográficas, las categorías (países/equipos) y los stickers (cromos) de cada categoría.

### Dominio

Todos los modelos del catálogo están anotados con `@ConnectOfflineFirstWithSupabase` para ser persistidos en SQLite y sincronizados con Supabase.

#### `lib/features/catalog/domain/album.model.dart`

**Tabla Supabase:** `albums`

| Campo | Tipo | Descripción |
|---|---|---|
| `id` | `String` (UUID) | PK único, indexado |
| `name` | `String` | Nombre del álbum (ej: "Sticker Album 2026") |
| `year` | `int` | Año del álbum |
| `isActive` | `bool` | Si es el álbum activo que se muestra por defecto |
| `coverUrl` | `String?` | URL de la portada del álbum |

#### `lib/features/catalog/domain/album_variant.model.dart`

**Tabla Supabase:** `album_variants`

Variante geográfica del álbum (ej: LATAM, Europa, USA). El catálogo de stickers visible en la app varía según la variante.

| Campo | Tipo | Descripción |
|---|---|---|
| `id` | `String` (UUID) | PK único |
| `albumId` | `String` | FK → `albums.id` |
| `name` | `String` | Nombre de la variante (ej: "LATAM") |
| `isDefault` | `bool` | Si se preselecciona al abrir el álbum por primera vez |

#### `lib/features/catalog/domain/album_variant_sticker.model.dart`

**Tabla Supabase:** `album_variant_stickers`

Tabla de unión que controla qué stickers pertenecen a cada variante geográfica. Si un sticker no aparece aquí para una variante, está oculto en la UI para esa variante, **pero el inventario del usuario nunca se borra**. Si el usuario cambia de variante, sus datos previos son recuperados.

| Campo | Tipo | Descripción |
|---|---|---|
| `id` | `String` (UUID) | PK único |
| `albumVariantId` | `String` | FK → `album_variants.id` |
| `stickerId` | `String` | FK → `stickers.id` |

#### `lib/features/catalog/domain/category.model.dart`

**Tabla Supabase:** `categories`

Agrupa los stickers por país/equipo/sección del álbum.

| Campo | Tipo | Descripción |
|---|---|---|
| `id` | `String` | ID corto (ej: "ARG", "BRA") — también es el prefijo del código de sticker |
| `name` | `String` | Nombre completo (ej: "Argentina") |
| `orderIndex` | `int` | Orden de aparición en el álbum |
| `backgroundUrl` | `String?` | URL de imagen de fondo de la categoría |
| `iconUrl` | `String?` | URL del ícono de la categoría |
| `emoji` | `String` | Emoji representativo (ej: 🇦🇷) |
| `albumId` | `String?` | FK → `albums.id` |

#### `lib/features/catalog/domain/sticker.model.dart`

**Tabla Supabase:** `stickers`

Cromo individual del álbum.

| Campo | Tipo | Descripción |
|---|---|---|
| `id` | `String` (UUID) | PK único |
| `categoryId` | `String` | FK → `categories.id` |
| `stickerCode` | `String` | Código numérico del cromo dentro de la categoría (ej: "10") |
| `description` | `String?` | Descripción opcional del cromo |
| `orderIndex` | `int` | Orden dentro de la categoría |
| `hasSpecialVariants` | `bool` | Si el cromo existe en variantes especiales (foil, brillo, etc.) |

**Código de sticker completo:** `categoryId + stickerCode` (ej: "ARG10"). El OCR escanea este código.

#### `lib/features/catalog/domain/sticker_variant.model.dart`

**Tabla Supabase:** `sticker_variants`

Define los tipos de variante especial de un cromo (ej: versión normal, foil dorado, brillo plateado).

| Campo | Tipo | Descripción |
|---|---|---|
| `id` | `String` | ID de la variante (ej: "normal", "foil") |
| `name` | `String` | Nombre mostrable |
| `hexColor` | `String` | Color hexadecimal para el indicador visual |
| `isSpecial` | `bool?` | Si es una variante especial (no normal) |
| `iconUrl` | `String?` | URL del ícono de la variante |
| `orderIndex` | `int` | Orden de presentación |

### Data

#### `lib/features/catalog/data/catalog_provider.dart`

> **Nota:** Este archivo estaba duplicado históricamente. La versión activa del provider de categorías es `categories_provider.dart`. Este archivo define un `categoriesProvider` alternativo que solo ordena por `orderIndex` sin filtrar por variante. **Solo se usa internamente por el escáner y el intercambio físico** para obtener el mapa de emojis sin restricción de variante.

#### `lib/features/catalog/data/categories_provider.dart`

**Provider:** `categoriesProvider` (`FutureProvider<List<Category>>`)

- Obtiene todas las categorías vía Brick.
- Ordena por `orderIndex`.
- Filtra para excluir categorías que no tienen stickers activos en la variante actual (usa `allStickersProvider` que ya filtra por variante).
- Resultado: solo las categorías visibles para la variante geográfica activa.

#### `lib/features/catalog/data/stickers_provider.dart`

**Provider:** `allStickersProvider` (`FutureProvider<List<Sticker>>`)
- Obtiene todos los stickers vía Brick.
- Aplica el filtro de variante activa (`activeVariantStickerIdsProvider`): si hay IDs de variante, solo devuelve los stickers incluidos.

**Provider:** `stickersByCategoryProvider` (`FutureProvider.family<List<Sticker>, String>`)
- Parámetro: `categoryId`.
- Filtra `allStickersProvider` por categoría y luego por variante activa.
- Ordena por `orderIndex`.

#### `lib/features/catalog/data/variants_provider.dart`

**Provider:** `variantsProvider` (`FutureProvider<List<StickerVariant>>`)
- Obtiene todas las variantes de stickers (foil, normal, etc.).
- Ordena por `id` ascendente.

#### `lib/features/catalog/data/album_variant_provider.dart`

Gestiona el álbum activo, sus variantes geográficas y la preferencia del usuario.

**Provider:** `activeAlbumProvider` (`FutureProvider<Album?>`)
- Obtiene todos los álbumes y retorna el que tiene `isActive = true`.
- Política: `awaitRemoteWhenNoneExist` (espera al remoto si no hay datos locales).

**Provider:** `activeAlbumVariantsProvider` (`FutureProvider<List<AlbumVariant>>`)
- Filtra las variantes del álbum activo.
- Ordena alfabéticamente por nombre.

**Provider:** `activeVariantStickerIdsProvider` (`FutureProvider<Set<String>?>`)
- Devuelve el set de IDs de stickers que pertenecen a la variante geográfica seleccionada por el usuario.
- Retorna `null` si no hay preferencia (sin restricción → mostrar todo).
- Retorna `null` si no hay filas en `album_variant_stickers` para esa variante.

**Provider:** `activeVariantPreferenceProvider` (`AsyncNotifierProvider<ActiveVariantPreferenceNotifier, UserVariantPreference?>`)

**Clase:** `ActiveVariantPreferenceNotifier`
- Para usuarios autenticados: busca en SQLite/Supabase por `(userId, albumId)`. Si no existe, crea una con la variante `isDefault = true`.
- Para invitados: usa `SharedPreferences` con la clave `guest_album_variant_id`.
- `selectVariant(AlbumVariant variant)` — Actualiza o crea la preferencia. Para invitados, solo persiste en SharedPreferences.

#### `lib/features/catalog/data/sync_provider.dart`

**Provider:** `syncServiceProvider` (`Provider<SyncService>`)

**Clase:** `SyncService`

Implementa el **protocolo espejo** de sincronización: en lugar de confiar en el merge automático de Brick, compara explícitamente los datos remotos con los locales y aplica inserts, updates y deletes para garantizar que el SQLite sea un espejo exacto de Supabase.

**Métodos:**

| Método | Descripción |
|---|---|
| `refreshAll()` | Punto de entrada del pull-to-refresh. Sincroniza catálogo completo e inventario del usuario, luego invalida todos los providers. |
| `sincronizarCatalogo()` | Sincroniza espejo para: `Category`, `Sticker`, `StickerVariant`, `Album`, `AlbumVariant`, `AlbumVariantSticker`, `UserVariantPreference` (para usuario autenticado). |
| `sincronizacionFisicaEspejo(userId)` | Sincroniza espejo del inventario del usuario: compara remoto vs local y aplica diffs. |
| `hasGuestData()` | Verifica si hay filas de inventario con `userId = __guest_local_user__`. |
| `remoteHasInventory(userId)` | Verifica si Supabase tiene inventario para ese usuario. |
| `migrateGuestDataToUser(userId)` | Copia el inventario de invitado al nuevo usuario (cambia el `userId`) y borra los registros de invitado. |
| `discardGuestDataAndUseRemote(userId)` | Borra el inventario de invitado y carga el inventario remoto en SQLite. |

### Utils

#### `lib/features/catalog/utils/sticker_filters.dart`

**Función pura:** `aplicarFiltrosCromos({stickers, inventarioGlobal, filtroActual, busqueda, category})`

Filtra una lista de stickers por:
1. **Estado**: todos / faltantes (cantidad = 0) / repetidas (cantidad > 1).
2. **Búsqueda de texto**: contra `"categoryName categoryId stickerCode"` (case-insensitive).

### Presentation

#### `lib/features/catalog/presentation/app_shell.dart`

**Widget principal de navegación.** Contiene la `BottomNavigationBar` y el `IndexedStack` con las 5 pestañas.

**Índices del `IndexedStack`:**
| Índice | Pantalla | Tab |
|---|---|---|
| 0 | `HomeScreen` | Álbum |
| 1 | `ScannerScreen` | Escáner |
| 2 | `PhysicalExchangeScreen` | Intercambio |
| 3 | `StickerLookupScreen` | Buscar |
| 4 | `StatisticsScreen` | Estadísticas |

**Lógica de navegación:**
- Al cambiar de tab, notifica al provider correspondiente (`scannerTabActiveProvider`, `exchangeTabActiveProvider`, `lookupTabActiveProvider`, `statisticsTabActiveProvider`) para que la pantalla active/desactive su cámara. Esto evita conflictos de hardware de cámara en el `IndexedStack`.
- El tab Escáner (índice 1) tiene una **puerta Pro**: si el usuario no es suscriptor, primero muestra un anuncio recompensado. Si el usuario elige "Ahora no", no se navega al escáner.

**Widgets en el footer:**
- `AdBannerWidget` — Banner de AdMob (se oculta si el usuario es Pro).
- `Divider` dorado.
- `BottomNavigationBar` con ítems dorados.

#### `lib/features/catalog/presentation/home_screen.dart`

Pantalla principal del álbum (índice 0).

**Estado local:**
- `SearchQueryNotifier` + `searchQueryProvider` — Controla el texto del buscador global de categorías.

**Función `_normalize(String)`:** Elimina acentos para búsqueda case-insensitive.

**Lógica de inicialización:**
- Escucha `activeVariantPreferenceProvider`: si no hay variante elegida, muestra `VariantSelectorSheet` de forma obligatoria (no se puede cerrar sin elegir). Tras cerrarse (o si ya hay variante), lanza el tutorial de Home.

**UI:**
- `AppBar` con botón de drawer (acceso a login/perfil), botón de escáner y botón de compartir.
- Tarjeta de progreso: muestra total de cromos, únicos recolectados y duplicados.
- `StickerStatRow` por cada categoría visible.
- Barra de búsqueda que filtra las categorías visibles.
- Al tocar una categoría → navega a `CategoryDetailScreen` con una animación `OpenContainer`.
- `UpgradeAlert` + `CustomUpgradeAlert` envuelven la pantalla para detección de actualizaciones.
- Solicitud de valoración (`RatingService`) si aplica.

#### `lib/features/catalog/presentation/category_detail_screen.dart`

Muestra todos los stickers de una categoría concreta.

**Parámetro requerido:** `Category category`

**UI:**
- `AppBar` con nombre de la categoría, botón escáner y botón compartir.
- `StickerFilterSearch` — barra de filtros y búsqueda.
- `StickerGrid` — grid de tarjetas de stickers de esa categoría.
- `AdBannerWidget` en el footer.
- `RefreshIndicator` que llama a `syncServiceProvider.refreshAll()`.
- Tutorial de `StickerGrid` en el primer acceso.
- Swipe desde borde izquierdo para volver (compatibilidad iOS).

#### `lib/features/catalog/presentation/global_collection_screen.dart`

Vista de todos los stickers del álbum, agrupados por categoría con posibilidad de colapsar grupos.

**Estado local:**
- `_CollapsedCategoriesNotifier` — Set de IDs de categorías colapsadas.

**UI:**
- Filtra y busca stickers en todas las categorías a la vez.
- Muestra `CategoryAvatar` + `StickerStatRow` por categoría.
- Permite colapsar/expandir cada categoría con animación.
- `StickerGrid` por categoría (visible solo si está expandida).
- Tutorial en el primer acceso.

#### `lib/features/catalog/presentation/statistics_screen.dart`

Pantalla de estadísticas del álbum (índice 4).

**Estado local:**
- `_SelectedCategoryIdsNotifier` — Filtro de categorías seleccionadas.
- `_StatsSortNotifier` — Ordenamiento: por categoría, progreso desc/asc, faltantes desc, duplicados desc.
- `statisticsTabActiveProvider` — Para activar/desactivar la pestaña.

**UI:**
- Tarjeta de progreso global con porcentaje y barra de progreso circular.
- Lista de categorías ordenable con barra de progreso por categoría.
- Filtro multi-selección de categorías.
- `StickerStatRow` por categoría.
- Tutorial en el primer acceso.

#### `lib/features/catalog/presentation/pending_scans_sheet.dart`

Bottom sheet que aparece al tocar el botón flotante del escáner. Muestra la **lista de escaneos pendientes de confirmar** (acumulados en `pendingScansProvider`) con la cantidad de cada uno.

Permite:
- Ver los cromos escaneados en la sesión actual antes de guardar.
- Incrementar/decrementar cantidades.
- Confirmar el guardado masivo → llama a `inventoryProvider.notifier.updateVariantQuantity` por cada sticker.
- Cancelar (descarta los pendientes).

#### `lib/features/catalog/presentation/legal_notice_screen.dart`

Pantalla de aviso legal. Muestra enlaces a `AppUrls.privacyPolicy` y `AppUrls.termsOfUse` vía `url_launcher`.

### Widgets del catálogo

#### `lib/features/catalog/presentation/widgets/animated_sticker_card.dart`

Tarjeta de un cromo en el grid. Muestra:
- Código del cromo.
- Estado visual: fondo oscuro (no tiene), fondo dorado/coloreado (tiene).
- Indicadores de variantes especiales (puntos de colores).
- Animación de entrada y de toggle al tocar.
- Toque corto → toggle normal (tiene/no tiene).
- Toque largo → abre `StickerInfoSheet`.

#### `lib/features/catalog/presentation/widgets/animated_expand_container.dart`

Widget de animación de colapso/expansión de grupos de stickers. Anima la altura entre 0 y el tamaño natural del contenido.

#### `lib/features/catalog/presentation/widgets/app_bar_actions.dart`

Dos botones reutilizables para el `AppBar`:
- `ScannerIconButton` — Navega al escáner standalone (`Navigator.push`).
- `ShareMenuButton` — Muestra un menú de opciones para compartir: todos los stickers, faltantes, o repetidos. Delega en `shareProvider`.

#### `lib/features/catalog/presentation/widgets/category_avatar.dart`

Avatar circular de una categoría. Muestra el `iconUrl` (con `cached_network_image`) o el emoji como fallback.

#### `lib/features/catalog/presentation/widgets/sticker_filter_search.dart`

Barra compuesta de:
- 3 chips de filtro: "Todos", "Faltantes", "Repetidas" (state en `filterProvider`).
- Campo de búsqueda de texto (state en `stickerSearchProvider`).

Ambos providers son `autoDispose` para que se reseteen al salir de la pantalla.

#### `lib/features/catalog/presentation/widgets/sticker_grid.dart`

Grid de `AnimatedStickerCard` para una categoría. Recibe la `Category` y:
- Observa `stickersByCategoryProvider` para la lista de stickers.
- Observa `variantsProvider` para saber qué variantes especiales mostrar.
- Observa `inventoryProvider` para el estado de cada cromo.
- Aplica `aplicarFiltrosCromos` con los filtros activos.
- Maneja el diálogo de confirmación de borrado (si el usuario toca un cromo que ya tiene → confirmar borrado).

#### `lib/features/catalog/presentation/widgets/sticker_stat_row.dart`

Fila compacta de estadísticas de una categoría: nombre, emoji, progreso (n/total), barra de progreso coloreada, número de repetidos. Usada en `HomeScreen`, `GlobalCollectionScreen` y `StatisticsScreen`.

#### `lib/features/catalog/presentation/widgets/variant_selector_sheet.dart`

Bottom sheet para seleccionar la variante geográfica del álbum. Puede abrirse de forma opcional (el usuario puede cerrarlo) u obligatoria (no se puede cerrar sin elegir).

Muestra la lista de `activeAlbumVariantsProvider` con el nombre de cada variante. Al seleccionar, llama a `activeVariantPreferenceProvider.notifier.selectVariant()`.

---

## 10. Feature: Inventory — `lib/features/inventory/`

### Dominio

#### `lib/features/inventory/domain/inventory.model.dart`

**Tabla Supabase:** `inventory`

Registra cuántos cromos de cada tipo y variante tiene el usuario.

| Campo | Tipo | Descripción |
|---|---|---|
| `id` | `String` (UUID) | PK generado con `uuid.v4()` si no se provee |
| `userId` | `String` | ID del usuario (o `__guest_local_user__` para invitados) |
| `stickerId` | `String` | FK → `stickers.id` |
| `variantId` | `String` | FK → `sticker_variants.id` (ej: "normal", "foil") |
| `quantity` | `int` | Cantidad de copias (0 = no tiene) |
| `lastUpdated` | `DateTime?` | Timestamp de última modificación |

**Clave compuesta lógica:** `(userId, stickerId, variantId)` — solo debería existir una fila por combinación.

#### `lib/features/inventory/domain/user_variant_preference.model.dart`

**Tabla Supabase:** `user_variant_preferences`

Registra qué variante geográfica ha seleccionado el usuario para cada álbum. Una fila por par `(userId, albumId)`.

| Campo | Tipo | Descripción |
|---|---|---|
| `id` | `String` (UUID) | PK generado si no se provee |
| `userId` | `String` | FK → usuarios de Supabase Auth |
| `albumId` | `String` | FK → `albums.id` |
| `albumVariantId` | `String` | FK → `album_variants.id` |
| `updatedAt` | `DateTime?` | Timestamp |

**Invariante:** Cambiar variante = solo actualiza `albumVariantId`. El inventario nunca se toca.

#### `lib/features/inventory/domain/scanned_sticker.dart`

**Clase:** `ScannedSticker`

DTO en memoria (no persistido). Representa un cromo detectado por el OCR durante la sesión actual.

| Campo | Tipo | Descripción |
|---|---|---|
| `code` | `String` | Código completo del cromo (ej: "ARG10") |
| `timestamp` | `DateTime` | Momento del escaneo |

### Data

#### `lib/features/inventory/data/inventory_provider.dart`

**Type alias:** `InventoryMap = Map<String, Map<String, int>>`
- Clave externa: `stickerId`
- Clave interna: `variantId`
- Valor: cantidad de copias

**Provider:** `inventoryProvider` (`AsyncNotifierProvider<InventoryNotifier, InventoryMap>`)

**Clase:** `InventoryNotifier`

- `_activeUserId` — Retorna el `id` del usuario autenticado o `guestInventoryUserId` para invitados.
- `_isAuthenticated` — Determina si usar `AppRepository.upsert` (con Supabase) o `AppRepository.sqliteProvider.upsert` (solo local).

**`build()`:**
- Si autenticado: usa política `alwaysHydrate` (lee SQLite + sincroniza con Supabase en background).
- Si invitado: lee solo de SQLite.
- Construye y devuelve el `InventoryMap`.

**`toggleNormalSticker(stickerId)`:**
- Si el sticker tiene cantidad 0 → inserta con quantity=1.
- Si tiene quantity=1 → borra el registro.
- Aplica optimistic update: actualiza el estado en memoria primero, luego persiste. Si falla, revierte.

**`updateVariantQuantity(stickerId, variantId, delta)`:**
- Suma `delta` a la cantidad actual (puede ser negativo para restar).
- No permite cantidades negativas.
- Aplica optimistic update.
- Si `newQty = 0` → borra el registro; si `newQty > 0` → hace upsert.

**`clear()`:** Limpia el mapa (usado en logout).

#### `lib/features/inventory/data/pending_scans_provider.dart`

**Provider:** `pendingScansProvider` (`NotifierProvider.autoDispose<PendingScansNotifier, Map<String, int>>`)

Bandeja temporal de stickers **escaneados** que aún no se han confirmado en el inventario. El mapa es `{ stickerId → cantidad }`.

**Clase:** `PendingScansNotifier`

| Método | Descripción |
|---|---|
| `addSticker(code)` | Agrega o incrementa el sticker en la bandeja. |
| `increment(code)` | Suma 1 a un sticker ya en la bandeja. |
| `decrement(code)` | Resta 1; si llega a 0, elimina el sticker. |
| `removeSticker(code)` | Elimina un sticker de la bandeja. |
| `clear()` | Vacía la bandeja. |

**Ciclo de vida:** `autoDispose` — se destruye cuando ningún widget lo observa (al salir del escáner).

#### `lib/features/inventory/data/pending_remove_provider.dart`

**Provider:** `pendingRemoveProvider` (`NotifierProvider.autoDispose<PendingRemoveNotifier, Map<String, int>>`)

Bandeja temporal de stickers **a quitar** del inventario (solo repetidos). Mismo patrón que `pendingScansProvider` pero para el flujo de eliminación desde el escáner en modo "quitar".

#### `lib/features/inventory/data/stats_provider.dart`

Providers derivados que calculan estadísticas a partir de `inventoryProvider` y el catálogo.

| Provider | Tipo | Descripción |
|---|---|---|
| `totalStickersCountProvider` | `FutureProvider<int>` | Total de stickers en la variante activa (usa `allStickersProvider`). |
| `uniqueCollectedProvider` | `Provider<int>` | Stickers únicos que el usuario tiene (al menos 1 copia). Filtra por variante activa. |
| `categoryStatsProvider` | `FutureProvider<List<CategoryStats>>` | Lista de `CategoryStats` por categoría. |
| `duplicateCopiesCountProvider` | `FutureProvider<int>` | Total de copias duplicadas disponibles (restando las reservadas en trades). |

**Clase `CategoryStats`:**
| Campo | Descripción |
|---|---|
| `category` | Objeto `Category` |
| `total` | Total de stickers en la categoría |
| `collected` | Stickers únicos que el usuario tiene |
| `missing` | Stickers que le faltan |
| `duplicateCopies` | Copias extras disponibles para intercambio |
| `percentage` | `collected / total` |

**Consideración importante:** `categoryStatsProvider` descuenta los stickers reservados en trades activos (usando `myReservedStickerCountsProvider`) para que los "repetidos disponibles" sean correctos.

#### `lib/features/inventory/data/share_provider.dart`

**Enum:** `ShareType` — `todos | faltantes | repetidos`

**Provider:** Notifier que genera y comparte listas de stickers en texto plano.

**Clase:** `ShareNotifier`

`generarYCompartirLista(context, tipo)`:
1. Lee todos los stickers y categorías directamente de Brick (solo local, no va a la red).
2. Los ordena por `category.orderIndex` y `sticker.orderIndex`.
3. Clasifica cada sticker según el inventario en: faltante, repetido o completo.
4. Agrupa por categoría con encabezados de emoji + nombre.
5. Formatea el texto y lanza `SharePlus.share()`.

### Presentation

#### `lib/features/inventory/presentation/camera_coordinator.dart`

**Clase utilitaria estática:** `CameraCoordinator`

Expone `static Future<void>? shutdownFuture`. Cuando una pantalla inicia el dispose de la cámara, almacena el Future aquí. La siguiente pantalla que intente inicializar la cámara espera este Future antes de continuar, evitando conflictos de hardware (el `CameraController` no puede ser inicializado mientras otro está en proceso de liberarse).

#### `lib/features/inventory/presentation/scanner_screen.dart`

Pantalla del escáner OCR (índice 1 en `AppShell`).

**Providers propios:**
- `scannerTabActiveProvider` — Notificado por `AppShell` cuando se activa/desactiva el tab. La pantalla usa esto para inicializar/liberar la cámara de forma diferida (evita el bug de `CameraPreview` en `Offstage` de `IndexedStack`).

**Variables de estado:**
- `_validStickerIdsCache` — Mapa `code → stickerId` construido al iniciar. El OCR valida contra este mapa.
- `_consensusMap` / `_requiredConsensus = 3` — Sistema de consenso: un código debe ser detectado 3 veces consecutivas antes de considerarse válido (reduce falsos positivos del OCR).
- `_cooldownMap` — Evita procesar el mismo sticker repetidamente en un período corto.
- `_scannedThisSession` — Set de sticker IDs escaneados en la sesión actual (para mostrar overlay de "ya escaneado").
- `_overlayLabel` / `_overlayIsNew` — Texto y estilo del overlay de notificación.
- `_isRemoveMode` — Modo alternativo donde los escaneos quitan stickers del inventario.

**Flujo de escaneo:**
1. OCR detecta texto en frames de la cámara.
2. Extrae posibles códigos de sticker con regex.
3. Valida contra `_validStickerIdsCache`.
4. Acumula detecciones en `_consensusMap`. Al llegar a 3 → sticker confirmado.
5. Si el sticker ya fue escaneado en esta sesión → overlay amarillo "Ya tienes".
6. Si es nuevo → agrega a `pendingScansProvider` y activa overlay verde.
7. El haptic feedback (`HapticFeedback.mediumImpact`) confirma cada detección.

**Modo remove:** El ícono cambia; los escaneos van a `pendingRemoveProvider` en lugar de `pendingScansProvider`.

**Botón flotante:** Abre `PendingScansSheet` o `RemoveDuplicatesSheet` según el modo.

**Integración Pro/Ads:** Llama a `RatingService.trackScanAndMaybePrompt()` después de confirmar escaneos. La puerta de acceso al tab ya está en `AppShell`.

#### `lib/features/inventory/presentation/sticker_lookup_screen.dart`

Pantalla de consulta de stickers (índice 3 en `AppShell`). Permite buscar un cromo por código y ver su estado en el inventario.

**Providers propios:**
- `lookupTabActiveProvider` — Para activar/desactivar la cámara interna.

**Dos modos (TabBar):**
1. **Búsqueda manual** — Campo de texto donde el usuario escribe el código (ej: "ARG10"). Busca en `_stickerCache` (precargado al iniciar). Muestra `StickerInfoSheet` con el resultado.
2. **Búsqueda por cámara** — OCR con la cámara (mismo sistema de consenso que el escáner). Al detectar un código válido, muestra `StickerInfoSheet`.

#### `lib/features/inventory/presentation/physical_exchange_screen.dart`

Pantalla de intercambio físico (índice 2 en `AppShell`). Facilita el intercambio cara a cara.

**Providers propios:**
- `exchangeTabActiveProvider` — Para activar/desactivar la cámara.

**Flujo:**
1. El usuario escanea los cromos del otro coleccionista uno por uno.
2. La app clasifica cada cromo escaneado como "me falta" o "repetido" según el inventario propio.
3. Muestra dos listas en tiempo real: `_missing` y `_duplicatesMap`.
4. El usuario puede seleccionar cuáles de los "me faltan" quiere guardar.
5. Al confirmar, llama a `inventoryProvider.notifier.updateVariantQuantity` para agregar los stickers seleccionados.

#### `lib/features/inventory/presentation/remove_duplicates_sheet.dart`

Bottom sheet del modo "quitar" del escáner. Muestra la lista de `pendingRemoveProvider` y permite confirmar la eliminación masiva de stickers repetidos.

#### `lib/features/inventory/presentation/widgets/sticker_info_sheet.dart`

Bottom sheet que muestra la información de un sticker concreto:
- Código completo (ej: "ARG 10").
- Estado: ¿lo tiene o no?
- Cantidad total de copias (por todas las variantes).
- Desglose por variante (normal, foil, etc.) con botones + / -.
- Llama a `inventoryProvider.notifier.updateVariantQuantity` al cambiar cantidades.

---

## 11. Feature: Monetization — `lib/features/monetization/`

### Data

#### `lib/features/monetization/data/subscription_provider.dart`

Gestiona el estado de suscripción Pro vía **RevenueCat**.

**Constantes:**
| Constante | Valor |
|---|---|
| `_kScansDemoKey` | Clave SharedPreferences para contador de escaneos demo |
| `kDemoScanLimit` | 5 — Número de escaneos gratuitos antes de requerir Pro o anuncio |
| `kScannerEntitlement` | `'Album_26_Pro'` — ID del entitlement en RevenueCat |
| `kRevenueCatAppleKey` | API key de RevenueCat para iOS |
| `kRevenueCatGoogleKey` | API key de RevenueCat para Android |

**Clase `SubscriptionState`:**
| Campo | Descripción |
|---|---|
| `isSubscribed` | Si el usuario tiene la suscripción activa |
| `demoScansUsed` | Escaneos demo usados (contados en SharedPreferences) |
| `isLoading` | Si está cargando el estado |
| `canScan` | `isSubscribed || demoScansUsed < kDemoScanLimit` |
| `demoScansRemaining` | Escaneos gratuitos restantes |

**Provider:** `subscriptionProvider` (`AsyncNotifierProvider<SubscriptionNotifier, SubscriptionState>`)

**Clase `SubscriptionNotifier`:**
- `build()` — Configura RevenueCat y carga el estado inicial.
- `_configureRevenueCat()` — Inicializa el SDK de RevenueCat con la key correspondiente a la plataforma. Vincula el usuario de Supabase si hay sesión activa.
- `loginUser(userId)` — Llama a `Purchases.logIn(userId)` para vincular la suscripción con la cuenta.
- `logoutUser()` — Llama a `Purchases.logOut()`.
- `restorePurchases()` — Llama a `Purchases.restorePurchases()`.
- `consumeDemoScan()` — Incrementa el contador de escaneos demo en SharedPreferences.
- `refresh()` — Recarga el estado desde RevenueCat (útil tras una compra).

#### `lib/features/monetization/data/ads_provider.dart`

Gestiona la inicialización de AdMob, los tipos de anuncio y la lógica de monetización mediante publicidad.

**Clase `AdIds`:**
IDs de producción de AdMob por plataforma (iOS/Android):
| Tipo | Descripción |
|---|---|
| `banner` | Anuncio banner |
| `interstitial` | Anuncio intersticial |
| `rewarded` | Anuncio recompensado |

**Función `initializeAdMob()`:**
- En iOS: solicita permiso ATT (`AppTrackingTransparency`) antes de inicializar AdMob.
- Llama a `MobileAds.instance.initialize()`.

**Función `showPreAdDialog(context)`:**
- Muestra un dialog de elección al usuario antes de mostrar un anuncio:
  - "Ver anuncio" → retorna `true`.
  - "Obtener Pro" → navega al `PaywallScreen` y retorna `false`.
  - "Ahora no" → retorna `null`.

**Clase `AdService` / Provider `adServiceProvider`:**
- Carga y muestra anuncios recompensados.
- `showRewarded({context, isSubscribed, onRewarded})` — Si el usuario es Pro, llama directamente a `onRewarded`. Si no, muestra `showPreAdDialog`. Si el usuario elige ver el anuncio, carga el anuncio recompensado y llama a `onRewarded` cuando termina.

**Widget `AdBannerWidget`:**
- Widget que muestra el banner de AdMob.
- Observa `subscriptionProvider`: si el usuario es Pro, retorna `SizedBox.shrink()` (no muestra nada).
- Maneja el ciclo de vida del `BannerAd`.

### Presentation

#### `lib/features/monetization/presentation/paywall_screen.dart`

Pantalla de suscripción Pro.

**UI:**
- Carga las ofertas disponibles de RevenueCat (`Purchases.getOfferings()`).
- Muestra los planes disponibles (anual seleccionado por defecto).
- Botón "Suscribirse" → `Purchases.purchasePackage()`.
- Botón "Restaurar compras" → `subscriptionProvider.notifier.restorePurchases()`.
- Links a política de privacidad y términos de uso.
- Maneja el cálculo de días de prueba gratuita a partir de `IntroductoryPrice`.

---

## 12. Feature: Trade — `lib/features/trade/`

Sistema de intercambio digital de cromos entre usuarios en tiempo real. Utiliza Supabase Realtime (streams) directamente (sin Brick, para evitar la cola offline).

### Dominio

#### `lib/features/trade/domain/trade_session.dart`

**Clase:** `TradeSession`

Representa una sesión de intercambio entre dos usuarios.

| Campo | Tipo | Descripción |
|---|---|---|
| `id` | `String` | UUID de la sesión |
| `initiatorId` | `String` | ID del usuario que inició el trade |
| `receiverId` | `String` | ID del usuario que recibe la invitación |
| `status` | `String` | Estado actual de la sesión |
| `createdAt` | `DateTime` | Fecha de creación |
| `updatedAt` | `DateTime` | Fecha de última actualización |
| `initiatorEmail` | `String?` | Email del iniciador (resuelto opcionalmente) |
| `receiverEmail` | `String?` | Email del receptor (resuelto opcionalmente) |

**Estados del ciclo de vida del trade:**

```
pending_acceptance → selecting → initiator_confirmed ↘
                                                       → reserved → completed
                             ↘ receiver_confirmed  ↗
               cancelled (en cualquier punto)
```

| Estado | Descripción |
|---|---|
| `pending_acceptance` | El receptor aún no aceptó la invitación |
| `selecting` | Ambos usuarios están seleccionando sus ofertas |
| `initiator_confirmed` | El iniciador confirmó su oferta |
| `receiver_confirmed` | El receptor confirmó su oferta |
| `reserved` | Ambos confirmaron; stickers reservados |
| `completed` | Intercambio completado |
| `cancelled` | Cancelado por cualquiera de los dos |

**Propiedades computadas:** `isActive`, `isPendingAcceptance`, `isSelecting`, `isInitiatorConfirmed`, `isReceiverConfirmed`, `isReserved`, `isCompleted`, `isCancelled`, `bothConfirmed`, `partnerIdFor(myId)`, `partnerEmailFor(myId)`.

#### `lib/features/trade/domain/trade_offer.dart`

**Clase:** `TradeOffer`

Representa un cromo que un usuario ofrece en una sesión.

| Campo | Tipo | Descripción |
|---|---|---|
| `id` | `String` | UUID de la oferta |
| `tradeSessionId` | `String` | FK → `trade_sessions.id` |
| `offererId` | `String` | ID del usuario que ofrece el cromo |
| `stickerId` | `String` | FK → `stickers.id` |
| `quantity` | `int` | Cantidad ofrecida |
| `delivered` | `bool` | Si fue marcado como recibido físicamente |
| `createdAt` | `DateTime` | Fecha de creación |

#### `lib/features/trade/domain/trade_partner.dart`

**Clase:** `TradePartner`

DTO en memoria con la información del usuario con quien se va a intercambiar.

| Campo | Tipo | Descripción |
|---|---|---|
| `userId` | `String` | ID del usuario en Supabase Auth |
| `tradeCode` | `String` | Código de 6 dígitos del usuario |
| `email` | `String?` | Email del usuario |

**`displayName`:** Extrae la parte local del email, truncada a 18 caracteres.

### Data

#### `lib/features/trade/data/trade_provider.dart`

Define todos los providers del sistema de trade. Usa directamente `supabase.from(...)` y no Brick, ya que los trades deben fallar rápido (sin cola offline) y necesitan tiempo real.

**Providers de lectura:**

| Provider | Tipo | Descripción |
|---|---|---|
| `myTradeCodeProvider` | `FutureProvider<String>` | Obtiene o genera el código de intercambio de 6 dígitos del usuario. Usa `Random.secure()` para garantizar unicidad. |
| `activeTradeSessionsProvider` | `StreamProvider<List<TradeSession>>` | Stream en tiempo real de sesiones activas (excluyendo completed/cancelled) del usuario. |
| `tradeOffersProvider` | `StreamProvider.family<List<TradeOffer>, String>` | Stream en tiempo real de ofertas de una sesión. |
| `tradeSessionStreamProvider` | `StreamProvider.family<TradeSession?, String>` | Stream de una sesión concreta (para detectar cambios de estado). |
| `tradeHistoryProvider` | `FutureProvider<List<TradeSession>>` | Historial de últimas 50 sesiones completadas o canceladas. |
| `myReservedStickerCountsProvider` | `FutureProvider<Map<String, int>>` | Mapa `stickerId → cantidad reservada` en trades activos. Se usa para descontar de los "repetidos disponibles". |

**Provider de acciones:**

`tradeActionsProvider` (`AsyncNotifierProvider<TradeActionsNotifier, void>`)

**Clase `TradeActionsNotifier`:**

| Método | Descripción |
|---|---|
| `findUserByCode(code)` | Busca en `user_trade_codes` por código de 6 dígitos. Retorna `TradePartner` o `null`. |
| `createSession(partner)` | Crea una nueva `trade_session` con status `pending_acceptance`. El receptor recibe la notificación vía stream. |
| `acceptSession(sessionId)` | Cambia el status a `selecting`. |
| `rejectSession(sessionId)` | Cambia el status a `cancelled`. |
| `updateMyOffer(sessionId, offer)` | Inserta/actualiza las `trade_offers` del usuario para esa sesión. Limpia las ofertas anteriores y vuelve a insertar. |
| `confirmOffer(sessionId, myId, initiatorId)` | Avanza el status: `selecting → initiator_confirmed` o `selecting → receiver_confirmed`. Si ambos confirmaron → `reserved`. |
| `markOffersDelivered(sessionId, offerIds)` | Marca las ofertas como `delivered = true`. Cuando todas las ofertas de una sesión están entregadas, cambia el status a `completed`. |
| `cancelSession(sessionId)` | Cambia el status a `cancelled`. |

### Presentation

#### `lib/features/trade/presentation/trade_hub_screen.dart`

Pantalla hub del sistema de intercambio. Punto de entrada al trade.

**Acceso:** Desde el menú drawer en `HomeScreen`.

**UI:**
- Tarjeta QR con el código de 6 dígitos del usuario (usa `qr_flutter`).
- Botón "Nuevo intercambio" → navega a `FindPartnerScreen`.
- Lista de sesiones activas del usuario (stream en tiempo real). Cada sesión muestra el email del partner, el status y el tiempo transcurrido.
- Al tocar una sesión activa → navega a `TradeNegotiationScreen` o `TradeDeliveryScreen` según el status.
- Botón en AppBar → navega a `TradeHistoryScreen`.

#### `lib/features/trade/presentation/find_partner_screen.dart`

Pantalla para encontrar un compañero de intercambio.

**Dos modos (TabBar):**
1. **Por código** — Campo de texto de 6 dígitos. Llama a `tradeActionsProvider.notifier.findUserByCode()`. Valida que no sea el propio código.
2. **Por QR** — Usa `mobile_scanner` para escanear el QR del otro usuario y extraer su código de 6 dígitos.

**Flujo:**
1. Se encuentra el partner → muestra su nombre/email.
2. Botón "Iniciar intercambio" → `tradeActionsProvider.notifier.createSession()` → navega a `TradeNegotiationScreen`.

#### `lib/features/trade/presentation/trade_negotiation_screen.dart`

Pantalla de negociación de ofertas.

**Parámetro:** `TradeSession session`

**Dos tabs:**
1. **Mi oferta** — Selección de stickers a ofrecer. Filtra el inventario para mostrar solo los que el usuario tiene en cantidad > 0 (disponibles para dar). Permite ajustar cantidades.
2. **Voy a recibir** — Vista de solo lectura de las `trade_offers` del partner.

**Botón "Confirmar mi oferta":**
- Guarda las ofertas con `tradeActionsProvider.notifier.updateMyOffer()`.
- Llama a `tradeActionsProvider.notifier.confirmOffer()`.
- Si el status llega a `reserved` o `completed`, llama a `_finalizeTrade()`.

**`_finalizeTrade(session)`:**
- Actualiza el inventario propio: suma los stickers recibidos del partner, resta los stickers enviados.
- Solo se ejecuta una vez gracias al flag `_inventoryUpdated`.
- Navega al inicio al terminar.

**Escucha en tiempo real:** `ref.listen(tradeSessionStreamProvider)` para detectar cuando el status cambia y reaccionar (ej: si el partner cancela).

#### `lib/features/trade/presentation/trade_delivery_screen.dart`

Pantalla de confirmación de recepción física.

**Parámetro:** `TradeSession session`

**Escenario:** Los usuarios se encuentran físicamente y entregan los cromos acordados. Esta pantalla permite marcar cuáles se recibieron realmente.

**UI:**
- Lista de cromos que el partner iba a enviar (las `trade_offers` del partner).
- Checkboxes para marcar cuáles realmente llegaron.
- Botón "Confirmar recepción" → `tradeActionsProvider.notifier.markOffersDelivered()`.
- Si el partner cancela (detectado vía stream) → muestra error y navega atrás.

#### `lib/features/trade/presentation/trade_history_screen.dart`

Lista de intercambios pasados (completados y cancelados). Ordenados por `updated_at` descendente. Muestra el partner, el status y la fecha.

---

## 13. Localización — `lib/l10n/`

La app soporta **18 idiomas**:

| Código | Idioma | Código | Idioma |
|---|---|---|---|
| `ar` | Árabe | `ko` | Coreano |
| `de` | Alemán | `nl` | Holandés |
| `en` | Inglés | `pl` | Polaco |
| `es` | Español | `pt` | Portugués |
| `fa` | Persa | `ru` | Ruso |
| `fr` | Francés | `tr` | Turco |
| `he` | Hebreo | `zh` | Chino |
| `hi` | Hindi | | |
| `it` | Italiano | | |
| `ja` | Japonés | | |

### `lib/l10n/app_en.arb`

Archivo ARB maestro (plantilla). Define todas las claves de localización. Las claves siguen la convención:
- `camelCase` descriptivo (ej: `authErrorInvalidCredentials`).
- Prefijo por dominio: `auth*`, `trade*`, `pending*`, `profile*`, `register*`, `sticker*`, `common*`, `nav*`, etc.
- Las claves con parámetros usan la sintaxis `{param}` de ICU.

### `lib/l10n/app_localizations.dart`

**Generado automáticamente** por `flutter gen-l10n`. Clase abstracta base.

### `lib/l10n/app_localizations_*.dart`

**Generados automáticamente.** Implementaciones concretas por idioma.

**Uso en el código:**
```dart
final l10n = AppLocalizations.of(context);
Text(l10n.appTitle)
```

---

## 14. Esquema de base de datos Supabase

Las tablas en Supabase son el origen de verdad (source of truth). Brick las espeja en SQLite.

### Tablas del catálogo (solo lectura para la app)

| Tabla | Descripción |
|---|---|
| `albums` | Álbumes disponibles (ej: Mundial 2026) |
| `album_variants` | Variantes geográficas por álbum |
| `album_variant_stickers` | Join: qué stickers pertenecen a cada variante |
| `categories` | Países/secciones del álbum |
| `stickers` | Cromos individuales |
| `sticker_variants` | Tipos de variante de cromo (normal, foil, etc.) |

### Tablas de usuario (lectura y escritura)

| Tabla | Descripción |
|---|---|
| `inventory` | Inventario de stickers por usuario |
| `user_variant_preferences` | Preferencia de variante geográfica por usuario/álbum |

### Tablas de trade (solo acceso directo sin Brick)

| Tabla | Descripción |
|---|---|
| `user_trade_codes` | Código de 6 dígitos por usuario |
| `trade_sessions` | Sesiones de intercambio |
| `trade_offers` | Stickers ofrecidos en cada sesión |

### Funciones RPC de Supabase

| Función | Descripción |
|---|---|
| `delete_own_account` | Elimina la cuenta del usuario autenticado (datos + auth) |

---

## 15. Flujos principales

### Flujo de primer uso (invitado)

```
main() → AppRepository.configure() → initializeAdMob() → MainApp
  → LoginScreen (si no hay sesión)
  → "Continuar como invitado" → enableGuestMode() → AppShell
  → HomeScreen → VariantSelectorSheet (obligatorio)
  → Seleccionar variante → Tutorial de HomeScreen
  → Usar la app con datos guardados en SQLite bajo __guest_local_user__
```

### Flujo de registro/login y migración de datos

```
LoginScreen → register() o login()
  → _iniciarSincronizacion()
    → hasGuestData()
    → si sí: remoteHasInventory()
      → si no tiene remoto: migrateGuestDataToUser() → GuestMergeResult.migrated
      → si tiene remoto: discardGuestDataAndUseRemote() → GuestMergeResult.usedExistingRemote
    → sincronizacionFisicaEspejo()
    → subscriptionProvider.loginUser()
    → startSyncQueue()
    → invalidate(inventoryProvider)
  → AppShell
```

### Flujo de escaneo OCR

```
ScannerScreen (cámara activa)
  → Frame capturado → TextRecognizer.processImage()
  → Regex extrae posibles códigos
  → Validar contra _validStickerIdsCache
  → _consensusMap[code]++ → si llega a _requiredConsensus (3)
  → pendingScansProvider.addSticker(stickerId)
  → Overlay visual + haptic feedback
  → Usuario abre PendingScansSheet
  → Confirmar → inventoryProvider.updateVariantQuantity() por cada sticker
  → RatingService.trackScanAndMaybePrompt()
```

### Flujo de trade digital

```
HomeScreen drawer → TradeHubScreen
  → myTradeCodeProvider (genera/obtiene código QR)
  → "Nuevo intercambio" → FindPartnerScreen
  → Ingresar código o escanear QR del partner
  → findUserByCode() → TradePartner encontrado
  → createSession() → TradeSession(status: pending_acceptance)
  → TradeNegotiationScreen
    → PARTNER: acepta → status: selecting
    → Ambos seleccionan stickers → trade_offers insertadas
    → Ambos confirman → status: reserved
    → _finalizeTrade():
      → Sumar stickers recibidos al inventario
      → Restar stickers enviados del inventario
    → Volver al inicio
```

### Flujo de sincronización offline

```
Sin conexión: AppRepository encola escrituras en brick_offline_queue.sqlite
Con conexión: startSyncQueue() → procesa cola
RefreshIndicator → syncServiceProvider.refreshAll()
  → sincronizarCatalogo() (protocolo espejo)
  → sincronizacionFisicaEspejo()
  → Invalidar todos los providers
```

---

## 16. Convenciones y reglas

### Reglas de datos

1. **Nunca borrar el inventario al cambiar de variante.** Solo se actualiza `UserVariantPreference.albumVariantId`.
2. **Los trades no usan la cola offline de Brick.** Todos los accesos a `trade_sessions`, `trade_offers` y `user_trade_codes` van directamente al cliente Supabase.
3. **Los RPC no se encolan.** El path `/rest/v1/rpc/` está excluido en `AppRepository.configure()`.
4. **El `userId` de invitado es `__guest_local_user__`.** Constante en `guest_session_provider.dart`.
5. **La sincronización espejo es explícita**, no automática. Se hace comparando conjuntos de IDs entre remoto y local.
6. **`_inventoryUpdated`** en `TradeNegotiationScreen` previene ajustes duplicados del inventario si el stream de estado dispara múltiples veces.

### Reglas de UI

1. **Fondo global:** `#121212`. AppBar y cards: `#1E1E1E`.
2. **Color de acento:** `Colors.amber` (dorado).
3. **Modo oscuro obligatorio.** No hay soporte para modo claro.
4. **Cámara diferida:** La cámara no se inicializa hasta que el tab está activo. Se coordina con `CameraCoordinator.shutdownFuture`.
5. **Tutoriales con `GlobalKey`:** Cada widget objetivo de un coachmark recibe su key de `tutorial_keys.dart`.
6. **`RefreshIndicator`** en todas las pantallas de catálogo e inventario. Llama a `syncServiceProvider.refreshAll()`.
7. **Swipe para navegar atrás** (compatible con iOS): implementado con `Listener` + `GestureDetector` en `CategoryDetailScreen` y `ProfileScreen`.

### Reglas de gestión de estado (Riverpod)

1. **Un solo `InventoryMap` global.** Todo el inventario vive en `inventoryProvider`. Ninguna otra capa tiene su propia copia.
2. **Optimistic updates** en `InventoryNotifier`: el estado se actualiza en memoria antes de persistir. Si la persistencia falla, se revierte.
3. **`autoDispose`** en providers de UI locales (`filterProvider`, `stickerSearchProvider`, `pendingScansProvider`, `pendingRemoveProvider`) para limpiar estado al salir de la pantalla.
4. **`ref.invalidate()`** para forzar recarga de datos tras sincronización o login.
5. **Los providers de catálogo son `FutureProvider`** (lectura única con caché de Riverpod). No son streams porque el catálogo raramente cambia.
6. **Los providers de trade son `StreamProvider`** (tiempo real) para `trade_sessions` y `trade_offers`.

### Generación de código

Los siguientes archivos son **generados automáticamente** por `build_runner` y **no deben editarse manualmente**:
- `lib/brick/brick.g.dart`
- `lib/brick/db/schema.g.dart`
- `lib/brick/adapters/*.adapter.g.dart`
- `lib/l10n/app_localizations*.dart`

Para regenerar después de modificar modelos o archivos ARB:
```bash
# Brick
dart run build_runner build --delete-conflicting-outputs

# Localización
flutter gen-l10n
```
