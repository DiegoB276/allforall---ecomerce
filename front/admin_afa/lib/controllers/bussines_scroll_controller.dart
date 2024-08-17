/*
  © All rights reserved.
  © By allforall - 2024
*/

import 'package:flutter/material.dart';

class BussinesScrollController {
  static final ScrollController scrollController = ScrollController();

  static void scrollLeft() {
    scrollController.animateTo(
      scrollController.offset -
          1000, // Ajusta este valor según el desplazamiento deseado
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  static void scrollRight() {
    scrollController.animateTo(
      scrollController.offset +
          1000, // Ajusta este valor según el desplazamiento deseado
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
