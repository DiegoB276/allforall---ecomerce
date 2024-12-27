/*
  © All rights reserved.
  © By allforall - 2024
*/

//ARREGLAR EL COMPRAR PRODUCTOS, FALTA EL ID DEL PRODUCTO.

import 'package:allforall/user_view/services/api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BagShopPage extends StatefulWidget {
  const BagShopPage({super.key});

  @override
  State<BagShopPage> createState() => _BagShopPageState();
}

class _BagShopPageState extends State<BagShopPage> {
  int userId = 0;
  int totalPrice = 0;
  SharedPreferences? pref;

//Obtiene el id del usuario.
  void getUserById() async {
    pref = await SharedPreferences.getInstance();
    final id = await pref!.getInt("user_id")!;
    setState(() {
      userId = id;
    });
  }

  int calculateTotal(List<dynamic> listParam) {
    //fold(valor_inicial, (var_acumuladora, lista_a_recorrer))
    return listParam.fold(0,
        (value, item) => value + ((item['precio'] * item['cantidad']) as int));
  }

  void comprarProductos(List<dynamic> listParam) async {
    for (int i = 0; i < listParam.length; i++) {
      final data = {
        "idProd": listParam[i]['productoId'],
        "userId": userId,
        "amount": listParam[i]['cantidad'],
        "price": listParam[i]['precio'],
      };
      if (await APIService.addToMyBoughts(data) == 0) {
        print("PRODUCTO AGREGADO: $i");
      }
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Se ha realizado la compra!!",
        ),
      ),
    );
    deleteProductsAfterBuy(listParam);
    return;
  }

  void deleteProductsAfterBuy(List<dynamic> listParam) async {
    for (int i = 0; i < listParam.length; i++) {
      final data = {
        "productoId": listParam[i]['productoId'],
        "usuarioId": userId,
      };
      if (await APIService.deleteFromCart(data) == 0) {
        print("Producto Eliminado: $i");
      }
    }
  }

  void deleteProduct(int idProduct) async {
    final data = {
      "productoId": idProduct,
      "usuarioId": userId,
    };

    if (await APIService.deleteFromCart(data) == 0) {
      print("Producto Eliminado: $idProduct");
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const BagShopPage(),
      ),
    );
    return;
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
        title: Text("Mi Carrito"),
      ),
      body: FutureBuilder(
        future: APIService.getUserCar(userId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child:
                  LoadingAnimationWidget.inkDrop(color: Colors.black, size: 40),
            );
          }

          //Si no hay productos agregados ejecuta este bloque de código.
          if (snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                "No hay productos en el carrito",
                textAlign: TextAlign.center,
              ),
            );
          }

          //Si hay productos ejecuta este bloque de código.
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Slidable(
                  endActionPane: ActionPane(
                    motion: const StretchMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (p0) => deleteProduct(
                          snapshot.data![index]['productoId'],
                        ),
                        icon: Icons.delete,
                        backgroundColor:
                            const Color.fromARGB(255, 94, 141, 131),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ],
                  ),
                  child: Container(
                    height: 80,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data![index]['productoNombre'],
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                color: Colors.grey[800],
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 7),
                            Text(
                              "Cantidad: ${snapshot.data![index]['cantidad']}",
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                color: Colors.grey[700],
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "\$${NumberFormat.currency(locale: 'es_CO', symbol: '', decimalDigits: 0).format(snapshot.data![index]['precio'])}",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        height: 120,
        color: const Color(0xffD9D9D9),
        child: FutureBuilder(
          future: APIService.getUserCar(userId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: LoadingAnimationWidget.inkDrop(
                    color: Colors.black, size: 20),
              );
            }
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Productos:"),
                      Text("0"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Total:"),
                      Text(
                        "0",
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              );
            }
            totalPrice = calculateTotal(snapshot.data!);
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Productos:"),
                    Text("${snapshot.data!.length}"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Total:"),
                    Text(
                      "\$${NumberFormat.currency(locale: 'es_CO', symbol: 'COP', decimalDigits: 0).format(
                        totalPrice,
                      )}",
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                MaterialButton(
                  onPressed: () {
                    comprarProductos(snapshot.data!);
                  },
                  color: Colors.black,
                  textColor: Colors.white,
                  minWidth: MediaQuery.sizeOf(context).width * 0.9,
                  child: const Text("PROCEDER AL PAGO"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
