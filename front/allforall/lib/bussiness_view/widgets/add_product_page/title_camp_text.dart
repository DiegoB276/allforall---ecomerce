/*
  © All rights reserved.
  © By allforall - 2024
*/

import 'package:flutter/material.dart';

class TittleCampProduct extends StatelessWidget {
  const TittleCampProduct({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: Colors.grey.shade800,
      ),
    );
  }
}
