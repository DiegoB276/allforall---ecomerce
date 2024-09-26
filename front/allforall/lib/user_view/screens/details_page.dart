/*
  © All rights reserved.
  © By allforall - 2024
*/

import 'package:allforall/user_view/models/Product.dart';
import 'package:allforall/user_view/services/api.dart';
import 'package:allforall/utils/price_formatter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailsProductPage extends StatefulWidget {
  const DetailsProductPage({super.key, required this.product});

  final Product product;

  @override
  State<DetailsProductPage> createState() => _DetailsProductPageState();
}

class _DetailsProductPageState extends State<DetailsProductPage> {
  int amountToBuy = 1;
  int userId = 0;
  SharedPreferences? pref;

  //Obtiene el id del usuario.
  void getUserById() async {
    pref = await SharedPreferences.getInstance();
    final id = await pref!.getInt("user_id")!;
    setState(() {
      userId = id;
    });
  }

//Agrega un producto al carro.
  void addToCart() async {
    Map data = {
      "usuarioId": userId,
      "productoId": widget.product.id,
      "cantidad": amountToBuy,
    };
    if (await APIService.addToCart(data) == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "El producto se agregó al carrito!!",
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    getUserById();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          "Tu Producto",
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 250,
                child: PageView.builder(
                  itemCount: widget.product.images.length,
                  itemBuilder: (context, index) {
                    return ClipRect(
                      child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.asset(
                            widget.product.images[index],
                            width: 200,
                            height: 200,
                          )),
                    );
                  },
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      "+ ${widget.product.bought} vendidos.",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[400],
                        letterSpacing: 0.2,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "By ${widget.product.marketer}",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[400],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      widget.product.name,
                      style: const TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.w700,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: Text(
                        widget.product.description,
                        textAlign: TextAlign.left,
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Precio Unit. ",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: PriceFormatter(
                            price: widget.product.price,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Unidades disponibles: ${widget.product.amount}",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Categoría",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Sección de ${widget.product.category}",
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.grey[400],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        height: 120,
        padding: const EdgeInsets.only(left: 5, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Amount selected
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  color: Colors.white,
                  minWidth: 20,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  onPressed: () {
                    setState(() {
                      amountToBuy > 1 ? amountToBuy-- : null;
                    });
                  },
                  child: const Icon(
                    Icons.arrow_left_sharp,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "$amountToBuy Unidades",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                MaterialButton(
                  color: Colors.white,
                  minWidth: 20,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  onPressed: () {
                    setState(() {
                      widget.product.amount > amountToBuy
                          ? amountToBuy++
                          : null;
                    });
                  },
                  child: const Icon(
                    Icons.arrow_right_sharp,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 50,
              width: 220,
              child: MaterialButton(
                onPressed: () {
                  addToCart();
                },
                color: Colors.white,
                padding: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_shopping_cart,
                      color: Colors.black,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Agregar al Carrito",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
