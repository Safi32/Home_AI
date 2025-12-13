import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/screens/qr_code_screen.dart';
import 'package:home_ai/utils/colors.dart';
import 'package:home_ai/widgets/camera_component.dart';
import 'package:home_ai/widgets/custom_button.dart';
import 'package:home_ai/widgets/shadow_textfield.dart';
import 'package:home_ai/widgets/title_subtitle_widget.dart';

class AddNewCamera extends StatelessWidget {
  const AddNewCamera({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(Icons.arrow_back, color: Colors.black),
              ),
              SizedBox(height: 20),
              Center(
                child: TitleSubtitleWidget(
                  title: "Add New Camera",
                  subtitle: "Select a method to connect your camera to the app",
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CameraComponent(
                    imageUrl: AppImages.scanner,
                    title: "QR Code Scan",
                  ),
                  CameraComponent(
                    imageUrl: AppImages.blueWifi,
                    title: "Wi-Fi Setup",
                  ),
                ],
              ),
              SizedBox(height: 20),
              ShadowTextfield(
                imageUrl: AppImages.keyboard,
                hintText: "Enter Code Manually",
              ),
              SizedBox(height: 20),
              CustomButton(
                title: "Connect",
                onPressed: () {
                  Get.to(() => QrCodeScreen());
                },
                backgroundColor: AppColors.primary,
                textColor: Colors.white,
                foregroundColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
