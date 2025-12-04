import 'package:flutter/material.dart';
import 'package:home_ai/constants/text_styles.dart';

class NameWidget extends StatelessWidget {
  const NameWidget({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
        fontSize: AppTextStyles.heading5.fontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
