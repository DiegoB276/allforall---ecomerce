import 'package:allforall/user_view/screens/home_page.dart';
import 'package:allforall/user_view/widgets/button.dart';
import 'package:flutter/material.dart';
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
                    "assets/icons/logo.png",
                    width: 130,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "INICIA SESIÓN",
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 40),
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
                  const SizedBox(height: 50),

                  //Login Button
                  Button(
                    label: "Ingresar",
                    backgroundColor: Colors.black,
                    hoverColor: Colors.grey.shade700,
                    textColor: Colors.white,
                    textSize: 23,
                    width: MediaQuery.sizeOf(context).width,
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 30),

                  //Register Button
                  MaterialButton(
                    onPressed: () {},
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
