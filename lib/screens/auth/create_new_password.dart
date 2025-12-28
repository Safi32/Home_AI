// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/get_navigation.dart';
// import 'package:home_ai/constants/text_styles.dart';
// import 'package:home_ai/utils/colors.dart';
// import 'package:home_ai/widgets/custom_button.dart';
// import 'package:home_ai/widgets/custom_textfield.dart';

// class CreateNewPassword extends StatelessWidget {
//   const CreateNewPassword({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   Get.back();
//                 },
//                 child: Icon(Icons.arrow_back, color: Colors.black),
//               ),
//               SizedBox(height: 20),
//               Text(
//                 "Create New Password",
//                 style: TextStyle(
//                   fontSize: AppTextStyles.heading3.fontSize,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Text(
//                 "Choose a strong password to secure your account.",
//                 style: AppTextStyles.heading7,
//               ),

//               SizedBox(height: 40),
//               CustomTextfield(
//                 label: "New Password",
//                 hintText: "at least 8 characters",
//                 icon: Icons.lock_outline,
//                 controller: (TextEditingController()),
//                 obscureText: true,
//               ),
//               SizedBox(height: 20),
//               CustomTextfield(
//                 label: "Confirm Password",
//                 hintText: "*********",
//                 icon: Icons.lock_outline,
//                  controller: (TextEditingController()),
//                 obscureText: true,
//               ),
//               SizedBox(height: 40),
//               CustomButton(
//                 title: "Save New Password",
//                 onPressed: () {},
//                 backgroundColor: AppColors.primary,
//                 textColor: Colors.white,
//                 foregroundColor: Colors.white,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/controller/reset_password_controller.dart';
import 'package:home_ai/utils/colors.dart';
import 'package:home_ai/widgets/custom_button.dart';
import 'package:home_ai/widgets/custom_textfield.dart';

class CreateNewPassword extends StatelessWidget {
  CreateNewPassword({super.key});

  final ResetPasswordController _controller = Get.find<ResetPasswordController>();

  Future<void> _resetPassword() async {
    if (_controller.newPasswordController.text.trim().isEmpty) {
      Get.snackbar(
        "Error",
        "Please enter a new password",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    if (_controller.newPasswordController.text.length < 8) {
      Get.snackbar(
        "Error",
        "Password must be at least 8 characters",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    if (_controller.confirmPasswordController.text.trim().isEmpty) {
      Get.snackbar(
        "Error",
        "Please confirm your password",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    if (_controller.newPasswordController.text != _controller.confirmPasswordController.text) {
      Get.snackbar(
        "Error",
        "Passwords do not match",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    await _controller.resetPassword();
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
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: const Icon(Icons.arrow_back, color: Colors.black),
                      ),
                      const SizedBox(height: 20),
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
                      const SizedBox(height: 40),
                      CustomTextfield(
                        label: "New Password",
                        hintText: "at least 8 characters",
                        icon: Icons.lock_outline,
                        controller: _controller.newPasswordController,
                        obscureText: true,
                      ),
                      const SizedBox(height: 20),
                      CustomTextfield(
                        label: "Confirm Password",
                        hintText: "*********",
                        icon: Icons.lock_outline,
                        controller: _controller.confirmPasswordController,
                        obscureText: true,
                      ),
                      const SizedBox(height: 40),
                      CustomButton(
                        title: "Save New Password",
                        onPressed: _controller.isLoading.value ? () {} : _resetPassword,
                        backgroundColor: AppColors.primary,
                        textColor: Colors.white,
                        foregroundColor: Colors.white,
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