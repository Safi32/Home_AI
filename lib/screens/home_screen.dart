import 'package:flutter/material.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/widgets/detections.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(AppImages.menu),
                  Image.asset(AppImages.notification),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                height: 80,
                width: 364,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Column(
                    spacing: 20,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Detections(
                            imageUrl1: AppImages.greenCircle,
                            imageUrl2: AppImages.grayCircle,
                            text: "4 Camera Online",
                          ),
                          Detections(
                            imageUrl1: AppImages.redCircle,
                            imageUrl2: AppImages.crossSmall,
                            text: "Kitchen Cam Offline",
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Detections(
                            imageUrl1: AppImages.yellowCircle,
                            imageUrl2: AppImages.polygon,
                            text: "Motion Detected",
                          ),
                          Detections(
                            imageUrl1: AppImages.blueCircle,
                            imageUrl2: AppImages.outline,
                            text: "No Recording",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text("Movement & Presence")
            ],
          ),
        ),
      ),
    );
  }
}
