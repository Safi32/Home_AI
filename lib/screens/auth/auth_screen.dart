import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
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
      body: Center(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(AppImages.signUp, width: double.infinity,),
                Positioned(
                  bottom: 80,
                  left: 20,
                  child: Text(
                    "Your Home, \n Powered By Real-Time \n Intelligence",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  CustomButton(
                    title: "Log In",
                    onPressed: () {
                      Get.to(() => LoginScreen());
                    },
                    backgroundColor: AppColors.primary,
                    textColor: Colors.white,
                    foregroundColor: Colors.white,
                  ),
                  SizedBox(height: 12),
                  CustomButton(
                    title: "Sign Up",
                    onPressed: () {
                      Get.to(() => SignUpScreen());
                    }, 
                    backgroundColor: AppColors.background,
                    textColor: AppColors.primary,
                    foregroundColor: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
