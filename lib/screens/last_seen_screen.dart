import 'package:flutter/material.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/utils/colors.dart';
import 'package:home_ai/widgets/alerts_widget.dart';
import 'package:home_ai/widgets/todays_activity.dart';
import 'package:home_ai/widgets/top_row.dart';
import 'package:home_ai/widgets/user_details.dart';

class LastSeenScreen extends StatelessWidget {
  const LastSeenScreen({super.key});

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
              TopRow(title: "Self", icon: Icons.arrow_back),
              SizedBox(height: 20),
              Row(
                children: [
                  UserDetails(imageUrl: AppImages.mom),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kamran Shah",
                        style: TextStyle(
                          fontSize: AppTextStyles.heading5.fontSize,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "•",
                            style: TextStyle(
                              fontSize: 18,
                              height: 1.2,
                              color: AppColors.alert,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "Last seen 10 mins ago",
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
                SizedBox(height: 20),
                Text(
                  "Local History",
                  style: TextStyle(
                    fontSize: AppTextStyles.heading7.fontSize,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10),
                Text("Today", style: AppTextStyles.heading7),
                SizedBox(height: 20),
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

                TodaysActivity(
                  imageUrl: AppImages.person,
                  title: "Person Detected - Front Door",
                  subtitle: "Kamran standing at front door",
                  time: "10:17 AM",
                ),
                  SizedBox(height: 10),
                Text("Notification", style: AppTextStyles.heading7),
                SizedBox(height: 10),
                AlertsWidget(
                  text:
                      "Receive notifications when this person is detected or moving",
                ),
            ],
          ),
        ),
      ),
    );
  }
}
