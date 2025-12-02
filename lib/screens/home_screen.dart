import 'package:flutter/material.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/utils/colors.dart';
import 'package:home_ai/widgets/detections.dart';
import 'package:home_ai/widgets/user_details.dart';

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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                            text: "M  otion Detected",
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
              SizedBox(height: 40),
              Text(
                "Movement & Presence",
                style: TextStyle(
                  fontSize: AppTextStyles.heading5.fontSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 5,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 101,
                          width: 81,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.primary),
                          ),
                          child: Center(child: Image.asset(AppImages.add)),
                        ),
                        Text(
                          "Add New",
                          style: TextStyle(
                            fontSize: AppTextStyles.heading7.fontSize,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    UserDetails(
                      imageUrl: AppImages.mom,
                      title: "Mom",
                      subtitle: "Moving now",
                    ),
                    UserDetails(
                      imageUrl: AppImages.mom,
                      title: "Mom",
                      subtitle: "Moving now",
                    ),
                    UserDetails(
                      imageUrl: AppImages.mom,
                      title: "Mom",
                      subtitle: "Moving now",
                    ),
                    UserDetails(
                      imageUrl: AppImages.mom,
                      title: "Mom",
                      subtitle: "Moving now",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Row(
                children: [
                  Text(
                    "Camera",
                    style: TextStyle(
                      fontSize: AppTextStyles.heading5.fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "View All",
                    style: TextStyle(
                      fontSize: AppTextStyles.heading7.fontSize,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primary,
                    ),
                  ),
                  Icon(Icons.arrow_forward, color: AppColors.primary, size: 15),
                ],
              ),
              SizedBox(height: 20),
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      AppImages.livingRoom,
                      width: 364,
                      height: 237,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    left: 12,
                    right: 12,
                    bottom: 16,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 42,
                          width: 344,
                          decoration: BoxDecoration(
                            color: const Color(0xBF0F1A2E),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Living Room',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  '2 minutes ago',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.7),
                                    fontSize: 13,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        Positioned(
                          right: 10,
                          top: 0,
                          bottom: 0,
                          child: Container(
                            height: 30,
                            width: 29,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                            ),

                            child: Icon(
                              Icons.arrow_outward,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )


            ],
          ),
        ),
      ),
    );
  }
}
