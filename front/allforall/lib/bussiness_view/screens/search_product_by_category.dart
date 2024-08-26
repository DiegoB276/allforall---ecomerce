/*
  © All rights reserved.
  © By allforall - 2024
*/

import 'package:allforall/bussiness_view/widgets/bussiness_drawer.dart';
import 'package:allforall/bussiness_view/widgets/item_product_search.dart';
import 'package:flutter/material.dart';
import '../utils/product_categories.dart';
import '../widgets/button.dart';

class SearchProductByCategoryPage extends StatefulWidget {
  const SearchProductByCategoryPage({super.key});

  @override
  State<SearchProductByCategoryPage> createState() =>
      _SearchProductByCategoryPageState();
}

class _SearchProductByCategoryPageState
    extends State<SearchProductByCategoryPage> {
  String dropdownValue = categories.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Buscar Producto"),
      ),
      drawer: const Drawer(
        child: BussinessDrawer(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                "Selecciona la Categoría",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: dropdownValue,
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: categories.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
                validator: (value) =>
                    value == null ? 'Por favor selecciona una categoría' : null,
              ),
              const SizedBox(height: 20),
              Center(
                child: BussinessButton(
                  label: "Buscar",
                  backgroundColor: Colors.black,
                  hoverColor: Colors.grey.shade700,
                  textColor: Colors.white,
                  textSize: 17,
                  width: MediaQuery.sizeOf(context).width * 0.35,
                  onTap: () {},
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return const ItemProductSearch();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
