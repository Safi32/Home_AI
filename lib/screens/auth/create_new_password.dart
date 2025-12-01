import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/utils/colors.dart';
import 'package:home_ai/widgets/custom_button.dart';
import 'package:home_ai/widgets/custom_textfield.dart';

class CreateNewPassword extends StatelessWidget {
  const CreateNewPassword({super.key});

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
                "Create New Password",
                style: TextStyle(
                  fontSize: AppTextStyles.heading3.fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Choose a strong password to secure your account.",
                style: AppTextStyles.heading7,
              ),

              SizedBox(height: 40),
              CustomTextfield(
                label: "New Password",
                hintText: "at least 8 characters",
                icon: Icons.lock_outline,
                controller: (TextEditingController()),
                obscureText: true,
              ),
              SizedBox(height: 20),
              CustomTextfield(
                label: "Confirm Password",
                hintText: "*********",
                icon: Icons.lock_outline,
                 controller: (TextEditingController()),
                obscureText: true,
              ),
              SizedBox(height: 40),
              CustomButton(
                title: "Save New Password",
                onPressed: () {},
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
