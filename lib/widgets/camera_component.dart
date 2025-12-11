import 'package:flutter/material.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/constants/text_styles.dart';

class CameraComponent extends StatelessWidget {
  const CameraComponent({super.key});

  

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
            Image.asset(AppImages.scanner),
            Text(
              "QR Code Scan",
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
