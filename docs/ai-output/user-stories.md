Aquí tienes la especificación detallada para la funcionalidad de compartir estadísticas, siguiendo el formato y las convenciones del proyecto:

---

# 🔵 Agente: Product Manager - Feature Request

## Exportar y Compartir Estadísticas del Álbum

### 1. User Stories (Historias de Usuario)

**AS A** coleccionista de stickers
**I WANT TO** compartir mis estadísticas de colección como una imagen atractiva
**SO THAT** puedo mostrar mi progreso en redes sociales o a mis amigos.

**Given** que estoy en la pantalla de Estadísticas y tengo datos de mi colección (autenticado o invitado).
**When** toco el ícono de compartir en la AppBar.
**Then** se genera una imagen con mis estadísticas (porcentaje de completado, stickers poseídos, faltantes, repetidos) y el ícono de la app, y se abre el menú nativo de compartir del dispositivo con la imagen adjunta y un mensaje predefinido.

---

**AS A** coleccionista de stickers
**I WANT TO** compartir mis estadísticas en mi idioma preferido
**SO THAT** el mensaje y la imagen generada sean comprensibles para mí y mi audiencia.

**Given** que tengo la aplicación configurada en un idioma específico (ej. español).
**When** genero y comparto la imagen de mis estadísticas.
**Then** todo el texto dentro de la imagen generada y el mensaje de compartir se muestran en español.

---

### 2. Acceptance Criteria (Criterios de Aceptación)

*   **AC1: Icono de Compartir:** Un `IconButton` con un ícono de compartir (ej. `Icons.share`) de color `amber` debe estar visible en la `AppBar` de la pantalla de Estadísticas (`lib/features/catalog/presentation/statistics_screen.dart`).
*   **AC2: Generación de Imagen:** Al tocar el ícono, la aplicación debe generar una imagen PNG de alta calidad con las estadísticas del usuario.
    *   La imagen debe incluir:
        *   El porcentaje de completado del álbum.
        *   El número de stickers poseídos.
        *   El número de stickers faltantes.
        *   El número de stickers repetidos.
        *   El ícono transparente de la aplicación (`assets/app_icon.png`).
    *   El diseño de la imagen debe adherirse estrictamente a la marca, colores y diseño oficial de la app (fondo oscuro `#121212`, acentos `Colors.amber`, tipografía consistente).
    *   Todo el texto dentro de la imagen debe estar localizado según el idioma actual del usuario.
*   **AC3: Menú Nativo de Compartir:** Tras la generación exitosa de la imagen, se debe invocar el menú nativo de compartir del dispositivo (`share_plus`) con la imagen PNG adjunta.
*   **AC4: Mensaje de Compartir:** El menú nativo de compartir debe incluir un mensaje de texto predefinido que acompañe a la imagen, el cual debe estar localizado (ej. "¡Mira mi progreso en Album 26 Sticker Collector!").
*   **AC5: Reutilización de Componentes:** La lógica para obtener las estadísticas (porcentaje, poseídos, faltantes, repetidos) debe reutilizar los `Riverpod providers` y `Brick repositories` existentes que ya se usan para mostrar las estadísticas en la pantalla `StatisticsScreen`.
*   **AC6: Soporte Offline:** La funcionalidad de compartir debe operar completamente offline, utilizando los datos de la colección almacenados localmente a través de Brick.
*   **AC7: Usuarios Invitados:** Los usuarios invitados deben poder usar esta funcionalidad sin restricciones, compartiendo sus estadísticas locales.
*   **AC8: No se crean nuevas pantallas:** La funcionalidad se implementa modificando `lib/features/catalog/presentation/statistics_screen.dart` sin crear nuevas pantallas o archivos de pantalla dedicados.
*   **AC9: Rendimiento:** La generación de la imagen debe ser rápida y no causar bloqueos significativos en la UI.
*   **AC10: Manejo de Errores:** En caso de un fallo en la generación de la imagen o al invocar el menú de compartir, se debe mostrar un `SnackBar` con un mensaje de error localizado (ej. `commonErrorWithMessage`).

---

### 3. Data Model Impact (Impacto en el Modelo de Datos)

Según la descripción de la característica y las áreas afectadas, esta funcionalidad es puramente de UI y no requiere cambios en el modelo de datos.

*   **Nuevas tablas/columnas en Supabase**: Ninguna.
*   **Nuevos modelos Brick**: Ninguno.
*   **Relaciones con modelos existentes**: Ninguna nueva relación. La funcionalidad *leerá* datos existentes de los modelos `Album` y `Sticker` (a través de `Inventory` y `Catalog`) para construir las estadísticas, utilizando los mismos `Brick repositories` y `Riverpod providers` que ya alimentan la pantalla de estadísticas.

---

### 4. UI Flow Description (Descripción del Flujo de UI)

**Pantallas Necesarias:**
*   No se necesitan nuevas pantallas. La funcionalidad se integra en la pantalla existente `StatisticsScreen` (`lib/features/catalog/presentation/statistics_screen.dart`).

**Flujo de Navegación:**
1.  **Acceso a Estadísticas:** El usuario navega a la pantalla de "Estadísticas" desde el menú principal o cualquier otra parte de la aplicación.
2.  **Visualización del Botón de Compartir:** En la `AppBar` de la `StatisticsScreen`, el usuario verá un nuevo `IconButton` con un ícono de compartir (ej. `Icons.share`) de color `amber`.
3.  **Interacción de Compartir:**
    *   El usuario toca el `IconButton` de compartir
