/*
  © All rights reserved.
  © By allforall - 2024
*/

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ListViewImagesSelected extends StatelessWidget {
  const ListViewImagesSelected({
    super.key,
    required this.selectedImages,
  });

  final List<XFile>? selectedImages;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: selectedImages!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.file(
                File(selectedImages![index].path),
              ),
            ),
          );
        },
      ),
    );
  }
}
