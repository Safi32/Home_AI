import 'package:flutter/material.dart';

class ShadowTextfield extends StatelessWidget {
  const ShadowTextfield({super.key, required this.imageUrl, required this.hintText});

  final String imageUrl;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Image.asset(imageUrl),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      ),
    );
  }
}
