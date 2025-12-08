import 'package:flutter/material.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/widgets/events_history_widgets.dart';
import 'package:home_ai/widgets/todays_activity.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Image.asset(AppImages.menu)],
                    ),
                    Text(
                      "Events & History",
                      style: TextStyle(
                        fontSize: AppTextStyles.heading4.fontSize,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 10,
                    children: [
                      EventsHistoryWidgets(
                        imageUrl: AppImages.filter,
                        title: "Filter",
                      ),
                      EventsHistoryWidgets(
                        imageUrl: AppImages.calendar,
                        title: "Calendar",
                      ),
                      EventsHistoryWidgets(
                        imageUrl: AppImages.human,
                        title: "Self",
                      ),
                      EventsHistoryWidgets(
                        imageUrl: AppImages.human,
                        title: "Self",
                      ),
                      EventsHistoryWidgets(
                        imageUrl: AppImages.human,
                        title: "Self",
                      ),
                      EventsHistoryWidgets(
                        imageUrl: AppImages.human,
                        title: "Self",
                      ),
                      EventsHistoryWidgets(
                        imageUrl: AppImages.human,
                        title: "Self",
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Timeline",
                  style: AppTextStyles.heading6.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text("Today", style: AppTextStyles.heading7),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 20,
                  children: [
                    TodaysActivity(
                      imageUrl: AppImages.user,
                      title: "Person Detected - Living Room",
                      subtitle: "Ali detected moving in Living Room",
                      time: "5:31 PM",
                      backgroundColor: Colors.white,
                      enableShadow: true,
                    ),
                    TodaysActivity(
                      imageUrl: AppImages.user,
                      title: "Person Detected - Living Room",
                      subtitle: "Ali detected moving in Living Room",
                      time: "5:31 PM",
                      backgroundColor: Colors.white,
                      enableShadow: true,
                    ),
                    TodaysActivity(
                      imageUrl: AppImages.user,
                      title: "Person Detected - Living Room",
                      subtitle: "Ali detected moving in Living Room",
                      time: "5:31 PM",
                      backgroundColor: Colors.white,
                      enableShadow: true,
                    ),
                    Text("Yestartday"),
                    TodaysActivity(
                      imageUrl: AppImages.user,
                      title: "Person Detected - Living Room",
                      subtitle: "Ali detected moving in Living Room",
                      time: "5:31 PM",
                      backgroundColor: Colors.white,
                      enableShadow: true,
                    ),
                    TodaysActivity(
                      imageUrl: AppImages.user,
                      title: "Person Detected - Living Room",
                      subtitle: "Ali detected moving in Living Room",
                      time: "5:31 PM",
                      backgroundColor: Colors.white,
                      enableShadow: true,
                    ),
                    TodaysActivity(
                      imageUrl: AppImages.user,
                      title: "Person Detected - Living Room",
                      subtitle: "Ali detected moving in Living Room",
                      time: "5:31 PM",
                      backgroundColor: Colors.white,
                      enableShadow: true,
                    ),
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
