/*
  © All rights reserved.
  © By allforall - 2024
*/

import 'package:admin_afa/utils/size_devices.dart';
import 'package:admin_afa/widgets/drawer.dart';
import 'package:flutter/material.dart';

import '../layouts/delete_bussiness_page_layouts.dart';
import '../widgets/appbar_widget.dart';

class DeleteBussinessPage extends StatefulWidget {
  const DeleteBussinessPage({super.key});

  @override
  State<DeleteBussinessPage> createState() => _DeleteBussinessPageState();
}

class _DeleteBussinessPageState extends State<DeleteBussinessPage> {
  late TextEditingController nameController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late double sizeScreen = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppBarWidget.appBarColor,
        title: AppBarWidget.appbarText("Eliminar Empresa"),
        actions: [
          AppBarWidget.appBarActions(),
        ],
      ),
      drawer: const Drawer(
        child: DrawerContent(),
      ),
      body: (sizeScreen <= mobileSize)
          ? DeleteBussinessMobileLayout(
              nameController: nameController,
            )
          : DeleteBussinessDesktopLayout(
              nameController: nameController,
            ),
    );
  }
}
