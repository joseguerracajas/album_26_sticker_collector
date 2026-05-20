# Especificación de Requerimientos de Producto (PRD)
## Feature: Exportar y Compartir Estadísticas de la Colección (PNG)

---

## 1. Historias de Usuario

### Historia de Usuario 1: Exportar estadísticas visuales como imagen
```
COMO coleccionista de cromos (autenticado o invitado)
QUIERO exportar mis estadísticas de colección como una imagen PNG atractiva y de alta calidad
PARA PODER compartir mi progreso en mis redes sociales y motivar a otros usuarios a intercambiar conmigo.

GIVEN que estoy en la pantalla de Estadísticas ("statistics_screen.dart")
WHEN presiono el botón de compartir de color Ámbar en la AppBar
THEN la app genera silenciosamente una tarjeta visual (PNG) optimizada para redes sociales que incluye:
  - Mi porcentaje de completado actual.
  - El conteo de cromos que tengo, faltantes y repetidos.
  - La variante geográfica activa (ej. LATAM, Europa, USA).
  - El logo transparente de la app ("assets/app_icon.png").
  - Textos completamente localizados en mi idioma actual.
AND abre el menú nativo de compartir del dispositivo con la imagen adjunta y un texto promocional.
```

---

## 2. Criterios de Aceptación

### Criterio 1: Interfaz de Usuario y Disparador (Trigger)
- **Ubicación**: Se debe agregar un botón de acción en la `AppBar` de la pantalla existente `lib/features/catalog/presentation/statistics_screen.dart`.
- **Icono**: Debe utilizar `Icons.share` (o `Icons.ios_share` en iOS).
- **Color**: El icono debe ser estrictamente de color Ámbar (`Colors.amber` o el color de acento dorado del tema).
- **Reutilización**: No se debe crear una nueva pantalla para este flujo. El botón debe interactuar directamente con el estado actual de la pantalla de estadísticas.

### Criterio 2: Diseño y Composición de la Tarjeta PNG
La tarjeta generada debe renderizarse en memoria (o mediante un widget oculto en un `Stack` usando `RepaintBoundary`) con las siguientes especificaciones de diseño:
- **Dimensiones**: Optimizada para redes sociales (relación de aspecto 1:1 o 16:9 vertical, ej. 1080x1080 px).
- **Fondo**: Color oscuro sólido (`#121212`) o degradado sutil que combine con la identidad visual de la app.
- **Branding**: Debe incluir el logo de la app (`assets/app_icon.png`) en una esquina o como marca de agua estilizada.
- **Datos Dinámicos**:
  - Porcentaje de completado (representado con un indicador de progreso visual, como un arco o barra dorada).
  - Métrica "Tengo" (Owned).
  - Métrica "Faltan" (Missing).
  - Métrica "Repetidos" (Duplicates).
  - Nombre de la variante geográfica activa (ej. "Edición: LATAM").
- **Estilo**: Tipografías legibles, textos en blanco y acentos en color Ámbar.

### Criterio 3: Integración de Localización (i18n)
- Todos los textos estáticos dentro de la imagen generada (ej. "Completado", "Tengo", "Faltan", "Repetidos", "Edición") deben traducirse dinámicamente utilizando el sistema de localización de la app (`AppLocalizations`).
- El mensaje de texto que acompaña a la imagen en el menú de compartir también debe estar localizado.

### Criterio 4: Compartir Nativo
- Al procesar la imagen, se debe guardar temporalmente en el directorio de caché del dispositivo (`path_provider`).
- Se debe invocar el menú nativo de compartir utilizando el paquete `share_plus` (`Share.shareXFiles`).
- El mensaje de texto adjunto debe ser claro y amigable, por ejemplo: 
  *«¡Mira mi progreso en Album 26! Llevo el {porcentaje}% del álbum {variante}. ¡Vamos por el 100%! 🏆»*

---

## 3. Impacto en el Modelo de Datos

### Base de Datos (Supabase) & Sincronización (Brick)
- **Sin impacto en base de datos**: Esta funcionalidad es puramente de presentación y UI. No requiere nuevas tablas, columnas ni modificaciones en el esquema de Supabase o SQLite.
- **Lectura de Datos**: Se deben consumir los proveedores de estado de Riverpod ya existentes que calculan las estadísticas del inventario local (los cuales leen de la base de datos local SQLite sincronizada por Brick).

### Localización (Archivos ARB)
Se deben agregar las siguientes claves de traducción en todos los archivos `.arb` bajo `lib/l10n/` (ejemplo para `app_es.arb` y `app_en.arb`):

**`lib/l10n/app_es.arb`**
```json
"shareStatsTitle": "Mis Estadísticas - Album 26",
"shareStatsMessage": "¡Mira mi progreso en Album 26! Llevo el {percentage}% del álbum {variant}. ¡Vamos por el 100%! 🏆",
"@shareStatsMessage": {
  "placeholders": {
    "percentage": {},
    "variant": {}
  }
},
"shareStatsCompletion": "Completado",
"shareStatsOwned": "Tengo",
"shareStatsMissing": "Faltan",
"shareStatsDuplicates": "Repetidos",
"shareStatsVariant": "Edición: {variant}",
"@shareStatsVariant": {
  "placeholders": {
    "variant": {}
  }
}
```

**`lib/l10n/app_en.arb`**
```json
"shareStatsTitle": "My Stats - Album 26",
"shareStatsMessage": "Check out my progress on Album 26! I've completed {percentage}% of the {variant} album. Let's go for 100%! 🏆",
"@shareStatsMessage": {
  "placeholders": {
    "percentage": {},
    "variant": {}
  }
},
"shareStatsCompletion": "Completed",
"shareStatsOwned": "Owned",
"shareStatsMissing": "Missing",
"shareStatsDuplicates": "Duplicates",
"shareStatsVariant": "Edition: {variant}",
"@shareStatsVariant": {
  "placeholders": {
    "variant": {}
  }
}
```

---

## 4. Descripción del Flujo de UI

### Pantallas y Componentes
1. **Pantalla de Estadísticas (`statistics_screen.dart`)**:
   - Se añade el botón `IconButton` en la propiedad `actions` del `AppBar`.
   - Se envuelve el widget que representa la tarjeta de estadísticas (o un widget espejo diseñado específicamente para exportación) en un `RepaintBoundary` con una `GlobalKey` asignada.

### Flujo de Navegación e Interacción
1. El usuario abre la pantalla de Estadísticas desde el menú de navegación principal.
2. El usuario visualiza sus estadísticas actuales (calculadas localmente).
3. El usuario presiona el botón **Compartir (Ámbar)** en la esquina superior derecha.
4. **Feedback Visual**: Se muestra un `CircularProgressIndicator` modal o un estado de carga en el botón para indicar que la imagen se está procesando.
5. **Generación**:
   - La app captura el subárbol de widgets del `RepaintBoundary`.
   - Convierte los pixeles en un flujo de bytes (`Uint8List`).
   - Guarda el archivo temporalmente como `stats_share.png`.
6. **Disparo**: Se abre la hoja de compartir nativa del sistema operativo (iOS/Android
