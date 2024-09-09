/*
  © All rights reserved.
  © By allforall - 2024
*/

import 'package:flutter/material.dart';
import '../widgets/item_cart_product.dart';

class CartShopPage extends StatelessWidget {
  const CartShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Mi Carrito"),
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return ItemCartProduct();
        },
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        height: 120,
        color: Color(0xffD9D9D9),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Productos:"),
                Text("9"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total:"),
                Text("\$4.800.000"),
              ],
            ),
            const SizedBox(height: 10),
            MaterialButton(
              onPressed: () {},
              color: Colors.black,
              textColor: Colors.white,
              minWidth: MediaQuery.sizeOf(context).width * 0.9,
              child: Text("PROCEDER AL PAGO"),
            )
          ],
        ),
      ),
    );
  }
}
