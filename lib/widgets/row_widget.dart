import 'package:flutter/material.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/utils/colors.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: AppTextStyles.heading5.fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: AppTextStyles.heading7.fontSize,
            fontWeight: FontWeight.w400,
            color: AppColors.primary,
          ),
        ),
        Icon(Icons.arrow_forward, color: AppColors.primary, size: 15),
      ],
    );
  }
}
