import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/utils/colors.dart';
import 'package:home_ai/widgets/custom_button.dart';
import 'package:home_ai/widgets/custom_divider.dart';
import 'package:home_ai/widgets/custom_textfield.dart';
import 'package:home_ai/widgets/login_google.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Icons.arrow_back, color: Colors.black),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Center(child: SvgPicture.asset(AppImages.loginLogo)),
              SizedBox(height: 50),
              Text("Welcome Back", style: AppTextStyles.heading3),
              Text(
                "Login to your account",
                style: AppTextStyles.heading7.copyWith(color: Colors.grey),
              ),
              SizedBox(height: 60),
              CustomTextfield(
                label: "Email",
                hintText: "name@gmail.com",
                icon: Icons.email_outlined,
              ),
              SizedBox(height: 20),
              CustomTextfield(
                label: "Password",
                hintText: "**********",
                icon: Icons.lock_outline,
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: rememberMe,
                        onChanged: (value) {
                          setState(() {
                            rememberMe = value ?? false;
                          });
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        activeColor: Colors.blue,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      Text(
                        'Remember me',
                        style: AppTextStyles.heading7.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size(0, 0),
                    ),
                    child: Text(
                      'Forgot password?',
                      style: AppTextStyles.heading7.copyWith(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              CustomButton(
                title: "Continue",
                onPressed: () {},
                backgroundColor: AppColors.primary,
                textColor: Colors.white,
                foregroundColor: Colors.white,
              ),
              SizedBox(height: 20),
              CustomDivider(text: "Login with",),
              SizedBox(height: 20),
              LoginGoogle(),
            ],
          ),
        ),
      ),
    );
  }
}
