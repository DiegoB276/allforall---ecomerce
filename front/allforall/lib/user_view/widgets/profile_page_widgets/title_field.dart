import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleField extends StatelessWidget {
  const TitleField({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: GoogleFonts.afacad(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
