import 'package:flutter/material.dart';

import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/utils/colors.dart';

class TodaysActivity extends StatelessWidget {
  const TodaysActivity({super.key, required this.imageUrl, required this.title, required this.subtitle, required this.time});

  final String imageUrl;
  final String title;
  final String subtitle;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 67,
      width: 364,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.lightBlue,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Image.asset(imageUrl),
            SizedBox(width: 10),
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
                SizedBox(height: 4),
                Text(subtitle),
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                children: [Text(time, style: TextStyle(fontSize: 10))],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
