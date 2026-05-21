Aquí tienes la propuesta para la característica "Exportar y Compartir Estadísticas" como Product Manager.

---

# 📝 Feature: Exportar y Compartir Estadísticas

## 1. User Stories (Given/When/Then format)

AS AN authenticated user
I WANT TO share my album progress as an image
SO THAT I can show my friends how much I've completed and encourage them to join.

Given I am on the "Estadísticas" screen
When I tap the "Compartir estadísticas" icon in the AppBar
Then a visual replica of my global progress card is generated as a PNG image, and the native share sheet appears with the image and a pre-filled message.

---

AS A guest user
I WANT TO share my album progress as an image
SO THAT I can show my friends how much I've completed, even if I haven't created an account yet.

Given I am on the "Estadísticas" screen as a guest
When I tap the "Compartir estadísticas" icon in the AppBar
Then a visual replica of my global progress card is generated as a PNG image, and the native share sheet appears with the image and a pre-filled message.

---

AS A user viewing the share sheet
I WANT TO select an app to share my statistics through
SO THAT I can easily distribute my progress to my chosen social media or messaging platforms.

Given the native share sheet is displayed with my album progress image and message
When I select a sharing application (e.g., WhatsApp, Instagram, Email)
Then my album progress image and message are shared via the selected application.

---

## 2. Acceptance Criteria

*   **[AC1]** Un icono de compartir de color ámbar (`Colors.amber`) se muestra en el `AppBar` de `StatisticsScreen`.
*   **[AC2]** Al tocar el icono de compartir, se invoca la función de generación de imagen y el menú nativo de compartir del dispositivo.
*   **[AC3]** La imagen PNG generada es una réplica visual pixel-perfect de la `_GlobalProgressCard` (la tarjeta de gradiente dorado) que se muestra en `StatisticsScreen`, incluyendo todos sus elementos (texto, iconos, barras de progreso, gradientes y el icono de la app).
*   **[AC4]** La generación de la imagen utiliza `Canvas` y `CustomPainter` para dibujar el diseño, los gradientes y la tipografía de forma idéntica al componente existente.
*   **[AC5]** El icono transparente de la aplicación (`assets/app_icon.png`) se incluye correctamente dentro de la imagen PNG generada.
*   **[AC6]** El menú nativo de compartir se invoca con la imagen PNG generada y un mensaje de texto localizado.
*   **[AC7]** El mensaje de texto utiliza la clave de localización `shareStatisticsMessage` y sustituye dinámicamente el porcentaje de progreso (`{percentage}%`) y el enlace de la aplicación (`{appLink}`).
*   **[AC8]** El nombre de la aplicación dentro del mensaje y la imagen generada se obtiene dinámicamente utilizando la clave `appTitle` de `AppLocalizations`.
*   **[AC9]** La lógica de compartir se integra directamente en el `StatisticsProvider` existente o en el proveedor que gestiona los datos de `StatisticsScreen`.
*   **[AC10]** Todos los 11 archivos ARB (`lib/l10n/app_*.arb`) se actualizan con las nuevas claves `shareStatisticsTooltip` y `shareStatisticsMessage` sin eliminar ni sobrescribir ningún contenido existente.

## 3. Data Model Impact

No hay impacto en el modelo de datos. Esta característica es puramente de presentación y no requiere nuevas tablas, columnas en Supabase ni nuevos modelos Brick. Reutilizará los datos de progreso del usuario ya existentes, gestionados por los proveedores y repositorios Brick actuales.

## 4. UI Flow Description

1.  **`StatisticsScreen` (Existente):**
    *   El usuario navega a la pantalla de Estadísticas.
    *   En el `AppBar` de esta pantalla, se añade un nuevo `IconButton` de color ámbar.
    *   El `tooltip` de este botón será "Compartir estadísticas" (obtenido de `AppLocalizations.of(context)!.shareStatisticsTooltip`).

