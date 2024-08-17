/*
  © All rights reserved.
  © By allforall - 2024
*/

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarWidget {
  static const Color appBarColor = Colors.white;

  static Widget appbarText(String label) {
    return Text(
      label,
      style: GoogleFonts.signikaNegative(
        color: const Color.fromARGB(255, 90, 90, 90),
        fontSize: 25,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  static Widget appBarActions() {
    return Padding(
      padding: const EdgeInsets.only(right: 20, top: 5),
      child: CircleAvatar(
        backgroundColor: Colors.purple[800],
        child: InkWell(
          onTap: () {},
          child: const Icon(
            Icons.person,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
