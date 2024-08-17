import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/button.dart';

Future<dynamic> showWindownConfirmation(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: const Color(0xffFFE4E4),
        content: SizedBox(
          height: 400,
          width: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "¿Estás seguro de eliminar la empresa?",
                textAlign: TextAlign.center,
                style: GoogleFonts.aBeeZee(fontSize: 23),
              ),
              const SizedBox(height: 20),
              Button(
                backgroundColor: Colors.red,
                label: "Si, Eliminar",
                textColor: Colors.white,
                hoverColor: Colors.grey.shade600,
                textSize: 18,
                width: MediaQuery.sizeOf(context).width * 0.4,
                onTap: () {},
              ),
              const SizedBox(height: 13),
              Button(
                backgroundColor: Colors.red.shade200,
                label: "No, Cancelar",
                textColor: Colors.white,
                hoverColor: Colors.grey.shade600,
                textSize: 18,
                width: MediaQuery.sizeOf(context).width * 0.4,
                onTap: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      );
    },
  );
}
