/*
  © All rights reserved.
  © By allforall - 2024
*/

import 'package:allforall/user_view/screens/home_page.dart';
import 'package:allforall/user_view/screens/register_page.dart';
import 'package:allforall/user_view/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/login_page_controller.dart';
import '../widgets/login_page_widgets/login_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isHint = true;
  bool pressedLogin = false;

  void isLoged(String email, String password) async {
    bool result = await LoginPageController.isUserLoged(email, password);
    if (result) {
      userFound();
      return;
    }
    userNotFound();
    return;
  }

  void userFound() {
    setState(() {
      pressedLogin = false;
    });
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
  }

  void userNotFound() {
    setState(() {
      pressedLogin = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Credenciales Inválidas"),
      ),
    );
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

  void setVisibility() {
    setState(() {
      isHint = !isHint;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/circa_logo2.png",
                    width: 200,
                    height: 200,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "INICIA SESIÓN",
                    style: GoogleFonts.notoSans(
                      fontSize: 23,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 20),
                  //Email TextFormField
                  TextFormEmail(emailController: emailController),
                  const SizedBox(height: 20),

                  //Password TextFormField
                  LoginTextFormPassword(
                    passwordController: passwordController,
                    isHint: isHint,
                    onTap: setVisibility,
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "¿Olvidaste la Contraseña?",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  pressedLogin
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : SizedBox.shrink(),
                  //Login Button
                  Button(
                    label: "Ingresar",
                    backgroundColor: Colors.black,
                    hoverColor: Colors.grey.shade700,
                    textColor: Colors.white,
                    textSize: 23,
                    width: MediaQuery.sizeOf(context).width,
                    onTap: () async {
                      setState(() {
                        pressedLogin = true;
                      });
                      isLoged(emailController.text, passwordController.text);
                    },
                  ),
                  const SizedBox(height: 30),

                  //Register Button
                  MaterialButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterPage(),
                        ),
                      );
                    },
                    color: const Color.fromARGB(255, 231, 231, 231),
                    textColor: Colors.black,
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    minWidth: MediaQuery.sizeOf(context).width * 0.5,
                    child: const Text(
                      "Regístrate",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
