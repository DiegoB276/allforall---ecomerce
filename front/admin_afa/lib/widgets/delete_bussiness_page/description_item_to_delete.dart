import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DescriptionItomToDelete extends StatelessWidget {
  const DescriptionItomToDelete({
    super.key,
    required this.title,
    required this.data,
    required this.titleSize,
    required this.dataSize,
  });

  final String title;
  final String data;
  final double titleSize;
  final double dataSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.lexend(
              fontSize: titleSize,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            data,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.lexend(
              fontSize: dataSize,
            ),
          ),
        ],
      ),
    );
  }
}
