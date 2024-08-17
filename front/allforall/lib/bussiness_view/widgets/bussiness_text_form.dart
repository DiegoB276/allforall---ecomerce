import 'package:flutter/material.dart';

class BussinessTextForm extends StatelessWidget {
  const BussinessTextForm({
    super.key,
    required this.controller,
    required this.hintText,
    required this.textInputType,
    this.textCapitalization,
    this.maxLines,
  });

  final TextEditingController controller;
  final String hintText;
  final TextInputType textInputType;
  final int? maxLines;
  final TextCapitalization? textCapitalization;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        return (value != null && value.isNotEmpty)
            ? null
            : "Este campo es obligatorio";
      },
      keyboardType: textInputType,
      maxLines: (maxLines != null) ? maxLines! : 1,
      textCapitalization: (textCapitalization != null)
          ? textCapitalization!
          : TextCapitalization.sentences,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(7),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(7),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.purple),
          borderRadius: BorderRadius.circular(7),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.purple),
          borderRadius: BorderRadius.circular(7),
        ),
      ),
    );
  }
}
