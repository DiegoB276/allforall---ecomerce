/*
  © All rights reserved.
  © By allforall - 2024
*/

import 'package:admin_afa/layouts/add_bussiness_layouts.dart';
import 'package:admin_afa/utils/size_devices.dart';
import 'package:admin_afa/widgets/drawer.dart';
import 'package:flutter/material.dart';
import '../widgets/appbar_widget.dart';

class AddBussinessPage extends StatefulWidget {
  const AddBussinessPage({super.key});

  @override
  State<AddBussinessPage> createState() => _AddBussinessPageState();
}

class _AddBussinessPageState extends State<AddBussinessPage> {
  late TextEditingController nameBussinesssController;
  late TextEditingController emailBussinesssController;
  late TextEditingController passwordBussinesssController;
  bool isHint = true;
  bool isTermsAgree = false;

  void acceptTerms() {
    setState(() {
      isTermsAgree = !isTermsAgree;
    });
  }

  void setHintState() {
    setState(() {
      isHint = !isHint;
    });
  }

  @override
  void initState() {
    super.initState();
    nameBussinesssController = TextEditingController();
    emailBussinesssController = TextEditingController();
    passwordBussinesssController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nameBussinesssController.dispose();
    emailBussinesssController.dispose();
    passwordBussinesssController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late double sizeScreen = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppBarWidget.appBarColor,
        title: AppBarWidget.appbarText("Agregar Empresa"),
        actions: [
          AppBarWidget.appBarActions(),
        ],
      ),
      drawer: const Drawer(
        child: DrawerContent(),
      ),
      body: (sizeScreen <= mobileSize)
          ? AddBussinessMobileLayout(
              nameBussinesssController: nameBussinesssController,
              emailBussinesssController: emailBussinesssController,
              passwordBussinesssController: passwordBussinesssController,
              setVisiblePassword: () => setHintState(),
              setTermsState: () => acceptTerms(),
              isHint: isHint,
              isTermsAgree: isTermsAgree,
            )
          : AddBussinessDektopLayout(
              nameBussinesssController: nameBussinesssController,
              emailBussinesssController: emailBussinesssController,
              passwordBussinesssController: passwordBussinesssController,
              setVisiblePassword: () => setHintState(),
              setTermsState: () => acceptTerms(),
              isHint: isHint,
              isTermsAgree: isTermsAgree,
            ),
    );
  }
}
