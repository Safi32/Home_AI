import 'package:flutter/material.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/utils/colors.dart';

class AddNewWidget extends StatelessWidget {
  const AddNewWidget({super.key, required this.imageUrl, required this.title, required this.onPressed});

  final String imageUrl;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 57,
        width: 364,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.lightBlue,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Image.asset(imageUrl),
              SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(fontSize: AppTextStyles.heading6.fontSize),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
