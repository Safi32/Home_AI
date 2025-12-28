import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/controller/reset_password_controller.dart';
import 'package:home_ai/screens/auth/create_new_password.dart';
import 'package:home_ai/utils/colors.dart';
import 'package:home_ai/widgets/custom_button.dart';
import 'package:home_ai/widgets/otp_fields.dart';

class ResetPasswordOtpScreen extends StatelessWidget {
  ResetPasswordOtpScreen({super.key});

  final ResetPasswordController _controller = Get.find<ResetPasswordController>();

  Future<void> _verifyOtp() async {
    if (_controller.otpController.text.length < 4) {
      Get.snackbar(
        "Error",
        "Please enter the 4-digit OTP",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    await _controller.verifyOTP();

    if (_controller.isOTPVerified.value) {
      Get.to(() => CreateNewPassword());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
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
                        _controller.emailController.text,
                        style: AppTextStyles.heading7.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 40),
                      OtpFields(
                        length: 4,
                        onChanged: (value) {
                          _controller.otpController.text = value;
                          if (value.length == 4) {
                            _verifyOtp();
                          }
                        },
                      ),
                      const SizedBox(height: 40),
                      CustomButton(
                        title: "Verify & Continue",
                        onPressed: _controller.isLoading.value ? () {} : _verifyOtp,
                        backgroundColor: AppColors.primary,
                        textColor: Colors.white,
                        foregroundColor: Colors.white,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Didn't receive code? ",
                            style: AppTextStyles.heading7,
                          ),
                          GestureDetector(
                            onTap: _controller.isLoading.value
                                ? null
                                : () async {
                                    await _controller.sendOTP();
                                  },
                            child: Text(
                              "Resend",
                              style: AppTextStyles.heading7.copyWith(
                                color: _controller.isLoading.value
                                    ? Colors.grey
                                    : AppColors.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              if (_controller.isLoading.value)
                Container(
                  color: Colors.black.withOpacity(0.5),
                  child: const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
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