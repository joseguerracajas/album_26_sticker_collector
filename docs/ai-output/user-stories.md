Aquí tienes la especificación detallada para la funcionalidad de compartir estadísticas, siguiendo el formato y las consideraciones del proyecto.

---

# 🔵 Agente: Product Manager - Especificación de Feature

## Feature: Compartir Estadísticas del Álbum

### 1. User Stories (Historias de Usuario)

**AS A** usuario (autenticado o invitado)
**I WANT TO** compartir mis estadísticas de progreso del álbum como una imagen atractiva
**SO THAT** puedo mostrar mi avance a mis amigos en redes sociales y generar entusiasmo.

**Given** estoy en la página de Estadísticas y mis datos de progreso del álbum están cargados.
**When** toco el icono de "Compartir" en la AppBar.
**Then** se genera una imagen PNG de alta calidad con mis estadísticas y se abre el menú nativo de compartir del dispositivo, permitiéndome elegir una aplicación para compartirla.

**Given** estoy en la página de Estadísticas, mis datos de progreso del álbum están cargados, y estoy sin conexión a internet.
**When** toco el icono de "Compartir" en la AppBar.
**Then** se genera una imagen PNG de alta calidad con mis estadísticas (basadas en los datos locales) y se abre el menú nativo de compartir del dispositivo, permitiéndome elegir una aplicación para compartirla.

**Given** estoy en la página de Estadísticas, mis datos de progreso del álbum están cargados, y el idioma de mi dispositivo es español.
**When** toco el icono de "Compartir" en la AppBar.
**Then** la imagen generada y el mensaje de compartir predeterminado muestran todo el texto en español.

### 2. Acceptance Criteria (Criterios de Aceptación)

*   El icono de compartir debe ser un `IconButton` de color `Amber` (dorado) con el icono `Icons.share` ubicado en la `AppBar` de la pantalla `lib/features/catalog/presentation/statistics_screen.dart`.
*   Al tocar el icono, se debe invocar el menú nativo de compartir del dispositivo (`share_plus`).
*   El menú de compartir debe incluir una imagen PNG de alta calidad que represente las estadísticas del usuario.
*   La imagen generada debe mostrar claramente:
    *   El porcentaje de completitud general del álbum.
    *   El número de stickers poseídos.
    *   El número de stickers faltantes.
    *   El número de stickers duplicados.
    *   El icono transparente de la aplicación (`assets/app_icon.png`).
*   El diseño de la imagen debe adherirse estrictamente a la marca, colores y tipografía oficiales de la aplicación.
*   Todo el texto dentro de la imagen generada y el mensaje de compartir que la acompaña deben estar completamente localizados utilizando `AppLocalizations` (ej. `AppLocalizations.of(context).statisticsCompletion`, `AppLocalizations.of(context).shareMessage`).
*   La funcionalidad debe operar correctamente en modo offline, utilizando los datos de estadísticas disponibles localmente a través de los `Riverpod providers` y `Brick repositories` existentes.
*   La funcionalidad debe estar disponible tanto para usuarios autenticados como para usuarios invitados, reflejando siempre su progreso actual.
*   Se deben reutilizar los `Riverpod providers` existentes para obtener los datos de las estadísticas (ej. `catalogStatisticsProvider`, `userStickersProvider`).
*   No se deben crear nuevas pantallas ni archivos `.dart` de nivel superior en la estructura de `lib/features/catalog/presentation/`. La lógica de generación de la imagen y el widget para renderizarla deben encapsularse dentro de `statistics_screen.dart` (ej. como un método privado o un widget local/privado).

### 3. Data Model Impact (Impacto en el Modelo de Datos)

*   **Supabase:** No se requieren nuevas tablas ni columnas en la base de datos de Supabase. La funcionalidad es puramente de presentación y reutiliza datos existentes.
*   **Brick Models:** No se requieren nuevos modelos Brick. La funcionalidad se basa en la lectura de datos de inventario y catálogo ya gestionados por modelos Brick existentes (ej. `Sticker`, `UserSticker`).

### 4. UI Flow Description (Descripción del Flujo de UI)

