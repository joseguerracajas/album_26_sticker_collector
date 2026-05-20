Aquí tienes la especificación de la característica solicitada, siguiendo el formato y las reglas establecidas:

---

# 🔵 Agente: Product Manager

## Característica: Compartir Estadísticas de Colección

### 1. User Stories (Given/When/Then format)

**AS A** coleccionista de cromos
**I WANT TO** compartir mis estadísticas de colección como una imagen atractiva
**SO THAT** pueda mostrar mi progreso en redes sociales o pedir cromos a mis amigos.

*   **Given** que he avanzado en mi colección de cromos (tengo cromos, faltantes o repetidos)
*   **When** navego a la pantalla de "Estadísticas" y pulso el icono de compartir en la AppBar
*   **Then** se genera una imagen con mis estadísticas actuales (porcentaje completado, cromos poseídos/faltantes, repetidos) y se abre el menú nativo para compartir la imagen junto con un mensaje predefinido.

---

**AS A** coleccionista de cromos
**I WANT TO** compartir mis estadísticas en mi idioma preferido
**SO THAT** la información sea clara y comprensible para mi audiencia.

*   **Given** que mi aplicación está configurada en un idioma específico (ej. español)
*   **When** genero la imagen de estadísticas y el mensaje para compartir
*   **Then** todo el texto dentro de la imagen y el mensaje de compartir se muestra en español.

---

**AS A** coleccionista de cromos
**I WANT TO** poder compartir mis estadísticas incluso sin conexión a internet
**SO THAT** no dependo de la disponibilidad de red para mostrar mi progreso.

*   **Given** que no tengo conexión a internet y he visitado la pantalla de "Estadísticas" previamente
*   **When** navego a la pantalla de "Estadísticas" y pulso el icono de compartir en la AppBar
*   **Then** se genera una imagen con mis estadísticas locales actuales y se abre el menú nativo para compartir (si el sistema operativo lo permite sin conexión).

---

**AS A** usuario invitado
**I WANT TO** compartir mis estadísticas de colección
**SO THAT** puedo mostrar mi progreso antes de decidir registrarme.

*   **
