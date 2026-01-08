import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/controller/session_controller.dart';
import 'package:home_ai/screens/auth/auth_screen.dart';
import 'package:home_ai/widgets/custom_bottom_bar.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    final session = SessionController.instance;
    Future.delayed(const Duration(seconds: 2), () async {
      await session.loadSession();
      if (session.hasValidSession) {
        Get.offAll(() => CustomBottomBar());
      } else {
        Get.offAll(() => const AuthScreen());
      }
    });
  }


 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(AppImages.splashScreen, fit: BoxFit.cover),
          Center(child: Image.asset(AppImages.logo)),
        ],
      ),
    );
  }
}
