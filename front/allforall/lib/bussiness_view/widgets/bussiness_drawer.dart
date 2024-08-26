/*
  © All rights reserved.
  © By allforall - 2024
*/

import 'package:allforall/bussiness_view/screens/add_product_page.dart';
import 'package:allforall/bussiness_view/screens/bussines_home_page.dart';
import 'package:allforall/bussiness_view/screens/delete_prodcut_page.dart';
import 'package:allforall/bussiness_view/screens/search_product_by_category.dart';
import 'package:allforall/bussiness_view/screens/search_product_by_id.dart';
import 'package:flutter/material.dart';

class BussinessDrawer extends StatelessWidget {
  const BussinessDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          DrawerHeader(
            child: Image.asset("assets/icons/logo.png"),
          ),
          const SizedBox(height: 40),
          ListTile(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const BussinesHomePage(),
                ),
              );
            },
            iconColor: Colors.purple,
            title: const Text(
              "Inicio",
              style: TextStyle(fontSize: 20),
            ),
            leading: const Icon(
              Icons.home_rounded,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddProductPage(),
                ),
              );
            },
            title: const Text(
              "Agregar Productos",
              style: TextStyle(fontSize: 20),
            ),
            leading: const Icon(Icons.add_box),
          ),
          ListTile(
            onTap: () {},
            title: const Text(
              "Ver Productos",
              style: TextStyle(fontSize: 20),
            ),
            leading: const Icon(
              Icons.all_inbox,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchProductByIdPage(),
                ),
              );
            },
            title: const Text(
              "Buscar por ID",
              style: TextStyle(fontSize: 20),
            ),
            leading: const Icon(
              Icons.search_rounded,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchProductByCategoryPage(),
                ),
              );
            },
            title: const Text(
              "Buscar por Categoría",
              style: TextStyle(fontSize: 20),
            ),
            leading: const Icon(
              Icons.search_rounded,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const DeleteProdcutPage(),
                ),
              );
            },
            title: const Text(
              "Eliminar Productos",
              style: TextStyle(fontSize: 20),
            ),
            leading: const Icon(
              Icons.delete_rounded,
            ),
          ),
        ],
      ),
    );
  }
}
