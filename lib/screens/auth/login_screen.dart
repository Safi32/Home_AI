import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/screens/auth/reset_password.dart';
import 'package:home_ai/screens/on_boarding_screen.dart';
import 'package:home_ai/utils/colors.dart';
import 'package:home_ai/widgets/custom_button.dart';
import 'package:home_ai/widgets/custom_divider.dart';
import 'package:home_ai/widgets/custom_textfield.dart';
import 'package:home_ai/controller/login_controller.dart';
import 'package:home_ai/widgets/login_google.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginController controller = Get.put(LoginController());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final rememberMe = false.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Back Button
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Icon(Icons.arrow_back, color: Colors.black),
                ),
                SizedBox(height: 30),

                Center(child: SvgPicture.asset(AppImages.loginLogo)),
                SizedBox(height: 50),

                Text("Welcome Back", style: AppTextStyles.heading3),
                Text(
                  "Login to your account",
                  style: AppTextStyles.heading7.copyWith(color: Colors.grey),
                ),
                SizedBox(height: 40),
                CustomTextfield(
                  label: "Email",
                  hintText: "name@gmail.com",
                  icon: Icons.email_outlined,
                  controller: emailController,
                  obscureText: false,
                ),
                SizedBox(height: 20),
                CustomTextfield(
                  label: "Password",
                  hintText: "**********",
                  icon: Icons.lock_outline,
                  controller: passwordController,
                  obscureText: true,
                ),
                SizedBox(height: 12),
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: rememberMe.value,
                            onChanged: (val) => rememberMe.value = val ?? false,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            activeColor: Colors.blue,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
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
                        onPressed: () => Get.to(() => const ResetPassword()),
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
                ),

                SizedBox(height: 20),
                
                Obx(
                  () => CustomButton(
                    title: controller.isLoading.value
                        ? "Logging in..."
                        : "Continue",
                    backgroundColor: AppColors.primary,
                    textColor: Colors.white,
                    foregroundColor: Colors.white,
                    onPressed: () async {
                      if (emailController.text.isEmpty ||
                          passwordController.text.isEmpty) {}

                      bool success = await controller.loginUser(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      );

                      if (success) {
                        Get.offAll(() => OnBoardingScreen());
                      }
                    },
                  ),
                ),
                SizedBox(height: 20),
                CustomDivider(text: "Login with"),
                SizedBox(height: 20),
                LoginGoogle(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
