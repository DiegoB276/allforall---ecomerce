import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.label,
    required this.backgroundColor,
    required this.hoverColor,
    required this.textColor,
    required this.textSize,
    required this.width,
    required this.onTap,
  });

  final String label;
  final Color backgroundColor;
  final Color hoverColor;
  final Color textColor;
  final double textSize;
  final double width;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      color: backgroundColor,
      textColor: textColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12),
      minWidth: width,
      child: Text(
        label,
        style: TextStyle(
          fontSize: textSize,
        ),
      ),
    );
  }
}
