/*
  © All rights reserved.
  © By allforall - 2024
*/

import 'package:admin_afa/pages/add_bussiness_page.dart';
import 'package:admin_afa/pages/bussiness_page.dart';
import 'package:admin_afa/pages/delete_bussiness_page.dart';
import 'package:admin_afa/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerContent extends StatelessWidget {
  const DrawerContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: DrawerHeader(
                    child: Image.asset(
                      "assets/icons/logo.png",
                      height: 120,
                      width: 120,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Button(
                  backgroundColor: const Color(0xff359768),
                  hoverColor: const Color(0xff376951),
                  label: "Mis Empresas",
                  textColor: Colors.white,
                  textSize: 17,
                  width: MediaQuery.sizeOf(context).width,
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (constext) => const BussinessPage(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 30),
                Button(
                  backgroundColor: const Color(0xff7977EA),
                  hoverColor: const Color(0xff41405B),
                  label: "Agregar Empresa",
                  textColor: Colors.white,
                  textSize: 17,
                  width: MediaQuery.sizeOf(context).width,
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (constext) => const AddBussinessPage(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 30),
                Button(
                  backgroundColor: const Color(0xffD14678),
                  hoverColor: const Color(0xff8F1F48),
                  label: "Eliminar Empresa",
                  textColor: Colors.white,
                  textSize: 17,
                  width: MediaQuery.sizeOf(context).width,
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (constext) => const DeleteBussinessPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
            Text(
              "© By All for All",
              style: GoogleFonts.chakraPetch(
                color: Colors.grey,
                fontSize: 15,
              ),
            )
          ],
        ),
      ),
    );
  }
}
