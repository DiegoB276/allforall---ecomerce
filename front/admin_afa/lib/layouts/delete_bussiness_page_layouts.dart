/*
  © All rights reserved.
  © By allforall - 2024
*/

import 'package:admin_afa/widgets/add_bussiness_page.dart/text_field.dart';
import 'package:admin_afa/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/size_devices.dart';
import '../utils/window_delete_confirmation.dart';
import '../widgets/delete_bussiness_page/bussines_details_container.dart';

class DeleteBussinessDesktopLayout extends StatefulWidget {
  const DeleteBussinessDesktopLayout({
    super.key,
    required this.nameController,
  });

  final TextEditingController nameController;

  @override
  State<DeleteBussinessDesktopLayout> createState() =>
      _DeleteBussinessDesktopLayoutState();
}

class _DeleteBussinessDesktopLayoutState
    extends State<DeleteBussinessDesktopLayout> {
  bool found = false;

  @override
  Widget build(BuildContext context) {
    late double screenWidth = MediaQuery.sizeOf(context).width;
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Recuerda que esta acción no se puede deshacer, si llegas a eliminar una empresa, esta se borrará definitivamente del sistema con sus respectivos productos.",
                    style: TextStyle(color: Colors.red),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    "Nombre de la Empresa",
                    style: GoogleFonts.ptSans(
                      fontSize: 18,
                      color: const Color(0xff4F4F4F),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormBussiness(
                    controller: widget.nameController,
                    labelText: "Nombre de la Empresa",
                    hintText: "Ej: Miscelaneas Clarita",
                  ),
                  const SizedBox(height: 40),
                  Button(
                    backgroundColor: Colors.black,
                    label: "Buscar",
                    textColor: Colors.white,
                    hoverColor: Colors.grey.shade600,
                    textSize: 18,
                    width: MediaQuery.sizeOf(context).width * 0.2,
                    onTap: () {
                      if (widget.nameController.text == "Miscelaneas Clarita") {
                        setState(() {
                          found = true;
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.1,
            ),
            (found)
                ? BussinesDetailsContainer(
                    height: MediaQuery.sizeOf(context).height * 0.6,
                    width: MediaQuery.sizeOf(context).width * 0.4,
                    titleSize:
                        (screenWidth < tabletSize && screenWidth > mobileSize)
                            ? 19
                            : 23,
                    dataSize:
                        (screenWidth < tabletSize && screenWidth > mobileSize)
                            ? 18
                            : 20,
                    onPressDeleteButton: () {
                      showWindownConfirmation(context);
                    },
                  )
                : SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.4,
                  )
          ],
        ),
      ),
    );
  }
}

class DeleteBussinessMobileLayout extends StatelessWidget {
  const DeleteBussinessMobileLayout({
    super.key,
    required this.nameController,
  });

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Recuerda que esta acción no se puede deshacer, si llegas a eliminar una empresa, esta se borrará definitivamente del sistema con sus respectivos productos.",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 40),
            Text(
              "Nombre de la Empresa",
              style: GoogleFonts.ptSans(
                fontSize: 18,
                color: const Color(0xff4F4F4F),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            TextFormBussiness(
              controller: nameController,
              labelText: "Nombre de la Empresa",
              hintText: "Ej: Miscelaneas Clarita",
            ),
            const SizedBox(height: 30),
            Button(
              backgroundColor: Colors.black,
              label: "Buscar",
              textColor: Colors.white,
              hoverColor: Colors.grey.shade600,
              textSize: 18,
              width: MediaQuery.sizeOf(context).width * 0.4,
              onTap: () {},
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Center(
                child: BussinesDetailsContainer(
                  height: 500,
                  width: MediaQuery.sizeOf(context).width,
                  titleSize: 20,
                  dataSize: 18,
                  onPressDeleteButton: () {
                    showWindownConfirmation(context);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
