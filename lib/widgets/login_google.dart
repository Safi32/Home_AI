import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/controller/login_controller.dart';
import 'package:home_ai/utils/colors.dart';

class LoginGoogle extends StatelessWidget {
  final VoidCallback? onSuccess;

  const LoginGoogle({super.key, this.onSuccess});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.find();
    
    return GestureDetector(
      onTap: () async {
        bool isLogged = await controller.login();
        if (isLogged) {
          debugPrint("Login successful");
          onSuccess?.call();
        } else {
          debugPrint("Login failed or cancelled");
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Google sign-in failed or was cancelled"),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Container(
        width: 364,
        height: 57,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.googleLogo),
            const SizedBox(width: 12),
            Text(
              "Continue with Google",
              style: TextStyle(
                color: AppColors.heading,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

}
