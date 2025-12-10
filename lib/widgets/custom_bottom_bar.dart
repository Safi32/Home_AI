import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/screens/ask_ai_screen.dart';
import 'package:home_ai/screens/events_page.dart';
import 'package:home_ai/screens/live_page.dart';
import 'package:home_ai/screens/notification_screen.dart';

import 'package:home_ai/utils/colors.dart';
import 'package:home_ai/widgets/my_side_menu.dart';
import '../constants/images.dart';
import '../screens/home_screen.dart';

class BottomBarController extends GetxController {
  RxInt currentIndex = 0.obs;
}

class CustomBottomBar extends StatelessWidget {
  final BottomBarController controller = Get.put(BottomBarController());
  final List<_BottomBarItem> items = const [
    _BottomBarItem(icon: AppImages.home, label: 'Home'),
    _BottomBarItem(icon: AppImages.playCircle, label: 'Live'),
    _BottomBarItem(icon: AppImages.timeFast, label: 'Events'),
    _BottomBarItem(icon: AppImages.sparkles, label: 'Ask AI'),
  ];

  final List<Widget> pages = [
    const HomeScreen(),
    LivePage(),
    const EventsPage(),
    const AskAiScreen(),
  ];

  CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: MySideMenu(),
        backgroundColor: Colors.white,
        body: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Builder(
                      builder: (context) {
                        return GestureDetector(
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                          },
                          child: Image.asset(AppImages.menu),
                        );
                      },
                    ),
                    controller.currentIndex.value == 0
                        ? SizedBox()
                        : controller.currentIndex.value == 1
                        ? Text("Live Cameras", style: AppTextStyles.heading5)
                        : controller.currentIndex.value == 2
                        ? Text(
                            "Events & History",
                            style: AppTextStyles.heading5,
                          )
                        : Text("Ask AI", style: AppTextStyles.heading5),
                    controller.currentIndex.value == 0
                        ? GestureDetector(
                            onTap: () {
                              Get.to(() => NotificationScreen());
                            },
                            child: Image.asset(AppImages.notification),
                          )
                        : controller.currentIndex.value == 1
                        ? Row(
                            children: [
                              Image.asset(AppImages.refresh),
                              SizedBox(width: 10),
                              Image.asset(
                                AppImages.settings,
                                height: 15,
                                width: 15,
                              ),
                            ],
                          )
                        : controller.currentIndex.value == 2
                        ? SizedBox()
                        : SizedBox(),
                  ],
                ),
              ),

              Expanded(child: pages[controller.currentIndex.value]),
              Container(
                decoration: BoxDecoration(color: Colors.white),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(items.length, (index) {
                    final item = items[index];
                    final bool isSelected =
                        controller.currentIndex.value == index;
                    return Expanded(
                      child: GestureDetector(
                        onTap: () => controller.currentIndex.value = index,
                        child: Container(
                          decoration: isSelected
                              ? BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(12),
                                )
                              : null,
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                item.icon,
                                width: 24,
                                height: 24,
                                color: isSelected
                                    ? Colors.white
                                    : AppColors.primary,
                              ),
                              if (item.label.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Text(
                                    item.label,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: isSelected
                                          ? Colors.white
                                          : AppColors.primary,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomBarItem {
  final String icon;
  final String label;
  const _BottomBarItem({required this.icon, required this.label});
}
