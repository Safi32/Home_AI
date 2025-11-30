import 'package:flutter/material.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/utils/colors.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({super.key, required this.label, required this.hintText, required this.icon});

  final String label;
  final String hintText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 364,
      height: 57,
      child: TextFormField(
        decoration: InputDecoration(
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: AppColors.primary),
              const SizedBox(width: 6),
              Text(
                label,
                style: AppTextStyles.heading6.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ],
          ),

          hintText: hintText,
          hintStyle: AppTextStyles.heading7.copyWith(
            color: Colors.grey.shade300,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.primary),
          ),
        ),
      ),
    );
  }
}
