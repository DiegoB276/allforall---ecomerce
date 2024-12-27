import 'package:allforall/bussiness_view/screens/bussines_home_page.dart';
import '../screens/home_page.dart';
import '../services/api.dart';
import 'package:flutter/material.dart';


class LoginPageController {

//Teniendo en cuenta el correo y la contraseña devuelve el rol si el usuario existe.
//Si este no existe, devuelve 0.
  static Future<int> isUserLoged(String email, String password) async {
    var data = {
      "email": email,
      "password": password,
    };
    int result = await APIService.loginService(data);
    return result;
  }

//Valida que los roles que van a acceder a este apartado sea empresa(2) o usuario(3).
//Si el rol es de admin o no existe, éste no hace nada.
  static Future<void> navigateToHome(int rol, BuildContext context) async {
    if (rol == 0 || rol == 1) return;
    if (rol == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BussinesHomePage(),
        ),
      );
    }
    if (rol == 3) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    }
  }
}
