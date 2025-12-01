import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/controller/registeration_controller.dart';
import 'package:home_ai/screens/auth/otp_screen.dart';
import 'package:home_ai/utils/colors.dart';
import 'package:home_ai/widgets/custom_button.dart';
import 'package:home_ai/widgets/custom_divider.dart';
import 'package:home_ai/widgets/custom_textfield.dart';
import 'package:home_ai/widgets/login_google.dart';


class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final RegistrationController controller = Get.find<RegistrationController>();

  final fullName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  final agreed = false.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                GestureDetector(
                  onTap: () => Get.back(),
                  child: Icon(Icons.arrow_back, color: Colors.black),
                ),
                SizedBox(height: 20),

                Center(child: SvgPicture.asset(AppImages.loginLogo)),
                SizedBox(height: 30),

                Text("Create Your Account", style: AppTextStyles.heading3),
                Text(
                  "Sign up",
                  style: AppTextStyles.heading7.copyWith(color: Colors.grey),
                ),
                SizedBox(height: 30),

                Column(
                  spacing: 20,
                  children: [
                    CustomTextfield(
                      label: "Full Name",
                      hintText: "Saim",
                      icon: Icons.person,
                      controller: fullName,
                    ),
                    CustomTextfield(
                      label: "Email",
                      hintText: "name@gmail.com",
                      icon: Icons.email,
                      controller: email,
                    ),
                    CustomTextfield(
                      label: "Password",
                      hintText: "********",
                      icon: Icons.lock,
                      controller: password,
                      obscureText: true,
                    ),
                  ],
                ),

                SizedBox(height: 20),

                Obx(
                  () => Row(
                    children: [
                      Checkbox(
                        value: agreed.value,
                        onChanged: (_) => agreed.value = !agreed.value,
                      ),
                      Text(
                        "I agree to Terms & Privacy Policy",
                        style: AppTextStyles.heading7.copyWith(
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),

                SizedBox(height: 20),

                Obx(
                  () => CustomButton(
                    title: controller.isLoading.value
                        ? "Creating..."
                        : "Create Account",
                    backgroundColor: AppColors.primary,
                    textColor: Colors.white,
                    foregroundColor: Colors.white,

                    onPressed: () async {
                      if (!agreed.value) {}

                      bool success = await controller.registerUser(
                        username: fullName.text.trim(),
                        email: email.text.trim(),
                        password: password.text.trim(),
                      );

                      if (success) Get.to(() => const OtpScreen());
                    },
                  ),
                ),

                SizedBox(height: 20),
                CustomDivider(text: "SignUp With"),
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
