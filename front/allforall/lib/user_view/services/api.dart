import 'dart:convert';
import 'package:http/http.dart' as http;

class APIService {
  static const baseUrl = "https://l2hr13kj-5103.use.devtunnels.ms/api";

  static Future<bool> loginService(Map data) async {
    var url = Uri.parse("$baseUrl/Auth/IniciarSesion");
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );
    return (response.statusCode == 200) ? true : false;
  }

  static Future<bool> registerService(Map data) async {
    var url = Uri.parse("$baseUrl/Auth/CrearCuenta");
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );
    return (response.statusCode == 200) ? true : false;
  }
}
