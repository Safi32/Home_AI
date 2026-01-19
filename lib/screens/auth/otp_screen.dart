import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/controller/registeration_controller.dart';
import 'package:home_ai/screens/on_boarding_screen.dart';
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

  Future<void> _verifyOtp() async {
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

    _controller.isLoading.value = true;

    try {
      bool success = await _controller.verifyOtp(email: widget.email, otp: otp);

      if (success) {
        Get.offAll(() => OnBoardingScreen());
        Get.snackbar(
          "Success",
          "Account verified successfully!",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      }
    } finally {
      _controller.isLoading.value = false;
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
                  child: !_controller.isLoading.value
                      ? Column(
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
                              widget.email,
                              style: AppTextStyles.heading7.copyWith(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 40),
                            OtpFields(
                              length: 4,
                              onChanged: (value) {
                                otp = value;
                                if (otp.length == 4) {
                                  _verifyOtp();
                                }
                              },
                            ),
                            const SizedBox(height: 40),
                            CustomButton(
                              title: "Verify & Continue",
                              onPressed: _verifyOtp,
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
                                      : () {
                                          Get.snackbar(
                                            "Info",
                                            "Resend OTP functionality will be implemented here",
                                            snackPosition: SnackPosition.TOP,
                                          );
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
                        )
                      : const SizedBox.shrink(),
                ),
              ),
              if (_controller.isLoading.value)
                const Center(child: CircularProgressIndicator(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
