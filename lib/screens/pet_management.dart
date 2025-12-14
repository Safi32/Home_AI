import 'package:flutter/material.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/utils/colors.dart';
import 'package:home_ai/widgets/device_management_widget.dart';
import 'package:home_ai/widgets/objects.dart';
import 'package:home_ai/widgets/todays_activity.dart';
import 'package:home_ai/widgets/top_row.dart';

class PetManagement extends StatelessWidget {
  const PetManagement({super.key});

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
              TopRow(title: "Pet Management", icon: Icons.arrow_back),
              SizedBox(height: 20),
              DeviceManagementWidget(
                backgroundColor: AppColors.lightBlue,
                imageUrl: AppImages.paw,
                text: "Add New Pet",
                textStyle: AppTextStyles.heading6.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                height: 70,
                width: 364,
                onPressed: () {},
                image: AppImages.addCamera,
              ),
              SizedBox(height: 20),
              Text(
                "Object List",
                style: AppTextStyles.heading6.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: const [Objects(), Objects()],
              ),
              SizedBox(height: 40),
              Text(
                "Pet Movement Zones",
                style: AppTextStyles.heading6.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 40),
              Text(
                "Pet Activity Timeline",
                style: AppTextStyles.heading6.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20),
              Container(
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
                          "Movement Detected",
                          style: AppTextStyles.heading7.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Bruno walked by.",
                          style: AppTextStyles.heading6.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            SizedBox(width: 10),
                            Image.asset(AppImages.paw, color: Colors.black),
                            SizedBox(width: 20),
                            Text("10:17 AM"),
                            SizedBox(height: 20),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              TodaysActivity(
                imageUrl: AppImages.paw,
                title: "Movement Detected",
                subtitle: "Bruno walked by.",
                time: "10:17 AM",
                backgroundColor: Colors.white,
                enableShadow: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
