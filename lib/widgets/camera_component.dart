import 'package:flutter/material.dart';
import 'package:home_ai/constants/text_styles.dart';

class CameraComponent extends StatelessWidget {
  const CameraComponent({super.key, required this.imageUrl, required this.title});

  final String imageUrl;
  final String title;
  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 114,
      width: 130,
      child: Card(
        color: Colors.white,
        elevation: 1,
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imageUrl),
            Text(
              title,
              style: AppTextStyles.heading7.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
