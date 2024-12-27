/*
  © All rights reserved.
  © By allforall - 2024
*/

class Product {
  Product({
    required this.id,
    required this.name,
    required this.codeProduct,
    required this.marketer,
    required this.price,
    required this.description,
    required this.bought,
    required this.amount,
    required this.category,
    required this.images,
  });

  final int id;
  final String codeProduct;
  final String name;
  final String marketer;
  final int price;
  final String description;
  final int bought;
  final int amount;
  final String category;
  final List<String> images;
}
