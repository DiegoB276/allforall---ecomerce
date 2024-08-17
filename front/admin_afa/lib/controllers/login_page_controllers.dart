/*
  © All rights reserved.
  © By allforall - 2024
*/

import 'package:admin_afa/utils/data.dart';
import 'package:flutter/material.dart';
import '../pages/admin_home_page.dart';

//Navega a la pantalla de bienvenida.
class LoginPageControllers {
  static void onPressSubmmitButton(BuildContext context, int idAccount) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => AdminHomePage(idAccount: idAccount),
      ),
    );
  }

//Valida las credenciales para iniciar sesión.
  static void validateAccount(
      String email, String password, BuildContext context) {
    List<Map<String, dynamic>> accounts = accountsList;
    for (var account in accounts) {
      if (account["email"] == email &&
          account["password"] == password &&
          account["rol"] == 1) {
        onPressSubmmitButton(context, account["id_account"]);
        return;
      }
    }
    return;
  }
}
