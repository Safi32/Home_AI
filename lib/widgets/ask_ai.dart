import 'package:flutter/material.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/utils/colors.dart';

class AskAi extends StatelessWidget {
  const AskAi({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47,
      width: 119,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(AppImages.sparkles, height: 24, width: 24),
          Text(
            "Ask AI",
            style: AppTextStyles.heading5.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
