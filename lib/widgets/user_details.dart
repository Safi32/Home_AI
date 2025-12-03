import 'package:flutter/material.dart';

import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/utils/colors.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({super.key, required this.imageUrl, required this.title, required this.subtitle});

  final String imageUrl;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 101,
          width: 81,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imageUrl),

              fit: BoxFit.cover,
            ),
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.accent),
            boxShadow: [
              BoxShadow(
                color: AppColors.accent.withOpacity(0.4),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: AppTextStyles.heading7.fontSize,
            fontWeight: FontWeight.w400,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          margin: const EdgeInsets.only(top: 6),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Text(
            subtitle,
            style: TextStyle(
              fontSize: AppTextStyles.heading7.fontSize,
              fontWeight: FontWeight.w400,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
