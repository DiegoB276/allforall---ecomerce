import 'dart:convert';
import 'package:http/http.dart' as http;

class APIService {
  static const baseUrl = "YOUR_BASE_URL";

//Inicia sesión en la app.
  static Future<int> loginService(Map data) async {
    var url = Uri.parse("$baseUrl/Auth/IniciarSesion");
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        switch (int.parse(response.body)) {
          case 1:
            return int.parse(response.body);
          case 2:
            return int.parse(response.body);
          case 3:
            return int.parse(response.body);
        }
      }
    } catch (error) {
      error.toString();
      return 0;
    }
    return 0;
  }

//Obtener el id del usuario teniendo en cuenta el correo electrónico
  static Future<int?> getUserIdByEmail(String email) async {
    final url = Uri.parse("$baseUrl/Auth/ObtenerUsuarioPorEmail/$email");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      int data = int.parse(response.body);
      return data;
    }
    return null;
  }

  static Future<bool> registerNewUser(Map data) async {
    var url = Uri.parse("$baseUrl/Auth/CrearCuenta");
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) return true;
    } catch (error) {
      error.toString();
      return false;
    }
    return false;
  }

  //Obtener las categorías desde la API.
  static Future<Set<String>?> getCategories() async {
    final url = Uri.parse("$baseUrl/Categorias");
    Set<String> categories = Set<String>();
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        for (int i = 0; i < data.length; i++) {
          categories.add(data[i]['nombre']);
        }
        return categories;
      }
    } catch (error) {
      error.toString();
      return null;
    }
    return null;
  }

  //Obtener productos por el nombre de la categoría.
  static Future<List<dynamic>?> getProductsByCategory(
      String categoryParam) async {
    final url = Uri.parse("$baseUrl/Productos/Categoria/$categoryParam");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data;
      }
    } catch (error) {
      error.toString();
      return null;
    }
    return null;
  }

  //Obtener productos de un usuario por el id del usuario.
  static Future<void> getUserProductsById(int id) async {
    final url = Uri.parse("$baseUrl/Productos/$id");
    final response = await http.get(url);
    print(response.body);
  }

//Obtener los productos que el usuario tiene en el carrito según su id.
  static Future<List<dynamic>> getUserCar(int idUser) async {
    final url = Uri.parse("$baseUrl/Carrito/ObtenerCarrito/$idUser");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data;
    }
    return [];
  }

  static Future<Map<String, dynamic>?> getUserInformation(int id) async {
    final url = Uri.parse("$baseUrl/Usuario/$id");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    }
    return null;
  }

  static Future<List<dynamic>> getShoppingUser(int userId) async {
    final url = Uri.parse("$baseUrl/MisCompras/$userId");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data;
    }
    return [];
  }

//Agrega un producto al carrito del usuario.
  static Future<int> addToCart(Map data) async {
    final url = Uri.parse("$baseUrl/Carrito/Agregar");
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
    return (response.statusCode == 200) ? 0 : 1;
  }
}
