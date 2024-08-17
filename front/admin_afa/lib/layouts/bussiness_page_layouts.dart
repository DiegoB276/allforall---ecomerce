/*
  © All rights reserved.
  © By allforall - 2024
*/

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/bussines_scroll_controller.dart';
import '../widgets/bussines_page/bussines_item.dart';
import '../widgets/button.dart';

class BussinessPageDesktopLayout extends StatelessWidget {
  const BussinessPageDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          Text(
            "Empresas Registradas",
            style: GoogleFonts.ptSans(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 410,
            child: ListView.builder(
              controller: BussinesScrollController.scrollController,
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return BussinesItem(index: index);
              },
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button(
                backgroundColor: Colors.black,
                label: "<- BACK",
                textColor: Colors.orange,
                hoverColor: Colors.grey.shade700,
                textSize: 60,
                width: MediaQuery.sizeOf(context).width * 0.2,
                onTap: () => BussinesScrollController.scrollLeft(),
              ),
              const SizedBox(width: 30),
              Button(
                backgroundColor: Colors.black,
                label: "NEXT ->",
                textColor: Colors.orange,
                hoverColor: Colors.grey.shade700,
                textSize: 40,
                width: MediaQuery.sizeOf(context).width * 0.2,
                onTap: () => BussinesScrollController.scrollRight(),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class BussinessPageMobileLayout extends StatelessWidget {
  const BussinessPageMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(
            "Empresas Registradas",
            style: GoogleFonts.ptSans(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              controller: BussinesScrollController.scrollController,
              itemCount: 10,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: BussinesItem(index: index),
                );
              },
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
