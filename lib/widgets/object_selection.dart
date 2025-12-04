import 'package:flutter/material.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/utils/colors.dart';

class ObjectSelection extends StatelessWidget {
  const ObjectSelection({super.key, required this.imageUrl, required this.title});

  final String imageUrl;
  final String title;
  

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.primary, width: 3),
              ),
              child: ClipOval(
                child: Image.asset(
                  imageUrl,
                  height: 81,
                  width: 81,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(right: 0, bottom: 3, child: Image.asset(AppImages.tick)),
          ],
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: AppTextStyles.heading7.fontSize,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
