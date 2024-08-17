import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../button.dart';
import 'description_item_to_delete.dart';

class BussinesDetailsContainer extends StatelessWidget {
  const BussinesDetailsContainer({
    super.key,
    required this.height,
    required this.width,
    required this.titleSize,
    required this.dataSize,
    required this.onPressDeleteButton,
  });

  final double height;
  final double width;
  final double titleSize;
  final double dataSize;
  final VoidCallback onPressDeleteButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xffBFC6B0),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Detalles de la Empresa",
              style: GoogleFonts.lexend(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            DescriptionItomToDelete(
              title: "Nombre: ",
              data: "Miscelaneas Clarita",
              titleSize: titleSize,
              dataSize: dataSize,
            ),
            DescriptionItomToDelete(
              title: "ID: ",
              data: "2389894356",
              titleSize: titleSize,
              dataSize: dataSize,
            ),
            DescriptionItomToDelete(
              title: "Productos Vendidos: ",
              data: "523",
              titleSize: titleSize,
              dataSize: dataSize,
            ),
            DescriptionItomToDelete(
              title: "Total de Productos: ",
              data: "1034",
              titleSize: titleSize,
              dataSize: dataSize,
            ),
            const SizedBox(height: 10),
            Button(
              backgroundColor: Colors.orange,
              label: "Eliminar Empresa",
              textColor: Colors.white,
              hoverColor: Colors.red,
              textSize: 17,
              width: 230,
              onTap: onPressDeleteButton,
            )
          ],
        ),
      ),
    );
  }
}
