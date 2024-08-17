/*
  © All rights reserved.
  © By allforall - 2024
*/

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BussinesItem extends StatelessWidget {
  const BussinesItem({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: MaterialButton(
        onPressed: () {},
        color: Colors.grey.shade200,
        hoverColor: Colors.grey.shade300,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 15,
          ),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                maxRadius: 130,
                minRadius: 90,
                child: Image.asset(
                  "assets/bussiness_img.png",
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Ferretería García \n$index",
                textAlign: TextAlign.center,
                style: GoogleFonts.khula(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
