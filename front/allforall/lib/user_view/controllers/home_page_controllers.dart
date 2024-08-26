/*
  © All rights reserved.
  © By allforall - 2024
*/

import 'dart:async';
import 'package:flutter/material.dart';
import '../utils/data.dart';

class HomePageControllers {
  static final PageController pageController = PageController(initialPage: 0);

  static late Timer timer;
  static int _currentPage = 0;

  static void movePageController() {
    timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < promoImages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }
}
