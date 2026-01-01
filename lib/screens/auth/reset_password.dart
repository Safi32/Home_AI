// import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/get_navigation.dart';
// import 'package:home_ai/constants/text_styles.dart';
// import 'package:home_ai/widgets/custom_button.dart';
// import 'package:home_ai/widgets/custom_textfield.dart';

// class ResetPassword extends StatelessWidget {
//   const ResetPassword({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
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
//                 "Reset Your Passsword",
//                 style: TextStyle(
//                   fontSize: AppTextStyles.heading3.fontSize,
//                   fontWeight: AppTextStyles.heading3.fontWeight,
//                 ),
//               ),

//               Text(
//                 "Enter your registered email and we'll send you a secure reset link",
//                 style: AppTextStyles.heading7,
//               ),
//               SizedBox(height: 40),
//               CustomTextfield(
//                 label: "Email",
//                 hintText: "name@example.com",
//                 icon: Icons.email_outlined,
//                 controller: (TextEditingController()),
//               ),
//               SizedBox(height: 40),
//               CustomButton(
//                 title: "Verify Email",
//                 onPressed: () {
                  
//                 },
//                 backgroundColor: Colors.blue,
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
import 'package:home_ai/screens/auth/reset_password_otp_screen.dart';
import 'package:home_ai/utils/colors.dart';
import 'package:home_ai/widgets/custom_button.dart';
import 'package:home_ai/widgets/custom_textfield.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});

  final ResetPasswordController _controller = Get.put(ResetPasswordController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: const Icon(Icons.arrow_back, color: Colors.black),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Reset Your Password",
                        style: TextStyle(
                          fontSize: AppTextStyles.heading3.fontSize,
                          fontWeight: AppTextStyles.heading3.fontWeight,
                        ),
                      ),
                      Text(
                        "Enter your registered email and we'll send you a secure reset link",
                        style: AppTextStyles.heading7,
                      ),
                      const SizedBox(height: 40),
                      CustomTextfield(
                        label: "Email",
                        hintText: "name@example.com",
                        icon: Icons.email_outlined,
                        controller: _controller.emailController,
                      ),
                      const SizedBox(height: 40),
                      CustomButton(
                        title: "Verify Email",
                        onPressed: _controller.isLoading.value
                            ? () {}
                            : () async {
                                if (_controller.emailController.text.trim().isEmpty) {
                                  Get.snackbar(
                                    "Error",
                                    "Please enter your email",
                                    snackPosition: SnackPosition.TOP,
                                    backgroundColor: Colors.red,
                                    colorText: Colors.white,
                                  );
                                  return;
                                }

                                await _controller.sendOTP();
                                
                                if (_controller.isOTPSent.value) {
                                  Get.to(() => ResetPasswordOtpScreen());
                                }
                              },
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