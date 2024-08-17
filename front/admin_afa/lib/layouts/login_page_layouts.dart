/*
  © All rights reserved.
  © By allforall - 2024
*/

import 'package:admin_afa/controllers/login_page_controllers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/button.dart';
import '../widgets/login_page/login_text_form.dart';
import '../widgets/login_page/logo_container.dart';

class LoginPageDesktopLayout extends StatelessWidget {
  const LoginPageDesktopLayout({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.width,
    required this.isHint,
    required this.setHintState,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final double width;
  final bool isHint;
  final VoidCallback setHintState;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.8,
      width: MediaQuery.sizeOf(context).width * 0.7,
      decoration: BoxDecoration(
        color: const Color(0xffCDCDCD),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        children: [
          const LogoContainer(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.05,
              ),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Correo Electrónico",
                      style: GoogleFonts.ptSans(
                        color: const Color(0xff4F4F4F),
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 5),
                    LoginTextForm(
                      controller: emailController,
                      labelText: "",
                      hintText: "ejemplo@ejemplo.com",
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Contraseña",
                      style: GoogleFonts.ptSans(
                        color: const Color(0xff4F4F4F),
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 5),
                    LoginTextFormPassword(
                      controller: passwordController,
                      labelText: "",
                      hintText: "*******",
                      isHint: isHint,
                      setVisible: setHintState,
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        "¿Olvidaste la Contraseña?",
                        style: TextStyle(
                          color: Color.fromARGB(255, 126, 126, 126),
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    //Buttons
                    Button(
                      backgroundColor: const Color(0xff000000),
                      label: "Ingresar al Sistema",
                      textColor: Colors.white,
                      hoverColor: const Color(0xff444444),
                      textSize: 17,
                      width: width,
                      onTap: () {
                        LoginPageControllers.validateAccount(
                          emailController.text,
                          passwordController.text,
                          context,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class LoginPageMobileLayout extends StatelessWidget {
  const LoginPageMobileLayout({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.isHint,
    required this.setHintState,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  final bool isHint;

  final VoidCallback setHintState;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.8,
        height: MediaQuery.sizeOf(context).height * 0.9,
        decoration: BoxDecoration(
          color: const Color(0xffCDCDCD),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  "assets/icons/logo.png",
                  width: 180,
                  height: 180,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  "Administrador",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ptSans(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 40),
              Text(
                "Correo Electrónico",
                style: GoogleFonts.ptSans(
                  color: const Color(0xff4F4F4F),
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5),
              LoginTextForm(
                controller: emailController,
                labelText: "",
                hintText: "ejemplo@ejemplo.com",
              ),
              const SizedBox(height: 20),
              Text(
                "Contraseña",
                style: GoogleFonts.ptSans(
                  color: const Color(0xff4F4F4F),
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5),
              LoginTextFormPassword(
                controller: passwordController,
                labelText: "",
                hintText: "*******",
                isHint: isHint,
                setVisible: setHintState,
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {},
                child: const Text(
                  "¿Olvidaste la Contraseña?",
                  style: TextStyle(
                    color: Color.fromARGB(255, 126, 126, 126),
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              //Buttons
              Button(
                backgroundColor: const Color(0xff000000),
                label: "Ingresar al Sistema",
                textColor: Colors.white,
                hoverColor: const Color(0xff444444),
                textSize: 17,
                width: MediaQuery.sizeOf(context).width * 0.8,
                onTap: () {
                  LoginPageControllers.validateAccount(
                    emailController.text,
                    passwordController.text,
                    context,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
