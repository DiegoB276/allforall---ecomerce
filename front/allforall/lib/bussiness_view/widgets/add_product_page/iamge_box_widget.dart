/*
  © All rights reserved.
  © By allforall - 2024
*/

import 'dart:io';

import 'package:flutter/material.dart';

class ImageBoxWidget extends StatelessWidget {
  const ImageBoxWidget({
    super.key,
    required this.isImageUpload,
    required this.image,
    required this.onTap,
  });

  final bool isImageUpload;
  final File image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 270,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(20),
          ),
          child: isImageUpload
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.file(
                    image,
                    fit: BoxFit.fitHeight,
                  ),
                )
              : const Center(
                  child: Text(
                    'Inserta una Imagen',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 145, 145, 145),
                    ),
                  ),
                ),
        ),
        const SizedBox(height: 5),
        MaterialButton(
          onPressed: onTap,
          color: Colors.black,
          textColor: Colors.white,
          child: const Text("Aceptar"),
        )
      ],
    );
  }
}
