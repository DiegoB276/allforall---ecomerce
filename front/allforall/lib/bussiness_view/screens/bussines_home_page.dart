import 'package:allforall/bussiness_view/widgets/bussiness_drawer.dart';
import 'package:allforall/bussiness_view/widgets/product_item.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class BussinesHomePage extends StatelessWidget {
  const BussinesHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: const Text("domingo, agosto 4"),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              child: Icon(Icons.person),
            ),
          )
        ],
      ),
      drawer: const Drawer(
        child: BussinessDrawer(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              const Text(
                "Top Ventas",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return ProductItem(
                      name: "Producto ${index + 1} de prueba para empresa",
                      marketer: "Telas Colombia",
                      price: 250000,
                      description:
                          "kufgbdlskdufghblsdkufhb iudsfhb ilu udf uf gidfh  lfd  u fihng  iufvnhbdf",
                      bought: 30,
                      category: "Hogar",
                      images: const [
                        "assets/img/almohadas.png",
                        "assets/img/almohadas.png",
                        "assets/img/almohadas.png",
                        "assets/img/almohadas.png",
                      ],
                      onPress: () {},
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 270,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  color: const Color(0xff313131),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Cantidad de Productos Vendidos",
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "354",
                      style: GoogleFonts.concertOne(
                        fontSize: 70,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xffFFFFFF),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Productos",
                      style: GoogleFonts.roboto(
                        color: const Color(0xffFFFFFF),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Telas Colombia",
                      style: GoogleFonts.roboto(
                        color: const Color(0xff535353),
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                "Todos los Productos",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return ProductItem(
                      name: "Producto ${index + 1} de prueba para empresa",
                      marketer: "Telas Colombia",
                      price: 250000,
                      description:
                          "kufgbdlskdufghblsdkufhb iudsfhb ilu udf uf gidfh  lfd  u fihng  iufvnhbdf",
                      bought: 30,
                      category: "Hogar",
                      images: const [
                        "assets/img/almohadas.png",
                        "assets/img/almohadas.png",
                        "assets/img/almohadas.png",
                        "assets/img/almohadas.png",
                      ],
                      onPress: () {},
                    );
                  },
                ),
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
