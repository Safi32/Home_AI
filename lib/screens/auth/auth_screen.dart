import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/screens/auth/login_screen.dart';
import 'package:home_ai/screens/auth/sign_up_screen.dart';
import 'package:home_ai/utils/colors.dart';
import 'package:home_ai/widgets/custom_button.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              Image.asset(
                AppImages.signUp,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 80,
                left: 20,
                child: Text(
                  "Your Home,\nPowered By Real-Time\nIntelligence",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 40),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomButton(
                  title: "Log In",
                  onPressed: () => Get.to(() => LoginScreen()),
                  backgroundColor: AppColors.primary,
                  textColor: Colors.white,
                  foregroundColor: Colors.white,
                ),
                const SizedBox(height: 12),
                CustomButton(
                  title: "Sign Up",
                  onPressed: () => Get.to(() => SignUpScreen()),
                  backgroundColor: AppColors.background,
                  textColor: AppColors.primary,
                  foregroundColor: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
