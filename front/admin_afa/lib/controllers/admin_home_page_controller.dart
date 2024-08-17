import '../models/Admin.dart';
import '../utils/data.dart';

class AdminHomePageController {
  //Retorna el objeto administrador de acuerdo al ID de la cuenta.
  static Admin? getAdmin(int idAccount) {
    for (var admin in adminsList) {
      if (admin["id_account"] == idAccount) {
        final Admin adminObj = Admin(
          idAdmin: admin["id_account"],
          nameAdmin: admin["name_admin"],
        );
        return adminObj;
      }
    }
    return null;
  }
}
