/*
  © All rights reserved.
  © By allforall - 2024
*/

import 'package:allforall/user_view/widgets/home_page_widgets/description_text.dart';
import 'package:allforall/user_view/widgets/home_page_widgets/categories_list.dart';
import 'package:allforall/user_view/controllers/home_page_controllers.dart';
import 'package:allforall/user_view/screens/bag_shop_page.dart';
import 'package:allforall/user_view/screens/details_page.dart';
import '../widgets/home_page_widgets/search_box_appbar.dart';
import 'package:allforall/user_view/widgets/drawer.dart';
import '../controllers/search_widget_controller.dart';
import 'package:allforall/user_view/models/Product.dart';
import 'package:allforall/user_view/services/api.dart';
import 'package:allforall/utils/data.dart';
import 'package:flutter/material.dart';
import '../widgets/item_product.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSearching = false;
  late TextEditingController searchController;
  List<String> categories = [];
  List<Product> filteredProducts = [];

  void initPreferences() async {
    
  }

  void updateSearchResults(String query) {
    setState(() {
      filteredProducts = SearchWidgetController.filterProducts(query);
    });
  }

  void getCategories() async {
    Set<String>? result = await APIService.getCategories();
    setState(() {
      categories = result!.toList();
      categories.sort();
    });
  }

  void getCarUser() async {
    final data = await APIService.getUserIdByEmail("diego6@gmail.com");
    print(data);
  }



  @override
  void initState() {
    super.initState();
    getCategories();
    filteredProducts = SearchWidgetController.filterProducts('');
    searchController = TextEditingController();
    HomePageControllers.movePageController();
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
    HomePageControllers.timer.cancel();
    HomePageControllers.pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerScrimColor: const Color.fromARGB(167, 0, 0, 0),
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        leading: Builder(
          builder: ((context) {
            return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
                size: 30,
              ),
            );
          }),
        ),
        //backgroundColor: const Color(0xff8B5DEE),
        backgroundColor: Colors.black,
        title: SearchAppBarHomePage(
          controller: searchController,
          onChanged: updateSearchResults,
          onTap: () {
            setState(() {
              isSearching = true;
            });
          },
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BagShopPage(),
                  ),
                );
              },
              child: Stack(
                children: [
                  Icon(
                    Icons.shopping_bag_rounded,
                    size: 30,
                    color: Colors.white,
                  ),
                  Positioned(
                    bottom: 2,
                    right: 2,
                    child: Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      drawer: const Drawer(
        child: ContentDrawer(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isSearching
                ? SizedBox(
                    height: 300,
                    child: ListView.builder(
                      itemCount: filteredProducts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              isSearching = false;
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsProductPage(
                                  product: filteredProducts[index],
                                ),
                              ),
                            );
                          },
                          child: ListTile(
                            title: Text(filteredProducts[index].name),
                            subtitle: Text(
                              filteredProducts[index].description,
                              maxLines: 2,
                            ),
                            leading: Image.asset(
                              filteredProducts[index].images.first,
                              height: 90,
                              width: 90,
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : SizedBox.shrink(),
            SizedBox(
              height: 240,
              child: PageView.builder(
                controller: HomePageControllers.pageController,
                itemCount: promoImages.length,
                itemBuilder: (context, index) {
                  return ClipRect(
                    child: Image.asset(
                      promoImages[index],
                      width: 300,
                      height: 300,
                      fit: BoxFit.fill,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const DescriptionText(label: "Categorías Destacadas"),
            CategoriesListView(
              categories: categories,
            ),
            const SizedBox(height: 10),
            const DescriptionText(label: "Últimos Agregados"),
            const SizedBox(height: 5),
            SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: (products.length < 5) ? products.length : 5,
                itemBuilder: (BuildContext context, int index) {
                  Product product = Product(
                    id: 22222,
                    codeProduct: "334324324",
                    name: products[index]['name'],
                    marketer: products[index]['marketer'],
                    price: products[index]['price'],
                    description: products[index]['description'],
                    bought: products[index]['bought'],
                    amount: products[index]['amount'],
                    category: products[index]['category'],
                    images: products[index]['images'],
                  );
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: ItemProduct(product: product),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
