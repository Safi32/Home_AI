import 'package:flutter/material.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/constants/text_styles.dart';

class Objects extends StatelessWidget {
  const Objects({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 65,
          width: 65,
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: ClipOval(
            child: Image.asset(
              AppImages.chair,
              height: 65,
              width: 65,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(
          "Chair",
          style: TextStyle(
            fontSize: AppTextStyles.heading7.fontSize,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
