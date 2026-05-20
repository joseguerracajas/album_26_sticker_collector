Aquí tienes la propuesta para la nueva funcionalidad, siguiendo el formato y las reglas especificadas:

---

## 1. User Stories (Given/When/Then format)

### Historia de Usuario 1: Compartir estadísticas de colección

AS A coleccionista de stickers
I WANT TO compartir mis estadísticas de colección como una imagen atractiva
SO THAT puedo mostrar mi progreso a mis amigos y la comunidad.

**Given** Estoy en la pantalla de "Estadísticas" y tengo datos de colección (stickers poseídos, faltantes, repetidos) para la variante geográfica seleccionada.
**When** Toco el icono de compartir en la AppBar.
**Then** Se genera una imagen PNG de alta calidad con mis estadísticas actuales y se abre el menú nativo para compartir del dispositivo, incluyendo un mensaje de texto predefinido.

### Historia de Usuario 2: Estadísticas localizadas en la imagen

AS A coleccionista de stickers
I WANT TO compartir mis estadísticas en mi idioma preferido
SO THAT la imagen compartida sea comprensible para mi audiencia.

**Given** Tengo configurado un idioma específico en la aplicación (ej. español) y estoy en la pantalla de "Estadísticas".
**When** Toco el icono de compartir para generar la imagen de estadísticas.
**Then** La imagen generada y el mensaje de compartir utilizan el idioma configurado en la aplicación, incluyendo el formato de números y texto.

### Historia de Usuario 3: Compartir estadísticas offline

AS A coleccionista de stickers
I WANT TO compartir mis estadísticas incluso sin conexión a internet
SO THAT puedo mostrar mi progreso en cualquier momento.

**Given** Estoy en la pantalla de "Estadísticas" sin conexión a internet y tengo datos de colección locales.
**When** Toco el icono de compartir en la AppBar.
**Then** Se genera una imagen PNG con mis estadísticas locales y se abre el menú nativo para compartir del dispositivo.

---

## 2. Acceptance Criteria

*   El icono de compartir (color ámbar) debe estar presente en la AppBar de `lib/features/catalog/presentation/statistics_screen.dart`.
*   Al tocar el icono de compartir, se debe invocar la hoja de compartir nativa del dispositivo (`share_plus`).
*   El contenido compartido debe incluir:
    *   Una imagen PNG de alta calidad.
    *   Un mensaje de texto adjunto (localizado).
*   La imagen PNG generada debe:
    *   Mostrar el porcentaje de completitud general del usuario.
    *   Mostrar el recuento de stickers poseídos.
    *   Mostrar el recuento de stickers faltantes.
    *   Mostrar el recuento de stickers repetidos.
    *   Incluir el icono transparente de la aplicación (`assets/app_icon.png`).
    *   Adherirse estrictamente al diseño, marca y estándares de color de la aplicación (fondo oscuro, acentos ámbar, tipografía).
    *   Todo el texto dentro de la imagen debe estar localizado según la configuración de idioma actual de la aplicación.
    *   Reflejar las estadísticas para la variante geográfica actualmente seleccionada por el usuario.
*   La funcionalidad debe operar correctamente tanto para usuarios autenticados como para usuarios invitados, utilizando sus respectivos datos locales.
*   La funcionalidad debe trabajar sin conexión, utilizando datos almacenados en caché localmente a través de los providers de Riverpod existentes y los repositorios de Brick.
*   No se deben crear nuevas pantallas o archivos Flutter para esta funcionalidad; la implementación debe estar contenida dentro de `statistics_screen.dart` o, si es estrictamente necesario, en archivos de utilidad existentes que ya sean parte de la estructura del proyecto.
*   Se deben reutilizar los providers de Riverpod existentes para acceder a las estadísticas de la colección.

---

## 3. Data Model Impact

Dado que la descripción de la funcionalidad indica "UI only, no backend changes" y "reutilizar los providers de Riverpod existentes y los repositorios de Brick", no hay impacto en el modelo de datos.

*   **Nuevas tablas/columnas en Supabase:** Ninguna.
*   **Nuevos modelos Brick necesarios:** Ninguno.
*   **Relaciones con modelos existentes:** Ninguna.

La información necesaria para generar las estadísticas (stickers poseídos, faltantes, repetidos, porcentaje de completitud) ya se obtiene de los modelos `Sticker` y `Album` existentes a través de los providers de Riverpod que alimentan la `StatisticsScreen`.

---

## 4. UI Flow Description

*   **Pantallas necesarias:** No se requieren nuevas pantallas. La pantalla `StatisticsScreen` (`lib/features/catalog/presentation/statistics_screen.dart`) será modificada.

*   **Flujo de navegación:**
    1.  El usuario navega a la pantalla "Estadísticas" (por ejemplo, desde la barra de navegación principal).
    2.  En la pantalla "Estadísticas", el usuario visualiza el progreso de su colección (porcentaje de completitud, stickers poseídos, faltantes, repetidos).
    3.  El usuario toca el nuevo icono de compartir (ámbar) ubicado en la AppBar de esta pantalla.
    4.  La aplicación genera una representación visual (imagen PNG) de las estadísticas actuales.
    5.  La aplicación invoca el menú nativo para compartir del dispositivo, presentando la imagen generada y un mensaje de texto localizado.
    6.  El usuario selecciona una aplicación (ej. WhatsApp, Instagram, correo electrónico) para compartir el contenido.
    7.  El usuario completa la acción de compartir dentro de la aplicación elegida.

*   **Interacciones clave:**
    *   **Tocar
