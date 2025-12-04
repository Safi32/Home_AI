import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/screens/add_new.dart';
import 'package:home_ai/screens/last_seen_screen.dart';
import 'package:home_ai/screens/person_movement.dart';
import 'package:home_ai/utils/colors.dart';
import 'package:home_ai/widgets/detections.dart';
import 'package:home_ai/widgets/live_detections.dart';
import 'package:home_ai/widgets/location_detection.dart';
import 'package:home_ai/widgets/row_widget.dart';
import 'package:home_ai/widgets/todays_activity.dart';
import 'package:home_ai/widgets/user_details.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
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
                    child: Wrap(
                      direction: Axis.horizontal,
                      runSpacing: 20,
                      spacing: 20,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 5,
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const AddNew());
                            },
                            child: Container(
                              height: 101,
                              width: 81,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: AppColors.primary),
                              ),
                              child: Center(child: Image.asset(AppImages.add)),
                            ),
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
                        onPressed: () {
                          Get.to(() => const LastSeenScreen());
                        },
                        imageUrl: AppImages.mom,
                        title: "Mom",
                        subtitle: "left 10 mins ago",
                      ),
                     
                      UserDetails(
                        onPressed: () {
                          Get.to(() => const PersonMovement());
                        },
                        imageUrl: AppImages.mom,
                        title: "Mom",
                        subtitle: "Moving now",
                      ),
                      UserDetails(
                        onPressed: () {},
                        imageUrl: AppImages.mom,
                        title: "Mom",
                        subtitle: "Moving now",
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                RowWidget(title: "Camera", subtitle: "View All"),
                SizedBox(height: 20),
                LocationDetection(
                  backgroundImage: AppImages.livingRoom,
                  title: "Living Room",
                  subtitle: "2 minutes ago",
                ),
                SizedBox(height: 30),
                RowWidget(
                  title: "Today's Activity",
                  subtitle: "See Full History",
                ),
                SizedBox(height: 20),
                Column(
                  spacing: 10,
                  children: [
                    TodaysActivity(
                      imageUrl: AppImages.user,
                      title: "Person Detected - Living Room",
                      subtitle: "Ali detected moving in Living Room",
                      time: "5:31 PM",
                    ),
                    TodaysActivity(
                      imageUrl: AppImages.electric,
                      title: "Person Detected - Living Room",
                      subtitle: "Ali detected moving in Living Room",
                      time: "10:17 AM",
                    ),
                    TodaysActivity(
                      imageUrl: AppImages.electric,
                      title: "Person Detected - Living Room",
                      subtitle: "Ali detected moving in Living Room",
                      time: "10:17 AM",
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LiveDetections(imageUrl: AppImages.livingRoom),
                    LiveDetections(imageUrl: AppImages.backyard),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
