/*
  © All rights reserved.
  © By allforall - 2024
*/

import 'package:flutter/material.dart';

class DateBoxSelector extends StatelessWidget {
  const DateBoxSelector({
    super.key,
    required this.onTap,
    required this.infoDate,
  });

  final VoidCallback onTap;
  final String infoDate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 55,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(7),
          border: const Border(
            top: BorderSide(
              color: Colors.black,
              width: 1,
            ),
            bottom: BorderSide(
              color: Colors.black,
              width: 1,
            ),
            right: BorderSide(
              color: Colors.black,
              width: 1,
            ),
            left: BorderSide(
              color: Colors.black,
              width: 1,
            ),
          ),
        ),
        child: Center(
          child: Text(
            infoDate.isEmpty ? "Inserta una Fecha" : infoDate,
            style: const TextStyle(
              color: Color.fromARGB(255, 109, 109, 109),
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.start,
          ),
        ),
      ),
    );
  }
}
