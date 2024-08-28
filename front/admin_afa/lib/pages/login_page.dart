/*
  © All rights reserved.
  © By allforall - 2024
*/

import 'package:admin_afa/layouts/login_page_layouts.dart';
import 'package:admin_afa/utils/size_devices.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  //textFieldPassword Intractions
  bool isHint = true;
  void setHintState() {
    setState(() {
      isHint = !isHint;
    });
  }

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double sizeScreen = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage("assets/bg.jpg"),
            fit: BoxFit.cover,
            opacity: 0.6,
          ),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: (sizeScreen < mobileSize)
                ? LoginPageMobileLayout(
                    emailController: emailController,
                    passwordController: passwordController,
                    isHint: isHint,
                    setHintState: setHintState,
                  )
                : LoginPageDesktopLayout(
                    emailController: emailController,
                    passwordController: passwordController,
                    width: (sizeScreen < 1090 && sizeScreen > mobileSize)
                        ? MediaQuery.sizeOf(context).width * 0.25
                        : MediaQuery.sizeOf(context).width * 0.18,
                    isHint: isHint,
                    setHintState: setHintState,
                  ),
          ),
        ),
      ),
    );
  }
}
