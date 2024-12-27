import 'package:allforall/bussiness_view/widgets/profile_bussines_page_widgets/info_item_profile_bussiness.dart';
import 'package:allforall/bussiness_view/widgets/profile_bussines_page_widgets/title_field_bussines.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileBussinessPage extends StatelessWidget {
  const ProfileBussinessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          "Detalles de la Empresa",
          style: GoogleFonts.aBeeZee(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Center(
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
                          "assets/icons/logo.png",
                          width: 140,
                          height: 140,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                TitleFieldBussines(label: "Nombre de la Empresa"),
                InfoItemProfileBussines(label: "Ferretería García"),
                const SizedBox(height: 10),
                TitleFieldBussines(label: "ID de la Empresa"),
                InfoItemProfileBussines(label: "27"),
                const SizedBox(height: 10),
                TitleFieldBussines(label: "Cantidad de Productos"),
                InfoItemProfileBussines(label: "1350"),
                const SizedBox(height: 10),
                TitleFieldBussines(label: "Productos Vendidos"),
                InfoItemProfileBussines(label: "325"),
                const SizedBox(height: 10),
                TitleFieldBussines(label: "Correo Electrónico"),
                InfoItemProfileBussines(label: "miempresa@gmail.com"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
