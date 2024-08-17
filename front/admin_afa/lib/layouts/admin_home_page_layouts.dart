/*
  © All rights reserved.
  © By allforall - 2024
*/

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/button.dart';

class AdminHomeMobilLayout extends StatelessWidget {
  const AdminHomeMobilLayout({
    super.key,
    required this.onPressButton,
  });

  final VoidCallback onPressButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Image.asset(
          "assets/admin_img.png",
          width: 350,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Panel \nAdministrativo",
                style: GoogleFonts.archivoBlack(
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff635696),
                  fontSize: 40,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "En esta sección podras llevar el control de todas las empresas. Administra tus empresas y expandete a lo grande.",
                style: GoogleFonts.ptSans(
                  color: const Color.fromARGB(255, 65, 65, 65),
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              Button(
                backgroundColor: const Color(0xff514FB0),
                hoverColor: const Color(0xff8280D7),
                label: "VER EMPRESAS",
                textColor: const Color(0xffE3E3E3),
                textSize: 20,
                width: MediaQuery.sizeOf(context).width * 0.5,
                onTap: onPressButton,
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class AdminHomeDesktopLayout extends StatelessWidget {
  const AdminHomeDesktopLayout({
    super.key,
    required this.width,
    required this.onPressButton,
  });

  final double width;
  final VoidCallback onPressButton;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 70),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Panel \nAdministrativo",
                    style: GoogleFonts.archivoBlack(
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff635696),
                      fontSize: 45,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "En esta sección podras llevar el control de todas las empresas. Administra tus empresas y expandete a lo grande.",
                    style: GoogleFonts.ptSans(
                      color: const Color.fromARGB(255, 65, 65, 65),
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Button(
                    backgroundColor: const Color(0xff514FB0),
                    hoverColor: const Color(0xff8280D7),
                    label: "VER EMPRESAS",
                    textColor: const Color(0xffE3E3E3),
                    textSize: 20,
                    width: width,
                    onTap: onPressButton,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Image.asset(
              "assets/admin_img.png",
              height: MediaQuery.sizeOf(context).height * 0.9,
            ),
          )
        ],
      ),
    );
  }
}
