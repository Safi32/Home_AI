import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/utils/colors.dart';

class TodaysActivity extends StatelessWidget {
  const TodaysActivity({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.time,
    this.backgroundColor,
    this.enableShadow = false,
  });

  final String imageUrl;
  final String title;
  final String subtitle;
  final String time;
  final Color? backgroundColor;
  final bool enableShadow;  

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 67,
      width: 364,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor ?? AppColors.lightBlue,
        boxShadow: enableShadow
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),

                  offset: const Offset(0, 4),
                ),
              ]
            : [],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Image.asset(imageUrl),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: AppTextStyles.heading7.fontSize,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(subtitle),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                children: [Text(time, style: const TextStyle(fontSize: 10))],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
