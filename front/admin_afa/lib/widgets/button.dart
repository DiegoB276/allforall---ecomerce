/*
  © All rights reserved.
  © By allforall - 2024
*/

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.backgroundColor,
    required this.label,
    required this.textColor,
    required this.hoverColor,
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
      minWidth: width,
      color: backgroundColor,
      hoverColor: hoverColor,
      textColor: textColor,
      elevation: 7,
      animationDuration: const Duration(milliseconds: 800),
      focusElevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
