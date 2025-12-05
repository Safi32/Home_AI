import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/screens/camera_setting.dart';
import 'package:home_ai/widgets/ask_ai.dart';
import 'package:home_ai/widgets/todays_activity.dart';

class LocationHistory extends StatelessWidget {
  const LocationHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back, color: Colors.black),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const CameraSetting());
                    },
                    child: Icon(Icons.settings_outlined, color: Colors.black)),
                ],
              ),
            ),
            Stack(
              children: [
                Image.asset(AppImages.personDetection, fit: BoxFit.cover),
                Container(
                  height: 28,
                  width: 128,
                  decoration: BoxDecoration(color: Color(0xFF0F1A2E)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Location History',
                    style: TextStyle(
                      fontSize: AppTextStyles.heading6.fontSize,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Today",
                    style: TextStyle(
                      fontSize: AppTextStyles.heading7.fontSize,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 10),
                  TodaysActivity(
                    imageUrl: AppImages.person,
                    title: "Person Detected - Front Door",
                    subtitle: "Kamran standing at front door",
                    time: "10:17 AM",
                  ),
                  SizedBox(height: 10),
                  TodaysActivity(
                    imageUrl: AppImages.electric,
                    title: "Motion Detected - Kitchen",
                    subtitle: "Motion detected at main door",
                    time: "10:17 AM",
                  ),
                  SizedBox(height: 10),
                  Text("Yesterday", style: AppTextStyles.heading7),
                  SizedBox(height: 10),
                  TodaysActivity(
                    imageUrl: AppImages.person,
                    title: "Person Detected - Front Door",
                    subtitle: "Kamran standing at front door",
                    time: "10:17 AM",
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                  AskAi(),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
