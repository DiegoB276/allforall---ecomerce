/*
  © All rights reserved.
  © By allforall - 2024
*/

import 'package:flutter/material.dart';

class LoginTextForm extends StatelessWidget {
  const LoginTextForm({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
  });

  final TextEditingController controller;
  final String labelText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        String emailPattern =
            r'^(?=.{1,64}@.{1,255}$)(?=.{6,255}$)[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

        RegExp regExp = RegExp(emailPattern);
        return regExp.hasMatch(value ?? '')
            ? null
            : "Dirección de correo inválida";
      },
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade600,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade800,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.purple,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.purple,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

class LoginTextFormPassword extends StatelessWidget {
  const LoginTextFormPassword({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.isHint,
    required this.setVisible,
  });

  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool isHint;
  final VoidCallback setVisible;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        return (value != null && value.length >= 8)
            ? null
            : "La contraseña debe ser de mínimo 8 caracteres.";
      },
      obscureText: isHint,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        suffixIcon: InkWell(
          onTap: setVisible,
          child: isHint
              ? const Icon(Icons.remove_red_eye)
              : const Icon(Icons.password),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade600,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade800,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.purple,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.purple,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
