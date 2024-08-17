/*
  © All rights reserved.
  © By allforall - 2024
*/

import 'package:admin_afa/layouts/bussiness_page_layouts.dart';
import 'package:admin_afa/utils/size_devices.dart';
import 'package:admin_afa/widgets/drawer.dart';
import 'package:flutter/material.dart';
import '../widgets/appbar_widget.dart';

class BussinessPage extends StatefulWidget {
  const BussinessPage({super.key});

  @override
  State<BussinessPage> createState() => _BussinessPageState();
}

class _BussinessPageState extends State<BussinessPage> {
  @override
  Widget build(BuildContext context) {
    late double sizeScreen = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppBarWidget.appBarColor,
        title: AppBarWidget.appbarText("Tus Empresas"),
        actions: [
          AppBarWidget.appBarActions(),
        ],
      ),
      drawer: const Drawer(
        child: DrawerContent(),
      ),
      body: (sizeScreen < mobileSize)
          ? const BussinessPageMobileLayout()
          : const BussinessPageDesktopLayout(),
    );
  }
}
