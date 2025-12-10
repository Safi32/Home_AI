import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/controller/live_controller.dart';
import 'package:home_ai/utils/colors.dart';
import 'package:home_ai/widgets/notification_alert.dart';
import 'package:home_ai/widgets/notification_feed.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  final LiveController controller = Get.put(LiveController());

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
              Stack(
                alignment: Alignment.center,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(Icons.arrow_back, color: Colors.black),
                      ),
                    ],
                  ),
                  Text(
                    "Live Cameras",
                    style: TextStyle(
                      fontSize: AppTextStyles.heading4.fontSize,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 40,
                child: Obx(() {
                  final selected = controller.selectedIndex.value;
                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.tabs.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 10),
                    itemBuilder: (context, index) {
                      final isSelected = selected == index;
                      return GestureDetector(
                        onTap: () => controller.changeTab(index),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.primary
                                : const Color(0xFFF1F5F9),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              controller.tabs[index],
                              style: TextStyle(
                                color: isSelected
                                    ? Colors.white
                                    : Colors.black54,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
              SizedBox(height: 20),
              Text(
                "Important Alerts",
                style: AppTextStyles.heading5.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Column(
                spacing: 10,
                children: [NotificationAlert(), NotificationAlert()],
              ),
              SizedBox(height: 20),
              Text(
                "Notification Feed",
                style: AppTextStyles.heading5.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Column(
                spacing: 5,
                children: [
                  NotificationFeed(),
                  NotificationFeed(),
                  NotificationFeed(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
