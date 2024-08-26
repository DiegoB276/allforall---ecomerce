/*
  © All rights reserved.
  © By allforall - 2024
*/

import 'package:allforall/bussiness_view/widgets/add_product_page/title_camp_text.dart';
import 'package:flutter/material.dart';

import '../bussiness_text_form.dart';

class TextFormsSection extends StatelessWidget {
  const TextFormsSection({
    super.key,
    required this.nameProductController,
    required this.descriptionProductController,
    required this.priceProductController,
    required this.amountProductController,
  });

  final TextEditingController nameProductController;
  final TextEditingController descriptionProductController;
  final TextEditingController priceProductController;
  final TextEditingController amountProductController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TittleCampProduct(label: "Nombre del Producto"),
        const SizedBox(height: 8),
        BussinessTextForm(
          controller: nameProductController,
          hintText: "Ej: Juego de Herramientas...",
          textInputType: TextInputType.name,
        ),
        const SizedBox(height: 20),
        const TittleCampProduct(label: "Descripción del Producto"),
        const SizedBox(height: 8),
        BussinessTextForm(
          controller: descriptionProductController,
          hintText: "Ej: XXXXXXXXXXXXXXXXXXXXXX....",
          textInputType: TextInputType.name,
          maxLines: 3,
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TittleCampProduct(label: "Precio"),
                  const SizedBox(height: 8),
                  BussinessTextForm(
                    controller: priceProductController,
                    hintText: "Ej: 200000",
                    textInputType: TextInputType.number,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TittleCampProduct(label: "Cantidad Stock"),
                  const SizedBox(height: 8),
                  BussinessTextForm(
                    controller: amountProductController,
                    hintText: "Ej: 40",
                    textInputType: TextInputType.number,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
