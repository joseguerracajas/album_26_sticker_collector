Aquí tienes el análisis de la característica "Exportar y Compartir Estadísticas" como Product Manager:

---

# 🔵 Agente: Product Manager

## Feature: Exportar y Compartir Estadísticas (Réplica de Canvas)

### 1. User Stories (Given/When/Then format)

**AS A** coleccionista
**I WANT TO** compartir una imagen de mi progreso global del álbum
**SO THAT** pueda mostrar a mis amigos y en redes sociales cuánto he avanzado en mi colección.

*   **Given** estoy en la pantalla de Estadísticas y veo mi tarjeta de progreso global.
*   **When** toco el icono de "Compartir" en la AppBar.
*   **Then** se genera una imagen PNG idéntica a mi tarjeta de progreso global y se abre el menú nativo para compartir, incluyendo un mensaje predefinido con mi porcentaje de progreso y un enlace a la app.

---

**AS A** coleccionista invitado
**I WANT TO** compartir mi progreso global del álbum
**SO THAT** pueda mostrar a mis amigos cuánto he avanzado, incluso sin tener una cuenta registrada.

*   **Given** estoy usando la aplicación como invitado y estoy en la pantalla de Estadísticas.
*   **When** toco el icono de "Compartir" en la AppBar.
*   **Then** se genera la imagen de progreso y se abre el menú nativo para compartir, funcionando igual que para un usuario autenticado.

---

**AS A** coleccionista
**I WANT TO** compartir mi progreso global del álbum incluso si no tengo conexión a internet
**SO THAT** pueda mostrar mi avance en cualquier momento.

*   **Given** estoy en la pantalla de Estadísticas sin conexión a internet.
*   **When** toco el icono de "Compartir" en la AppBar.
*   **Then** se genera la imagen de progreso utilizando los datos locales y se abre el menú nativo para compartir.

---

### 2. Acceptance Criteria

*   [ ] El icono de "Compartir" (color ámbar) está visible en la AppBar de `StatisticsScreen`.
*   [ ] Al tocar el icono de "Compartir", se invoca la funcionalidad de compartir nativa del dispositivo.
*   [ ] La imagen generada es un PNG que replica visualmente de forma pixel-perfecta la `_GlobalProgressCard` de `StatisticsScreen`, incluyendo:
    *   El diseño, gradientes y tipografía exactos.
    *   El porcentaje de progreso del usuario.
    *   El icono transparente de la app (`assets/app_icon.png`).
    *   El título de la app (`appTitle` de ARB).
*   [ ] El mensaje predefinido para compartir se localiza dinámicamente usando las claves ARB `shareStatisticsMessage` y `appTitle`.
*   [ ] El mensaje incluye el porcentaje de progreso del usuario y un enlace a la app (placeholder `{appLink}`).
*   [ ] La lógica de compartir se integra en el `StatisticsProvider` existente o en el proveedor que gestiona los datos de `StatisticsScreen`.
*   [ ] La funcionalidad de compartir está disponible tanto para usuarios autenticados como para usuarios invitados.
*   [ ] La funcionalidad de compartir utiliza los datos de progreso disponibles localmente, permitiendo su uso offline.
*   [ ] Todos los 11 archivos ARB (`lib/l10n/app_*.arb`) se actualizan con las nuevas claves `shareStatisticsTooltip` y `shareStatisticsMessage` sin eliminar ni sobrescribir contenido existente.

---

### 3. Data Model Impact

*   **New tables/columns needed in Supabase:** Ninguna. La información necesaria (progreso del usuario, título de la app) ya está disponible o se deriva de datos existentes.
*   **New Brick models needed:** Ninguno. La funcionalidad es puramente de presentación y no requiere persistencia de nuevos datos.
*   **Relationships with existing models:** Ninguna. Se reutilizan los datos de progreso del inventario existente (`Sticker`, `InventoryRepository`) que ya están sincronizados por Brick.

---

### 4. UI Flow Description

*   **Screens needed:** No se requieren nuevas pantallas. La funcionalidad se integra directamente en la `StatisticsScreen` existente.

