import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/controller/registeration_controller.dart';

import 'package:home_ai/screens/auth/create_new_password.dart';
import 'package:home_ai/utils/colors.dart';
import 'package:home_ai/widgets/custom_button.dart';
import 'package:home_ai/widgets/otp_fields.dart';

class OtpScreen extends StatefulWidget {
  final String email;
  const OtpScreen({super.key, required this.email});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final RegistrationController _controller = Get.put(RegistrationController());
  String otp = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => _controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Check Your Email",
                        style: TextStyle(
                          fontSize: AppTextStyles.heading3.fontSize,
                          fontWeight: AppTextStyles.heading3.fontWeight,
                        ),
                      ),
                      Text(
                        "A verification code has been sent to:",
                        style: AppTextStyles.heading7,
                      ),
                      Text(
                        widget.email,
                        style: AppTextStyles.heading7.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 60),
                      OtpFields(
                        length: 4,
                        onChanged: (value) {
                          otp = value;
                        },
                      ),
                      const SizedBox(height: 40),
                      CustomButton(
                        title: "Verify & Continue",
                        onPressed: () async {
                          if (otp.length < 4) {
                            Get.snackbar(
                              "Error",
                              "Please enter the 4-digit OTP",
                              snackPosition: SnackPosition.TOP,
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                            );
                            return;
                          }

                          bool success = await _controller.verifyOtp(
                            email: widget.email,
                            otp: otp,
                          );

                          if (success) {
                            Get.to(() => const CreateNewPassword());
                          }
                        },
                        backgroundColor: AppColors.primary,
                        textColor: Colors.white,
                        foregroundColor: Colors.white,
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Text(
                          "Resend Code in 30 Sec",
                          style: AppTextStyles.heading7.copyWith(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
