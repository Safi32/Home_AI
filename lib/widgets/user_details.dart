import 'package:flutter/material.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/utils/colors.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({
    super.key,
    required this.imageUrl,
    this.title,
    this.subtitle,
    this.onPressed,
  });

  final String imageUrl;
  final String? title;
  final String? subtitle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            height: 101,
            width: 81,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
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
        ),

        if (title != null && title!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              title!,
              style: TextStyle(
                fontSize: AppTextStyles.heading7.fontSize,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),

        if (subtitle != null && subtitle!.isNotEmpty)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            margin: const EdgeInsets.only(top: 6),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Text(
              subtitle!,
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
