import 'package:flutter/material.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/utils/colors.dart';

class PrivacyToggle extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final bool value;
  final Function(bool)? onChanged;

  const PrivacyToggle({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    this.onChanged,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imageUrl),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               
                Text(
                  title,
                  style: TextStyle(
                    fontSize: AppTextStyles.heading4.fontSize,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 13, color: Colors.black54),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeThumbColor: AppColors.primary,
          ),
        ],
      ),
    );
  }
}
