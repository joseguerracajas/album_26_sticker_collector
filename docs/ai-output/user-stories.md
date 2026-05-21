Aquí tienes el análisis detallado de la solicitud de característica, siguiendo el formato y las reglas establecidas:

---

## 1. User Stories (Given/When/Then format)

**Historia de Usuario: Compartir Progreso del Álbum**

AS A coleccionista de stickers
I WANT TO compartir mi progreso general del álbum
SO THAT puedo mostrar mis logros a mis amigos y animarlos a unirse a la colección.

**Escenario 1: Compartir progreso con la tarjeta visual**
Given que estoy en la pantalla de "Estadísticas" y he avanzado en mi colección (o no)
When toco el icono de "Compartir estadísticas" en la AppBar
Then se genera una imagen PNG que es una réplica visual de mi tarjeta de progreso global y se abre el menú nativo para compartirla, junto con un mensaje predefinido que incluye mi porcentaje de progreso y un enlace a la app.

---

## 2. Acceptance Criteria

Los criterios de aceptación se basan en los requisitos proporcionados en la descripción de la característica:

*   **[ ] Interacción del icono:** El icono de compartir de color ámbar en la AppBar de `StatisticsScreen` debe activar la generación de la imagen PNG y el flujo de compartir.
*   **[ ] Fidelidad visual:** La imagen PNG generada debe ser una réplica visual idéntica de la tarjeta de progreso global (el componente `_GlobalProgressCard` con degradado dorado) que se muestra actualmente en la `StatisticsScreen`. Esto incluye el diseño, los degradados, la tipografía y los elementos gráficos.
*   **[ ] Renderizado con Canvas:** La imagen debe ser renderizada utilizando `Canvas` y `CustomPainter` para dibujar el texto, los iconos, la barra de progreso y el icono de la app (`assets/app_icon.png`), coincidiendo con el estilo actual de la aplicación.
*   **[ ] Integración del menú nativo:** El menú nativo para compartir del dispositivo debe invocarse, presentando la imagen PNG generada y un mensaje localizado predefinido.
*   **[ ] Mensaje localizado:** El mensaje a compartir debe utilizar la clave `shareStatisticsMessage` de los archivos ARB, incluyendo dinámicamente el porcentaje de progreso del usuario y el título de la aplicación (`appTitle`).
*   **[ ] Actualización de ARB:** Todos los 11 archivos ARB (`lib/l10n/app_*.arb`) deben ser actualizados con las nuevas claves `"shareStatisticsTooltip"` y `"shareStatisticsMessage"` sin eliminar ni sobrescribir ningún contenido existente.

---

## 3. Data Model Impact

Dado que la solicitud especifica "UI only, no backend changes" y "No New Files", no hay impacto en el modelo de datos:

*   **Nuevas tablas/columnas en Supabase:** No se requieren.
*   **Nuevos modelos Brick:** No se requieren. La información para la tarjeta de progreso (porcentaje de completado, etc.) ya se obtiene de los modelos `Sticker` y `Inventory` existentes, gestionados por Brick y sincronizados con Supabase.
*   **Relaciones con modelos existentes:** No se crean nuevas relaciones. La lógica de negocio existente en `StatisticsProvider` ya consulta los datos necesarios para calcular el progreso.

---

## 4. UI Flow Description

**Pantallas Necesarias:**
1.  **`StatisticsScreen`** (`lib/features/catalog/presentation/statistics_screen.dart`): Esta es la pantalla principal afectada.

**Flujo de Navegación:**
1.  El usuario navega a la `StatisticsScreen` (accesible desde la navegación principal de la aplicación).
2.  En la AppBar de la `StatisticsScreen`, se añade un nuevo icono de "Compartir" (color ámbar).
3.  El usuario toca este icono de "Compartir".
4.  La aplicación genera internamente una imagen PNG de la `_GlobalProgressCard` visible en la pantalla.
5.  La aplicación invoca el menú nativo de compartir del dispositivo (`share_plus` package), pasando la imagen PNG generada y el mensaje de texto predefinido y localizado.
6.  El usuario selecciona una aplicación de destino (ej. WhatsApp, Telegram, correo electrónico) para compartir.

**Interacciones Clave:**
*   **Tap en el icono de compartir:** Desencadena la lógica de generación de imagen y la invocación del menú nativo.
*   **Generación de imagen:** Proceso interno que utiliza `RepaintBoundary` (o similar) para capturar el widget o `CustomPainter` para dibujar la tarjeta de progreso en un `ui.Image` y luego convertirlo a PNG.
*   **Menú nativo de compartir:** Interfaz estándar del sistema operativo para seleccionar una aplicación para compartir el contenido.

---

## 5. Edge Cases & Constraints

*   **Comportamiento Offline:**
    *   La generación de la imagen y el mensaje se basan en los datos de progreso del álbum almacenados localmente (gestionados por Brick). Por lo tanto, la funcionalidad de compartir estadísticas debe funcionar completamente offline.
    *   El menú nativo de compartir se abrirá, pero la capacidad de compartir a ciertas aplicaciones (ej. redes sociales, mensajería) dependerá de la conectividad de red del dispositivo para enviar el contenido. La app no necesita estar online para *generar* la imagen o *invocar* el menú.
*   **Comportamiento de Usuario Invitado:**
    *   Los usuarios invitados tienen su progreso almacenado localmente. La funcionalidad de compartir debe estar disponible para ellos de la misma manera que para los usuarios autenticados, reflejando su progreso actual.
*   **Consideraciones de Variantes Geográficas:**
    *   La `_GlobalProgressCard` ya muestra el progreso basado en la variante geográfica seleccionada por el usuario. La imagen generada debe replicar exactamente esta tarjeta, por lo que automáticamente reflejará la variante geográfica activa. No se requiere lógica adicional para manejar variantes geográficas en el proceso de compartir.
*   **Consideraciones de Rendimiento:**
    *   La generación de la imagen PNG desde `Canvas` debe ser eficiente para evitar bloqueos en la UI. Para una sola tarjeta de progreso, el rendimiento debería ser aceptable. Si la generación fuera más compleja, se podría considerar ejecutarla en un `Isolate` para no bloquear el hilo principal.
    *   El tamaño del archivo PNG debe ser optimizado para un compartir rápido, sin comprometer la calidad visual "pixel-perfect".
*   **Ausencia de Progreso:**
    *   Si un usuario no ha registrado ningún sticker (0% de progreso), la tarjeta de progreso mostrará 0%. La imagen generada y el mensaje (`He completado el 0% de mi álbum`) deben reflejar correctamente este estado.
*   **Disponibilidad del Enlace de la App:**
    *   El placeholder `{appLink}` en `shareStatisticsMessage` debe ser reemplazado por un enlace válido a la tienda de aplicaciones (Google Play Store / Apple App Store). Se asumirá que existe una constante o un método utilitario en `lib/core/constants/` o `lib/core/utils/` para obtener este enlace dinámicamente o un enlace universal.
*   **Restricción de Archivos Nuevos:**
    *   La implementación debe adherirse estrictamente a la regla de no crear nuevos archivos de constantes o pantallas, integrando la lógica en `StatisticsProvider` y `StatisticsScreen` según lo solicitado.
