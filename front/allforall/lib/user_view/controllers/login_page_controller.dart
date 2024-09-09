import '../services/api.dart';

class LoginPageController {
  static Future<bool> isUserLoged(String email, String password) async {
    var data = {
      "email": email,
      "password": password,
    };
    bool result = await APIService.loginService(data);
    return result;
  }
}
