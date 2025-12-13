import 'package:flutter/material.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/utils/colors.dart';
import 'package:home_ai/widgets/circle_image.dart';
import 'package:home_ai/widgets/device_management_widget.dart';
import 'package:home_ai/widgets/top_row.dart';

class PersonManagementScreen extends StatelessWidget {
  const PersonManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopRow(title: "Person Management", icon: Icons.arrow_back),
              SizedBox(height: 20),
              DeviceManagementWidget(
                backgroundColor: AppColors.lightBlue,
                imageUrl: AppImages.person,
                text: "Add New Person",
                textStyle: AppTextStyles.heading6.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                height: 70,
                width: 364,
                onPressed: () {},
                image: AppImages.addCamera,
              ),
              SizedBox(height: 40),
              Text("Added Persons", style: AppTextStyles.heading6),
              SizedBox(height: 20),
              Column(
                children: [
                Row(
                  spacing: 10,
                  children: [
                    CircleImage(),
                    CircleImage(),
                  ],
                )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
