import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/screens/name_your_camera_screen.dart';
import 'package:home_ai/widgets/light_blue_button.dart';
import 'package:home_ai/widgets/points_widget.dart';
import 'package:home_ai/widgets/title_subtitle_widget.dart';

class QrCodeScreen extends StatelessWidget {
  const QrCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(Icons.arrow_back, color: Colors.black),
              ),
              SizedBox(height: 20),
              Center(
                child: TitleSubtitleWidget(
                  title: "Scan The QR Code",
                  subtitle:
                      "Point your phone at the QR Code on your Homo AI camera. Pairing will start automatically",
                ),
              ),
              SizedBox(height: 40),
              Center(child: Image.asset(AppImages.qrScanner)),
              SizedBox(height: 40),
              PointsWidget(
                point1: "Keep the QR code well-lit.",
                point2: "Hold the phone steady.",
              ),
              SizedBox(height: 40),
              LightBlueButton(
                text: "Enter Code Manually",
                onPressed: () {
                  Get.to(() => NameYourCameraScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
