import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoItemProfileBussines extends StatelessWidget {
  const InfoItemProfileBussines({super.key, required this.label,});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: Color(0xffEAEAEA),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: EdgeInsets.only(top: 10, left: 5),
      child: Text(
        label,
        style: GoogleFonts.afacad(
          fontSize: 18,
        ),
      ),
    );
  }
}