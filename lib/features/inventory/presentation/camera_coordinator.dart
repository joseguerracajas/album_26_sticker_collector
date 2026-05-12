/// Coordina el acceso al hardware de cámara entre los tabs con cámara.
/// Evita que una pantalla inicialice la cámara mientras otra la está liberando.
class CameraCoordinator {
  CameraCoordinator._();

  /// Future del dispose en curso. Cualquier screen lo espera antes de inicializar.
  static Future<void>? shutdownFuture;
}
