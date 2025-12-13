import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/utils/colors.dart';
import 'package:home_ai/widgets/custom_button.dart';
import 'package:home_ai/widgets/shadow_textfield.dart';
import 'package:home_ai/widgets/title_subtitle_widget.dart';

class NameYourCameraScreen extends StatelessWidget {
  const NameYourCameraScreen({super.key});

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Icons.arrow_back, color: Colors.black),
                  ),
                  Text("Skip >>", style: AppTextStyles.heading7),
                ],
              ),
              SizedBox(height: 20),
              TitleSubtitleWidget(
                title: "Name Your Camera",
                subtitle:
                    "Give your camera a unique name so you can easily identify it.",
              ),
              SizedBox(height: 20),
              ShadowTextfield(
                imageUrl: AppImages.person,
                hintText: "Enter a custom name",
              ),
              SizedBox(height: 20),
              CustomButton(
                title: "Save Name",
                onPressed: () {
                  showCameraConnectedDialog(context);
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

  void showCameraConnectedDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(AppImages.bigCamera),
                const SizedBox(height: 20),
                Text(
                  "Camera Successfully Connected",
                  style: AppTextStyles.heading4,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  "Your device is now linked to Homo AI.",
                  style: AppTextStyles.heading7,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 25),
                CustomButton(
                  title: "Continue Setup",
                  backgroundColor: AppColors.primary,
                  textColor: Colors.white,
                  foregroundColor: Colors.white,
                  onPressed: () {
                    Get.back();  
                  },
                ),

                const SizedBox(height: 10),
                CustomButton(
                  title: "Rename Camera",
                  backgroundColor: AppColors.lightBlue,
                  textColor: AppColors.primary,
                  foregroundColor: AppColors.primary,
                  onPressed: () {
                    Get.back(); 
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
