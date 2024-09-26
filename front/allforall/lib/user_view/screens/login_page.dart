/*
  © All rights reserved.
  © By allforall - 2024
*/

import 'package:allforall/user_view/screens/register_page.dart';
import 'package:allforall/user_view/services/api.dart';
import 'package:allforall/user_view/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../controllers/login_page_controller.dart';
import '../widgets/login_page_widgets/login_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  SharedPreferences? pref;
  bool isHint = true;
  bool pressedLogin = false;

  void isLoged(String email, String password) async {
    int result = await LoginPageController.isUserLoged(email, password);
    if (result == 0 || result == 1) {
      userNotFound();
      return;
    }
    setUserIDToPersistance(email);
    await LoginPageController.navigateToHome(result, context);
  }

//Inicia las preferencias para almacenar datos.
  void initPreferences() async {
    pref = await SharedPreferences.getInstance();
  }

//Función que se ejecuta cuando no se encuentra un usuario.
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

//Si la cuenta existe, almacena el id del usuario en el dispositivo.
  void setUserIDToPersistance(String emailParam) async {
    final data = await APIService.getUserIdByEmail(emailParam);
    pref!.setInt("user_id", data!);
  }

  @override
  void initState() {
    super.initState();
    initPreferences();
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
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Center(
                            child: LoadingAnimationWidget.threeArchedCircle(
                              color: Colors.black,
                              size: 35,
                            ),
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
