/*
  © All rights reserved.
  © By allforall - 2024
*/

/*
Mejorar el diseño de las tarjetas del gridview.
 */

import 'package:allforall/user_view/services/api.dart';
import 'package:allforall/user_view/widgets/item_product.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../models/Product.dart';

class ProductsByCategoryPage extends StatefulWidget {
  const ProductsByCategoryPage({super.key, required this.category});

  final String category;

  @override
  State<ProductsByCategoryPage> createState() => _ProductsByCategoryPageState();
}

class _ProductsByCategoryPageState extends State<ProductsByCategoryPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.category),
      ),
      body: FutureBuilder(
        future: APIService.getProductsByCategory(widget.category),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child:
                  LoadingAnimationWidget.inkDrop(color: Colors.black, size: 40),
            );
          }
          if (!snapshot.hasData)
            return Center(
              child: Text("No hay productos en esta categoría", textAlign: TextAlign.center,),
            );
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 300,
            ),
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              Product product = Product(
                id: snapshot.data![index]['id'] ?? 0,
                codeProduct: snapshot.data![index]['codProducto'] ??
                    'Código no disponible',
                name: snapshot.data![index]['nombre'] ?? 'Sin nombre',
                marketer:
                    snapshot.data![index]['empresaNombre'] ?? 'Desconocido',
                price: snapshot.data![index]['precio'] ?? 0.0,
                description: snapshot.data![index]['descripcion'] ??
                    'Descripción no disponible',
                bought: snapshot.data![index]['prodVendidos'] ?? 0,
                amount: snapshot.data![index]['cantidad'] ?? 0,
                category:
                    snapshot.data![index]['categoriaNombre'] ?? 'Sin categoría',
                images: [
                  "assets/categories/electrodomestic.png",
                  "assets/categories/electrodomestic.png",
                  "assets/categories/electrodomestic.png",
                  "assets/categories/electrodomestic.png",
                  "assets/categories/electrodomestic.png",
                ],
              );
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ItemProduct(product: product),
              );
            },
          );
        },
      ),
    );
  }
}