*   **Navigation flow:**
    1.  El usuario navega a la `StatisticsScreen` (pantalla de Estadísticas).
    2.  En la `AppBar` de la `StatisticsScreen`, se añade un nuevo icono de "Compartir" de color ámbar.
    3.  Al tocar este icono, se desencadena la generación de la imagen y la invocación del menú nativo de compartir del dispositivo.
    4.  El usuario selecciona la aplicación deseada para compartir (ej. WhatsApp, Instagram, correo electrónico).

*   **Key interactions:**
    1.  **Tap en el icono de "Compartir":**
        *   El `StatisticsProvider` (o un método auxiliar dentro de él) inicia el proceso de generación de la imagen PNG.
        *   Se utiliza `CustomPainter` y `Canvas` para dibujar una réplica exacta de la `_GlobalProgressCard`, incluyendo el porcentaje de progreso del usuario, el título de la app (obtenido de `AppLocalizations.of(context)!.appTitle`) y el icono de la app (`assets/app_icon.png`).
        *   Se recupera el porcentaje de progreso actual del usuario del `StatisticsProvider`.
        *   Se construye el mensaje de texto para compartir utilizando la clave ARB `shareStatisticsMessage` y sustituyendo dinámicamente el porcentaje de progreso y el `{appLink}`.
        *   Se invoca la librería `share_plus` con la imagen PNG generada (guardada temporalmente) y el mensaje de texto.

---

### 5. Edge Cases & Constraints

*   **Offline behavior:**
    *   La `StatisticsScreen` ya muestra datos del repositorio local de Brick. La generación de la imagen y la composición del mensaje utilizarán estos datos disponibles localmente.
    *   El menú nativo para compartir se abrirá, pero el envío efectivo del mensaje/imagen dependerá de la conexión a internet de la aplicación de destino (ej. WhatsApp requiere internet para enviar). La app no bloqueará la acción de compartir por falta de conexión.

*   **Guest user behavior:**
    *   Los usuarios invitados almacenan su progreso localmente. El `StatisticsProvider` proporcionará los datos de progreso del usuario invitado, y la funcionalidad de compartir operará de manera idéntica a la de un usuario autenticado, utilizando sus datos locales.

*   **Geographic variant considerations:**
    *   La tarjeta de progreso global ya refleja la variante geográfica seleccionada por el usuario (LATAM, Europa, USA, etc.), ya que los datos de `StatisticsScreen` se filtran en consecuencia. La imagen generada mostrará el progreso para la variante *actualmente seleccionada*. No se requieren cambios específicos para esta característica en relación con las variantes.

*   **Performance considerations:**
    *   **Generación de imagen:** El uso de `CustomPainter` y `Canvas` para una réplica pixel-perfecta puede ser intensivo en CPU. Es crucial que la generación se realice de manera eficiente y, si se detectan cuellos de botella, considerar ejecutarla en un `Isolate` o hilo secundario, aunque para una sola tarjeta, el rendimiento suele ser aceptable en el hilo principal.
    *   **I/O de archivos:** Guardar la imagen en un archivo temporal para compartir debe manejarse de forma asíncrona para evitar bloqueos en la UI.
    *   **Integración del Provider:** La integración en `StatisticsProvider` debe asegurar que la lógica de generación de imagen no bloquee las actualizaciones de la UI.

*   **Otras restricciones:**
    *   **Política ARB (Estricta):** Es fundamental que las nuevas claves ARB (`shareStatisticsTooltip`, `shareStatisticsMessage`) se *añadan* a los 11 archivos ARB existentes sin modificar ni eliminar ningún contenido previo.
    *   **No New Files:** Toda la lógica debe integrarse en archivos existentes (`StatisticsScreen`, `StatisticsProvider`, archivos ARB).
    *   **Enlace de la App:** El placeholder `{appLink}` en `shareStatisticsMessage` deberá ser reemplazado por un enlace real a la tienda de aplicaciones (App Store/Google Play). Este enlace debería ser una constante o recuperarse de una configuración global.
    *   **Uso de `appTitle`:** El título de la aplicación debe obtenerse dinámic
