import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class PriceFormatter extends StatelessWidget {
  const PriceFormatter({
    super.key,
    required this.price,
  });

  final int price;

  @override
  Widget build(BuildContext context) {
    return Text(
      "\$${NumberFormat.currency(locale: 'es_CO', symbol: '', decimalDigits: 0).format(
        price,
      )}",
      style: GoogleFonts.robotoMono(
        fontSize: 19,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
