import 'package:flutter/material.dart';

class CenterButton extends StatelessWidget {
  final String text;
  final double fontSize;
  final VoidCallback onPressed;
  final IconData? icon; // Añadido para admitir un icono opcional

  const CenterButton({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.onPressed,
    this.icon, // Permite el paso opcional de un icono
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white, // Color del texto
          elevation: 2,
          shadowColor: Colors.grey.withOpacity(0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Centra el contenido horizontalmente
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                color: Colors.red, // Ajusta el color del icono según el diseño
                size: 24, // Tamaño del icono
              ),
              SizedBox(width: 12), // Espaciado entre el icono y el texto
            ],
            Text(
              text,
              style: TextStyle(
                fontSize: fontSize,
                color: Colors.black, // Ajusta según el diseño
                fontWeight: FontWeight.w700, // Un peso ligeramente más grueso
              ),
            ),
          ],
        ),
      ),
    );
  }
}