1.  **Pantalla de Estadísticas (`lib/features/catalog/presentation/statistics_screen.dart`):**
    *   Se modificará la `AppBar` existente para incluir un `IconButton` en el lado derecho.
    *   Este icono será `Icons.share` y tendrá un color `Colors.amber`.
    *   Al tocar este icono:
        *   La aplicación capturará los datos de estadísticas actuales (porcentaje de completitud, stickers poseídos, faltantes, duplicados) de los `Riverpod providers` relevantes (ej. `catalogStatisticsProvider`, `userStickersProvider`).
        *   Se utilizará un `RepaintBoundary` (o una técnica similar de conversión de widget a imagen) para renderizar un widget dedicado, fuera de la pantalla visible, que represente visualmente la tarjeta de estadísticas. Este widget estará diseñado siguiendo la marca de la aplicación, incluirá el icono de la app y mostrará las estadísticas localizadas.
        *   La imagen renderizada se convertirá a un array de bytes PNG.
        *   Se invocará el paquete `share_plus` para abrir el menú nativo de compartir del dispositivo.
        *   La imagen PNG y un mensaje de texto localizado (ej. "¡Mira mi progreso en Album 26 Sticker Collector! #Album26StickerCollector") se pasarán al menú de compartir.

2.  **Flujo de Navegación:**
    *   El usuario ya se encuentra en la `StatisticsScreen`.
    *   Al tocar el icono de compartir, no se navega a una nueva pantalla. En su lugar, se superpone el menú nativo de compartir del dispositivo.
    *   Después de compartir o cancelar, el usuario permanece en la `StatisticsScreen`.

3.  **Interacciones Clave:**
    *   Tocar el icono de compartir de color ámbar en la `AppBar`.
    *   Aparición del menú nativo de compartir.
    *   El usuario selecciona una aplicación para compartir o cancela la acción.

### 5. Edge Cases & Constraints (Casos Extremos y Restricciones)

*   **Comportamiento Offline:**
    *   La funcionalidad debe operar sin problemas cuando el dispositivo está offline. Los datos de las estadísticas se leerán de los repositorios locales de Brick a través de los `Riverpod providers`, que ya están diseñados para el acceso offline-first.
    *   La generación de la imagen y la invocación del menú nativo de compartir no requieren conexión a internet.
*   **Comportamiento de Usuario Invitado:**
    *   Los usuarios invitados tienen su propio inventario y estadísticas locales. La funcionalidad debe operar de manera idéntica para ellos, compartiendo su progreso local actual.
*   **Consideraciones de Variantes Geográficas:**
    *   Las estadísticas mostradas en la `StatisticsScreen` ya reflejan la variante geográfica seleccionada por el usuario. La imagen generada simplemente reflejará estas estadísticas ya filtradas y calculadas. No se necesita un manejo especial de variantes geográficas durante la generación de la imagen, ya que los datos subyacentes ya son específicos de la variante.
*   **Consideraciones de Rendimiento:**
    *   La generación de una imagen PNG de alta calidad a partir de un widget puede ser intensiva en CPU. El proceso debe manejarse de forma asíncrona para evitar bloquear el hilo de la UI. Para una tarjeta de estadísticas simple, se espera que sea lo suficientemente rápido como para no requerir un indicador de carga explícito, pero se debe monitorear el rendimiento.
    *   El tamaño de la imagen debe optimizarse para redes sociales (ej. una resolución razonable que se vea bien sin ser excesivamente grande en tamaño de archivo).
*   **Localización:** Todos los elementos de texto dentro de la imagen generada y el mensaje de compartir que la acompaña *deben* estar localizados utilizando `AppLocalizations`. Esto implica que el widget utilizado para la generación de la imagen necesitará acceso al `BuildContext` para resolver las cadenas localizadas.
*   **Restricción de Archivos:** La solicitud es explícita: "sin crear una nueva pantalla o archivo". Esto significa que la lógica de generación de la imagen y, potencialmente, el widget utilizado para renderizar la imagen, deben definirse *dentro* de `lib/features/catalog/presentation/statistics_screen.dart` (ej. como un método privado o una clase de widget local/privada dentro del `State` de la pantalla).
