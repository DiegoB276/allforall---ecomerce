import 'package:flutter/material.dart';

class TextFormEmail extends StatelessWidget {
  const TextFormEmail({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        String emailPattern =
            r'^(?=.{1,64}@.{1,255}$)(?=.{6,255}$)[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

        RegExp regExp = RegExp(emailPattern);
        return regExp.hasMatch(value ?? '')
            ? null
            : "Dirección de correo inválida";
      },
      decoration: InputDecoration(
        hintText: "ejemplo@ejemplo.com",
        label: const Text(
          "Correo Electrónico",
        ),
        labelStyle: TextStyle(color: Colors.grey[700]),
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
    required this.passwordController,
    required this.isHint,
    required this.onTap,
  });

  final TextEditingController passwordController;
  final bool isHint;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passwordController,
      obscureText: isHint,
      validator: (value) {
        return (value != null && value.length >= 8)
            ? null
            : "La contraseña debe ser de mínimo 8 caracteres.";
      },
      decoration: InputDecoration(
        hintText: "********",
        label: const Text(
          "Contraseña",
        ),
        suffixIcon: GestureDetector(
          onTap: onTap,
          child: isHint
              ? const Icon(Icons.remove_red_eye)
              : const Icon(Icons.password),
        ),
        labelStyle: TextStyle(color: Colors.grey[700]),
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
