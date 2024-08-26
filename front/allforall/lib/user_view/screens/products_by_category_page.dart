/*
  © All rights reserved.
  © By allforall - 2024
*/

import 'package:allforall/user_view/screens/details_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../models/Product.dart';
import '../utils/data.dart';

class ProductsByCategoryPage extends StatelessWidget {
  const ProductsByCategoryPage({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredProducts =
        products.where((product) => product['category'] == category).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(category),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 300,
        ),
        itemCount: filteredProducts.length,
        itemBuilder: (BuildContext context, int index) {
          Product product = Product(
            name: filteredProducts[index]['name'],
            marketer: filteredProducts[index]['marketer'],
            price: filteredProducts[index]['price'],
            description: filteredProducts[index]['description'],
            bought: filteredProducts[index]['bought'],
            amount: filteredProducts[index]['amount'],
            category: filteredProducts[index]['category'],
            images: filteredProducts[index]['images'],
          );

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsProductPage(
                      product: product,
                    ),
                  ),
                );
              },
              child: Container(
                width: 170,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      blurRadius: 2,
                      blurStyle: BlurStyle.normal,
                      offset: const Offset(2, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(7),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Image.asset(
                          product.images[0],
                          width: 130,
                          height: 130,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "By ${product.marketer}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      product.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.robotoFlex(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      decoration: BoxDecoration(
                        color: const Color(0xffD9D9D9),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            blurRadius: 2,
                            blurStyle: BlurStyle.normal,
                            offset: const Offset(0.3, 1),
                          ),
                        ],
                      ),
                      child: Text(
                        "\$${NumberFormat.currency(locale: 'es_CO', symbol: '', decimalDigits: 0).format(
                          product.price,
                        )}",
                        style: GoogleFonts.arsenal(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
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
