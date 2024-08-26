/*
  © All rights reserved.
  © By allforall - 2024
*/

import 'package:allforall/user_view/screens/categories_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContentDrawer extends StatelessWidget {
  const ContentDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          DrawerHeader(
            child: Image.asset(
              "assets/icons/logo.png",
              width: 200,
              height: 200,
              color: Colors.grey.shade400,
            ),
          ),
          const SizedBox(height: 40),
          GestureDetector(
            onTap: () {},
            child: ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: Text(
                "Mi Carrito",
                style: GoogleFonts.notoSansHanunoo(
                  color: Colors.grey.shade400,
                  fontSize: 23,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: ListTile(
              leading: const Icon(Icons.shopping_bag_rounded),
              title: Text(
                "Mis Compras",
                style: GoogleFonts.notoSansHanunoo(
                  color: Colors.grey.shade400,
                  fontSize: 23,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CategoriesPage(),
                ),
              );
            },
            child: ListTile(
              leading: const Icon(Icons.category),
              title: Text(
                "Categorías",
                style: GoogleFonts.notoSansHanunoo(
                  color: Colors.grey.shade400,
                  fontSize: 23,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
