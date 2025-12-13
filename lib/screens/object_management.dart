import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/screens/detection_list.dart';
import 'package:home_ai/utils/colors.dart';
import 'package:home_ai/widgets/device_management_widget.dart';
import 'package:home_ai/widgets/objects.dart';

import 'package:home_ai/widgets/top_row.dart';

class ObjectManagement extends StatelessWidget {
  const ObjectManagement({super.key});

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
              TopRow(title: "Object Management", icon: Icons.arrow_back),
              SizedBox(height: 20),
              DeviceManagementWidget(
                backgroundColor: AppColors.lightBlue,
                imageUrl: AppImages.label,
                text: "Add New Object",
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
                children: const [
                  Objects(),
                  Objects(),
                  Objects(),
                  Objects(),
                  Objects(),
                  Objects(),
                  Objects(),
                  Objects(),
                ],
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Get.to(() => DetectionList());
                },
                child: Text(
                  "Detection List",
                  style: AppTextStyles.heading6.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
