import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/widgets/custom_button.dart';
import 'package:home_ai/widgets/custom_textfield.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
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
                "Reset Your Passsword",
                style: TextStyle(
                  fontSize: AppTextStyles.heading3.fontSize,
                  fontWeight: AppTextStyles.heading3.fontWeight,
                ),
              ),

              Text(
                "Enter your registered email and we'll send you a secure reset link",
                style: AppTextStyles.heading7,
              ),
              SizedBox(height: 40),
              CustomTextfield(
                label: "Email",
                hintText: "name@example.com",
                icon: Icons.email_outlined,
                controller: (TextEditingController()),
                obscureText: true,
              ),
              SizedBox(height: 40),
              CustomButton(
                title: "Send Reset Link",
                onPressed: () {
                  // Get.to(() => const OtpScreen( email: email.text.r,));
                },
                backgroundColor: Colors.blue,
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
