/*
  © All rights reserved.
  © By allforall - 2024
*/


import 'package:allforall/utils/data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../screens/products_by_category_page.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
    required this.categories
  });
  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: (categorias.length < 7) ? categorias.length : 7,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductsByCategoryPage(
                      category: categories[index],
                    ),
                  ),
                );
              },
              child: Container(
                width: 130,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            blurRadius: 2,
                            blurStyle: BlurStyle.normal,
                            offset: const Offset(0, 3),
                          )
                        ],
                      ),
                      child: Image.asset(
                        categorias[index][1],
                        width: 70,
                        height: 70,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      categorias[index][0],
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
