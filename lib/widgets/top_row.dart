import 'package:flutter/material.dart';
import 'package:home_ai/constants/text_styles.dart';

class TopRow extends StatelessWidget {
  const TopRow({super.key, required this.title, required this.icon});

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(icon, color: Colors.black),
        ),
        Expanded(
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: AppTextStyles.heading4.fontSize,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Opacity(opacity: 0, child: Icon(Icons.arrow_back)),
      ],
    );
  }
}
