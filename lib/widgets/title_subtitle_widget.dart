import 'package:flutter/material.dart';
import 'package:home_ai/constants/text_styles.dart';

class TitleSubtitleWidget extends StatelessWidget {
  const TitleSubtitleWidget({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: AppTextStyles.heading3.fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text(
          subtitle,
          style: TextStyle(fontSize: AppTextStyles.heading7.fontSize),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
