/*
  © All rights reserved.
  © By allforall - 2024
*/

import 'package:allforall/user_view/controllers/home_page_controllers.dart';
import 'package:allforall/user_view/models/Product.dart';
import 'package:allforall/user_view/screens/details_page.dart';
import 'package:allforall/user_view/utils/data.dart';
import 'package:allforall/user_view/widgets/drawer.dart';
import 'package:allforall/user_view/widgets/home_page_widgets/categories_list.dart';
import 'package:allforall/user_view/widgets/home_page_widgets/description_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/home_page_widgets/search_box_appbar.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    HomePageControllers.movePageController();
  }

  @override
  void dispose() {
    HomePageControllers.timer.cancel();
    HomePageControllers.pageController.dispose();
    super.dispose();
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
        title: const SearchAppBarHomePage(),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {},
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person),
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
            // const SizedBox(height: 5),
            const CategoriesListView(),
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsProductPage(
                              product: product,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: 170,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade400,
                              blurRadius: 2,
                              blurStyle: BlurStyle.normal,
                              offset: const Offset(2, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Container(
                                padding: const EdgeInsets.all(7),
                                color: const Color.fromARGB(255, 255, 255, 255),
                                child: Image.asset(
                                  product.images[0],
                                  width: 130,
                                  height: 130,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "By ${product.marketer}",
                              style: TextStyle(color: Colors.grey.shade700),
                            ),
                            const SizedBox(height: 7),
                            Text(
                              product.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.robotoFlex(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 7),
                              decoration: BoxDecoration(
                                color: const Color(0xffD9D9D9),
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade400,
                                    blurRadius: 2,
                                    blurStyle: BlurStyle.normal,
                                    offset: const Offset(0.3, 1),
                                  ),
                                ],
                              ),
                              child: Text(
                                "\$${NumberFormat.currency(locale: 'es_CO', symbol: '', decimalDigits: 0).format(
                                  product.price,
                                )}",
                                style: GoogleFonts.arsenal(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
