/*
  © All rights reserved.
  © By allforall - 2024
*/

import 'package:allforall/user_view/widgets/item_product.dart';
import 'package:flutter/material.dart';
import '../models/Product.dart';
import '../../utils/data.dart';

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
            child: ItemProduct(product: product),
          );
        },
      ),
    );
  }
}
