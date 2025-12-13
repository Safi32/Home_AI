import 'package:flutter/material.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/constants/text_styles.dart';

class ExistingCamera extends StatelessWidget {
  const ExistingCamera({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 94,
      width: 364,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            child: Image.asset(AppImages.personDetections),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Front Door",
                style: AppTextStyles.heading6.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "12 mintues ago",
                style: AppTextStyles.heading6.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text("Live"),
                  SizedBox(width: 30),
                  Image.asset(AppImages.greyWifi),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
