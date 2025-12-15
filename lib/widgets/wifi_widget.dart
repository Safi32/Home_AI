import 'package:flutter/material.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/constants/text_styles.dart';

class WifiWidget extends StatelessWidget {
  const WifiWidget({super.key, required this.text, required this.color, required this.onPressed});

  final String text;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Row(
            children: [
              Image.asset(AppImages.wifiLock, color: color),
              SizedBox(width: 20),
              Text(
                text,
                style: AppTextStyles.heading6.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Divider(thickness: 1.0, color: Colors.grey.shade300),
      ],
    );
  }
}