2.  **Interacción de Compartir:**
    *   Cuando el usuario toca el `IconButton` de compartir:
        *   Se invoca una función dentro del `StatisticsProvider` (o un método del widget que interactúa con el provider).
        *   Esta función:
            1.  Obtiene los datos de progreso global del usuario del `StatisticsProvider` (que a su vez usa los repositorios Brick/Supabase).
            2.  Utiliza `RepaintBoundary` o una técnica similar para capturar el `_GlobalProgressCard` como una imagen, o más probablemente, un `CustomPainter` recreará la tarjeta en un `PictureRecorder` para generar un `ui.Image`.
            3.  El `CustomPainter` dibujará todos los elementos de la tarjeta: el gradiente de fondo, el texto del porcentaje, el texto del título del álbum (usando `appTitle`), el icono de la app (`assets/app_icon.png`), y cualquier otro elemento visual de la tarjeta.
            4.  Convierte el `ui.Image` a un formato PNG (`Uint8List`) y lo guarda temporalmente en el sistema de archivos del dispositivo.
            5.  Construye el mensaje de texto a compartir utilizando `AppLocalizations.of(context)!.shareStatisticsMessage(percentage: 'XX', appLink: 'URL_DE_LA_APP')`. El `appLink` deberá ser una URL predefinida a la tienda de aplicaciones.
            6.  Invoca el plugin `share_plus` (`Share.shareXFiles`) para mostrar el menú nativo de compartir, pasando la ruta del archivo PNG temporal y el mensaje de texto.

3.  **Menú Nativo de Compartir:**
    *   El sistema operativo muestra el menú de compartir con la imagen y el texto pre-rellenado.
    *   El usuario selecciona la aplicación deseada para compartir.

4.  **No hay pantallas nuevas** involucradas en este flujo. La interacción se limita a la `StatisticsScreen` existente y al menú de compartir del sistema.

## 5. Edge Cases & Constraints

*   **Offline Behavior:**
    *   La generación de la imagen de estadísticas y el mensaje se basarán en los datos de progreso del álbum que ya están disponibles localmente a través de Brick. Por lo tanto, la función de compartir debería ser completamente operativa incluso sin conexión a internet.
    *   El `appLink` en el mensaje de compartir (si es una URL de la tienda) podría no ser accesible si el receptor no tiene conexión, pero la acción de compartir en sí misma no depende de la red.

*   **Guest User Behavior:**
    *   Los usuarios invitados tienen su propio progreso de álbum almacenado localmente. La característica de compartir funcionará de la misma manera para ellos, utilizando sus estadísticas locales.
    *   El mensaje de compartir es genérico y no hace referencia a un usuario autenticado, por lo que es adecuado para invitados.

*   **Geographic Variant Considerations:**
    *   La `_GlobalProgressCard` ya muestra las estadísticas basadas en la variante geográfica seleccionada por el usuario. Al replicar esta tarjeta con `CustomPainter`, la imagen generada reflejará automáticamente la variante geográfica activa del usuario, manteniendo la coherencia.

*   **Performance Considerations:**
    *   La generación de la imagen con `Canvas` y `CustomPainter` debe ser eficiente para evitar bloqueos de la UI. Se recomienda realizar esta operación en un `Isolate` o asegurar que el dibujo sea rápido, especialmente para dispositivos de gama baja.
    *   El guardado temporal del archivo PNG y la invocación del `share_plus` son operaciones asíncronas que no deberían bloquear la UI.

*   **`appLink` Placeholder:**
    *   El placeholder `{appLink}` en el mensaje `shareStatisticsMessage` requiere una URL real de la aplicación en la tienda (App Store/Google Play). Esta URL debe ser una constante accesible globalmente o configurada en tiempo de ejecución. Se asume que esta URL será proporcionada por el sistema o una constante existente.

*   **App Icon Asset:**
    *   Asegurarse de que `assets/app_icon.png` esté correctamente cargado y escalado dentro del `CustomPainter` para que se vea bien en la imagen generada.

*   **Localization (ARB Files):**
    *   La actualización de los 11 archivos ARB debe ser precisa, añadiendo las nuevas claves `shareStatisticsTooltip` y `shareStatisticsMessage` al final de cada archivo sin modificar el contenido existente. Esto es crítico para evitar conflictos y pérdida de traducciones.
    *   El uso de `appTitle` para el nombre de la app en la imagen y el mensaje asegura que la localización sea correcta en todos los idiomas soportados.
