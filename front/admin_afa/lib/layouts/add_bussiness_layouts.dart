/*
  © All rights reserved.
  © By allforall - 2024
*/

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/add_bussiness_controllers.dart';
import '../widgets/add_bussiness_page.dart/select_terms_button.dart';
import '../widgets/add_bussiness_page.dart/text_field.dart';
import '../widgets/button.dart';
import '../widgets/login_page/login_text_form.dart';

class AddBussinessDektopLayout extends StatelessWidget {
  const AddBussinessDektopLayout({
    super.key,
    required this.nameBussinesssController,
    required this.emailBussinesssController,
    required this.passwordBussinesssController,
    required this.setVisiblePassword,
    required this.setTermsState,
    required this.isHint,
    required this.isTermsAgree,
  });

  final TextEditingController nameBussinesssController;
  final TextEditingController emailBussinesssController;
  final TextEditingController passwordBussinesssController;
  final VoidCallback setVisiblePassword;
  final VoidCallback setTermsState;
  final bool isHint;
  final bool isTermsAgree;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width * 0.1,
      ),
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            const SizedBox(height: 40),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nombre de la Empresa",
                        style: GoogleFonts.ptSans(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextFormBussiness(
                        controller: nameBussinesssController,
                        labelText: "Nombre de la Empresa",
                        hintText: "Ej: Miscelaneas Clarita",
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 100),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Correo Electrónico",
                        style: GoogleFonts.ptSans(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 15),
                      LoginTextForm(
                        controller: emailBussinesssController,
                        labelText: "Correo Electrónico",
                        hintText: "ejemplo@ejemplo.com",
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Contraseña de la Cuenta",
                        style: GoogleFonts.ptSans(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 15),
                      LoginTextFormPassword(
                        controller: passwordBussinesssController,
                        labelText: "Contraseña",
                        hintText: "Ej: *********",
                        isHint: isHint,
                        setVisible: setVisiblePassword,
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 100),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SelectTermsButton(
                        setTermsState: setTermsState,
                        isTermsAgree: isTermsAgree,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          "Confirmo que he leido y aceptado los términos y condiciones.",
                          style: GoogleFonts.ptSans(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 40),
            Center(
              child: Button(
                backgroundColor:
                    (!isTermsAgree) ? Colors.grey.shade700 : Colors.black,
                label: "Agregar Empresa",
                textColor: Colors.white,
                hoverColor: Colors.grey.shade700,
                textSize: 16,
                width: MediaQuery.sizeOf(context).width * 0.25,
                onTap: () {
                  if (!isTermsAgree) {
                    return;
                  } else {
                    String data =
                        "Nombre de la Empresa: ${nameBussinesssController.text} \nCorreo: ${emailBussinesssController.text} \nContrasea: ${passwordBussinesssController.text} \nTerminos Aceptados: $isTermsAgree";
                    AddBussinessControllers.submitData(data);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddBussinessMobileLayout extends StatelessWidget {
  const AddBussinessMobileLayout({
    super.key,
    required this.nameBussinesssController,
    required this.emailBussinesssController,
    required this.passwordBussinesssController,
    required this.setVisiblePassword,
    required this.setTermsState,
    required this.isHint,
    required this.isTermsAgree,
  });

  final TextEditingController nameBussinesssController;
  final TextEditingController emailBussinesssController;
  final TextEditingController passwordBussinesssController;
  final VoidCallback setVisiblePassword;
  final VoidCallback setTermsState;
  final bool isHint;
  final bool isTermsAgree;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Text(
                  "Nombre de la Empresa",
                  style: GoogleFonts.ptSans(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormBussiness(
                  controller: nameBussinesssController,
                  labelText: "Nombre de la Empresa",
                  hintText: "Ej: Miscelaneas Clarita",
                )
              ],
            ),
            const SizedBox(height: 25),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Correo Electrónico",
                  style: GoogleFonts.ptSans(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                LoginTextForm(
                  controller: emailBussinesssController,
                  labelText: "Correo Electrónico",
                  hintText: "ejemplo@ejemplo.com",
                )
              ],
            ),
            const SizedBox(height: 25),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Contraseña de la Cuenta",
                  style: GoogleFonts.ptSans(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                LoginTextFormPassword(
                  controller: passwordBussinesssController,
                  labelText: "Contraseña",
                  hintText: "Ej: *********",
                  isHint: isHint,
                  setVisible: setVisiblePassword,
                )
              ],
            ),
            const SizedBox(height: 25),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SelectTermsButton(
                  setTermsState: setTermsState,
                  isTermsAgree: isTermsAgree,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "Confirmo que he leido y aceptado los términos y condiciones.",
                    style: GoogleFonts.ptSans(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Button(
              backgroundColor:
                  (!isTermsAgree) ? Colors.grey.shade700 : Colors.black,
              label: "Agregar Empresa",
              textColor: Colors.white,
              hoverColor: Colors.grey.shade700,
              textSize: 16,
              width: MediaQuery.sizeOf(context).width * 0.55,
              onTap: () {
                if (!isTermsAgree) {
                  return;
                } else {
                  String data =
                      "Nombre de la Empresa: ${nameBussinesssController.text} \nCorreo: ${emailBussinesssController.text} \nContrasea: ${passwordBussinesssController.text} \nTerminos Aceptados: $isTermsAgree";
                  AddBussinessControllers.submitData(data);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
