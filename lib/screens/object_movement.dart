import 'package:flutter/material.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/widgets/location_detection.dart';
import 'package:home_ai/widgets/todays_activity.dart';
import 'package:home_ai/widgets/top_row.dart';
import 'package:home_ai/widgets/user_status.dart';

class ObjectMovement extends StatelessWidget {
  const ObjectMovement({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopRow(title: "Self", icon: Icons.arrow_back),
            UserStatus(userName: "Keys", status: "Moved",  imageUrl: AppImages.keys),
            SizedBox(height: 20), 
            Text("Object Moved From Living Room Sofa To Living Room Table", style: TextStyle(fontSize: AppTextStyles.heading7.fontSize),),
             LocationDetection(
                  backgroundImage: AppImages.livingRoom,
                  title: "Center Table",
                  subtitle: "Living room camera",
                  showTime: true,
                  showIcon: false,
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
                    imageUrl: AppImages.label,
                    title: "Person Detected - Front Door",
                    subtitle: "Kamran standing at front door",
                    time: "10:17 AM",
                  ),
                  SizedBox(height: 10),
                  TodaysActivity(
                    imageUrl: AppImages.label,
                    title: "Motion Detected - Kitchen",
                    subtitle: "Motion detected at main door",
                    time: "10:17 AM",
                  ),
                  SizedBox(height: 10),
                  Text("Yesterday", style: AppTextStyles.heading7),
                  SizedBox(height: 10),
                  TodaysActivity(
                    imageUrl: AppImages.label,
                    title: "Person Detected - Front Door",
                    subtitle: "Kamran standing at front door",
                    time: "10:17 AM",
                  ),
          ],
        ),
      ),
    ),
    );
  }
}
