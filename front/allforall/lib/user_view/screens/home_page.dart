import 'package:allforall/user_view/models/Product.dart';
import 'package:allforall/user_view/screens/categories_page.dart';
import 'package:allforall/user_view/screens/details_page.dart';
import 'package:allforall/user_view/utils/data.dart';
import 'package:allforall/user_view/widgets/home_page_widgets/description_text.dart';
import 'package:allforall/user_view/widgets/product_item.dart';
import 'package:flutter/material.dart';
import '../widgets/home_page_widgets/categories_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: const Text(
          "¿Qué estás Buscando?",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {},
              child: const CircleAvatar(
                backgroundColor: Colors.purple,
                child: Icon(Icons.person),
              ),
            ),
          ),
        ],
      ),
      drawer: const Drawer(
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const DescriptionText(label: "Categorías"),
            const SizedBox(height: 20),
            CategoriesListView(categorias: categorias),
            Center(
              child: MaterialButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CategoriesPage(),
                    ),
                  );
                },
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 3,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Text(
                  "Ver más",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const DescriptionText(label: "Tus Favoritos"),
            const SizedBox(height: 20),
            SizedBox(
              height: 290,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  Product product = Product(
                    name: products[index]['name'],
                    marketer: products[index]['marketer'],
                    price: products[index]['price'],
                    description: products[index]['description'],
                    bought: products[index]['bought'],
                    category: products[index]['category'],
                    images: products[index]['images'],
                  );
                  return ProductItem(
                    name: product.name,
                    marketer: product.marketer,
                    price: product.price,
                    description: product.description,
                    bought: product.bought,
                    category: product.category,
                    images: product.images,
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailsProductPage(product: product),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
