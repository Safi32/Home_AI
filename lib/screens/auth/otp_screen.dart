import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/screens/auth/create_new_password.dart';
import 'package:home_ai/utils/colors.dart';
import 'package:home_ai/widgets/custom_button.dart';
import 'package:home_ai/widgets/otp_fields.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
              Text(
                "Check Your Email",
                style: TextStyle(
                  fontSize: AppTextStyles.heading3.fontSize,
                  fontWeight: AppTextStyles.heading3.fontWeight,
                ),
              ),

              Text(
                "A password reset link has been sent to :",
                style: AppTextStyles.heading7,
              ),
              Text(
                "Safiullah@gmail.com",
                style: AppTextStyles.heading7.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 60),
              OtpFields(length: 4, onChanged: (value) {}),
              SizedBox(height: 40),
              CustomButton(
                title: "Verify & Continue",
                onPressed: () {
                  Get.to(() => const CreateNewPassword());
                },
                backgroundColor: AppColors.primary,
                textColor: Colors.white,
                foregroundColor: Colors.white,
              ),
              SizedBox(height: 20),
              Center(
                child: Text("Resend Code in 30 Sec",
                  style: AppTextStyles.heading7.copyWith(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline
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
