import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            fillColor: const Color.fromARGB(255, 255, 255, 255),
            filled: true,
            hintText: hintText,
            hintStyle:
                TextStyle(color: const Color.fromARGB(255, 125, 122, 122))),
      ),
    );
  }
}
