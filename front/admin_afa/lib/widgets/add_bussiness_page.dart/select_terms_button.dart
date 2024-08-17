/*
  © All rights reserved.
  © By allforall - 2024
*/

import 'package:flutter/material.dart';

class SelectTermsButton extends StatelessWidget {
  const SelectTermsButton({
    super.key,
    required this.setTermsState,
    required this.isTermsAgree,
  });

  final VoidCallback setTermsState;
  final bool isTermsAgree;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: setTermsState,
      child: Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          color: (isTermsAgree) ? Colors.purple : Colors.transparent,
          border: const Border(
            top: BorderSide(color: Colors.black),
            bottom: BorderSide(color: Colors.black),
            left: BorderSide(color: Colors.black),
            right: BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
