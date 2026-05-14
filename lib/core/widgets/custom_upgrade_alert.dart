import 'package:flutter/material.dart';
import 'package:upgrader/upgrader.dart';

/// [UpgradeAlert] personalizado para que el botón "Actualizar" tenga
/// fondo amber y letra negra, y los demás sigan el textButtonTheme del tema.
class CustomUpgradeAlert extends UpgradeAlert {
  CustomUpgradeAlert({
    super.key,
    required super.upgrader,
    super.child,
    super.showIgnore = false,
    super.showLater = true,
  });

  @override
  UpgradeAlertState createState() => _CustomUpgradeAlertState();
}

class _CustomUpgradeAlertState extends UpgradeAlertState {
  @override
  Widget button({
    required bool cupertino,
    String? text,
    required BuildContext context,
    VoidCallback? onPressed,
    bool isDefaultAction = false,
  }) {
    if (!cupertino && isDefaultAction) {
      // Botón "Actualizar": fondo amber, letra negra
      return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amber,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(text ?? ''),
      );
    }
    // Botones "Ignorar" / "Después": TextButton con color del tema
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(foregroundColor: Colors.white60),
      child: Text(text ?? ''),
    );
  }
}
