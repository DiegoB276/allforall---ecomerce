/*
  © All rights reserved.
  © By allforall - 2024
*/

import 'package:flutter/material.dart';

class ItemCartProduct extends StatelessWidget {
  const ItemCartProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 7),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: Colors.grey.shade100,
          height: 130,
          child: Row(
            children: [
              Image.asset(
                "assets/img/microondas.png",
                width: 115,
                height: 115,
              ),
              const SizedBox(width: 7),
              Expanded(
                child: Container(
                  color: Colors.grey.shade300,
                  width: MediaQuery.sizeOf(context).width,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Microondas Samsung Modelo HG65T432",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Text(
                        "Este es un prducto esun ejemplo de varios producto que bla bla bla bla",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 3),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Text(
                          "\$340000",
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
