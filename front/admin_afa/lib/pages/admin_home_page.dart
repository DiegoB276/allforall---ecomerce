/*
  © All rights reserved.
  © By allforall - 2024
*/

import 'package:admin_afa/controllers/admin_home_page_controller.dart';
import 'package:admin_afa/layouts/admin_home_page_layouts.dart';
import 'package:admin_afa/utils/size_devices.dart';
import 'package:admin_afa/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'bussiness_page.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({
    super.key,
    required this.idAccount,
  });

  final int idAccount;

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  void onButtonPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BussinessPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double sizeScreen = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppBarWidget.appBarColor,
        title: AppBarWidget.appbarText(
            "Bienvenido ${AdminHomePageController.getAdmin(widget.idAccount)!.nameAdmin}"),
        actions: [
          AppBarWidget.appBarActions(),
        ],
      ),
      body: SingleChildScrollView(
        child: (sizeScreen <= mobileSize)
            ? AdminHomeMobilLayout(onPressButton: onButtonPressed)
            : AdminHomeDesktopLayout(
                onPressButton: onButtonPressed,
                width: (sizeScreen < 1090 && sizeScreen > mobileSize)
                    ? MediaQuery.sizeOf(context).width * 0.25
                    : MediaQuery.sizeOf(context).width * 0.18,
              ),
      ),
    );
  }
}
