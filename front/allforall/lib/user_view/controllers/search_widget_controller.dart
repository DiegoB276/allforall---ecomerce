import 'dart:collection';
import 'package:allforall/user_view/models/Product.dart';
import 'package:allforall/utils/data.dart';

class SearchWidgetController {
  static HashSet<Product> addProductsToList() {
    HashSet<Product> hashProducts = HashSet();

    for (var p in products) {
      Product product = Product(
        codeProduct: "334324324",
        name: p['name'],
        marketer: p['marketer'],
        price: p['price'],
        description: p['description'],
        bought: p['bought'],
        amount: p['amount'],
        category: p['category'],
        images: p['images'],
      );
      hashProducts.add(product);
    }
    return hashProducts;
  }

  static List<Product> filterProducts(String keyWord) {
    HashSet<Product> products = addProductsToList();
    List<Product> productsFiltered = [];

    if (keyWord.isEmpty) {
      productsFiltered = products.toList();
    } else {
      productsFiltered = products
          .where(
              (res) => res.name.toLowerCase().contains(keyWord.toLowerCase()))
          .toList();
    }
    return productsFiltered;
  }
}
