import 'package:flutter/material.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/utils/colors.dart';

class CustomTextfield extends StatelessWidget {
  final String label;
  final String hintText;
  final IconData? icon;
  final TextEditingController? controller;
  final bool obscureText;
  final String? imageUrl;

  const CustomTextfield({
    super.key,
    required this.label,
    required this.hintText,
    this.icon,
    this.controller,
    this.obscureText = false,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 364,
      height: 57,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: AppColors.primary),
              imageUrl != null ? Image.asset(imageUrl!) : SizedBox.shrink(),
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
            color: Colors.grey.shade400,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.primary),
          ),
        ),
      ),
    );
  }
}
