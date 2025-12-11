import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/screens/add_new_camera.dart';
import 'package:home_ai/utils/colors.dart';
import 'package:home_ai/widgets/device_management_widget.dart';
import 'package:home_ai/widgets/top_row.dart';

class DeviceManagementScreen extends StatelessWidget {
  const DeviceManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              TopRow(title: "Device Management", icon: Icons.arrow_back),
              SizedBox(height: 50),
              DeviceManagementWidget(
                onPressed: () {
                  Get.to(() => AddNewCamera());
                },
                width: 364,
                height: 70,
                imageUrl: AppImages.cctvRight,
                text: "Add New Camera",
                backgroundColor: AppColors.lightBlue,
                image: AppImages.addCamera,
                textStyle: AppTextStyles.heading5,
              ),
              SizedBox(height: 40),
              DeviceManagementWidget(
                onPressed: () {},
                height: 50,
                width: 364,
                imageUrl: AppImages.cctvRight,
                text: "Manage Existing Cameras",
                backgroundColor: Colors.white,
                textStyle: AppTextStyles.heading6,
              ),
              DeviceManagementWidget(
                onPressed: () {},
                height: 50,
                width: 364,
                imageUrl: AppImages.cameraLocation,
                text: "Camera Location",
                backgroundColor: Colors.white,
                textStyle: AppTextStyles.heading6,
              ),
              DeviceManagementWidget(
                onPressed: () {},
                height: 50,
                width: 364,
                imageUrl: AppImages.cameraSettings,
                text: "Camera Setting",
                backgroundColor: Colors.white,
                textStyle: AppTextStyles.heading6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
