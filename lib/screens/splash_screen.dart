
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/controller/session_controller.dart';
import 'package:home_ai/screens/auth/auth_screen.dart';
import 'package:home_ai/screens/home_screen.dart';


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
      if (session.userId != null &&
          session.token != null &&
          session.expiryDate != null &&
          session.expiryDate!.isAfter(DateTime.now())) {
        Get.offAll(() => const HomeScreen());
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
