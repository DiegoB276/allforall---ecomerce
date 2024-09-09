/*
  © All rights reserved.
  © By allforall - 2024
*/

import 'package:flutter/material.dart';

class SearchAppBarHomePage extends StatefulWidget {
  const SearchAppBarHomePage({
    super.key,
    required this.onTap,
    required this.onChanged,
    required this.controller,
  });

  final VoidCallback onTap;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;

  @override
  State<SearchAppBarHomePage> createState() => _SearchAppBarHomePageState();
}

class _SearchAppBarHomePageState extends State<SearchAppBarHomePage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: MediaQuery.sizeOf(context).width * 0.62,
      child: TextField(
        controller: widget.controller,
        onTap: widget.onTap,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 20),
          hintText: "¿Qué estás Buscando?",
          filled: true,
          fillColor: Colors.white,
          prefixIcon: const Icon(Icons.search),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}
