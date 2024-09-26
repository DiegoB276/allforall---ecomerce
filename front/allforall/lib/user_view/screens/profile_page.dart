import 'package:allforall/user_view/widgets/button.dart';
import 'package:allforall/user_view/widgets/profile_page_widgets/info_box_profile_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/api.dart';
import '../widgets/profile_page_widgets/title_field.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int userId = 0;
  SharedPreferences? pref;

//Obtiene el id del usuario.
  void getUserById() async {
    pref = await SharedPreferences.getInstance();
    final id = await pref!.getInt("user_id")!;
    setState(() {
      userId = id;
    });
  }

  @override
  void initState() {
    super.initState();
    getUserById();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          title: Text("Mi Perfil"),
        ),
        body: FutureBuilder(
          future: APIService.getUserInformation(userId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: LoadingAnimationWidget.inkDrop(
                    color: Colors.black, size: 40),
              );
            }
            return Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            "assets/icons/profile_image.jpg",
                            width: 140,
                            height: 140,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Text(
                        "Información del Usuario",
                        style: GoogleFonts.aDLaMDisplay(fontSize: 23),
                      ),
                      const SizedBox(height: 10),
                      TitleField(
                        label: "Nombre de Usuario",
                      ),
                      infoBoxProfileItem(
                          label:
                              "${snapshot.data!['nombre']} ${snapshot.data!['apellido']}"),
                      const SizedBox(height: 10),
                      TitleField(
                        label: "Número de Documento",
                      ),
                      infoBoxProfileItem(label: snapshot.data!['cedula']),
                      const SizedBox(height: 10),
                      TitleField(
                        label: "Número de Celular",
                      ),
                      infoBoxProfileItem(label: snapshot.data!['telefono']),
                      const SizedBox(height: 10),
                      TitleField(
                        label: "País",
                      ),
                      infoBoxProfileItem(label: snapshot.data!['pais']),
                      const SizedBox(height: 10),
                      TitleField(
                        label: "Departamento",
                      ),
                      infoBoxProfileItem(label: snapshot.data!['departamento']),
                      const SizedBox(height: 10),
                      TitleField(
                        label: "Ciudad",
                      ),
                      infoBoxProfileItem(label: snapshot.data!['ciudad']),
                      const SizedBox(height: 10),
                      TitleField(
                        label: "Dirección",
                      ),
                      infoBoxProfileItem(label: snapshot.data!['direccion']),
                      const SizedBox(height: 20),
                      Button(
                        label: "Cerrar Sesión",
                        backgroundColor: Colors.red,
                        hoverColor: Colors.red.shade400,
                        textColor: Colors.white,
                        textSize: 18,
                        width: MediaQuery.sizeOf(context).width * 0.4,
                        onTap: () {},
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
