import 'package:allforall/utils/price_formatter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/Product.dart';
import '../screens/details_page.dart';

class ItemProduct extends StatelessWidget {
  const ItemProduct({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
              padding: const EdgeInsets.symmetric(horizontal: 7),
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
              child: PriceFormatter(price: product.price),
            ),
          ],
        ),
      ),
    );
  }
}
