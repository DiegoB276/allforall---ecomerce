import 'package:allforall/user_view/services/api.dart';

class RegisterPageController {
  static Future<bool> registerStatus(
    String email,
    String password,
    String rol,
    String image,
    String name,
    String lastname,
    String phone,
    String idDoc,
    String country,
    String state,
    String city,
    String bornDate,
    String address,
  ) async {
    var data = {
      "email": email,
      "password": password,
      "rol": rol,
      "imagen": image,
      "nombre": name,
      "apellido": lastname,
      "telefono": phone,
      "cedula": idDoc,
      "pais": country,
      "departamento": state,
      "ciudad": city,
      "fechaNacimiento": bornDate,
      "direccion": address,
    };
    final bool result = await APIService.registerService(data);
    return result;
  }

  static int validateFields(
    String email,
    String password,
    String rol,
    String image,
    String name,
    String lastname,
    String phone,
    String idDoc,
    String country,
    String state,
    String city,
    String bornDate,
    String address,
  ) {
    if (email.isEmpty ||
        password.isEmpty ||
        name.isEmpty ||
        lastname.isEmpty ||
        phone.isEmpty ||
        idDoc.isEmpty ||
        country.isEmpty ||
        state.isEmpty ||
        city.isEmpty ||
        bornDate.isEmpty ||
        address.isEmpty) {
      return 1;
    }
    return 0;
  }
}
