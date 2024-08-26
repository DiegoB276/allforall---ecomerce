/*
  © All rights reserved.
  © By allforall - 2024
*/

import 'package:flutter/material.dart';

class SearchAppBarHomePage extends StatelessWidget {
  const SearchAppBarHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: MediaQuery.sizeOf(context).width * 0.62,
      child: TextField(
        //textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 20),
          hintText: "¿Qué estás Buscando?",
          filled: true,
          fillColor: Colors.white,
          prefixIcon: const Icon(Icons.search),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}
