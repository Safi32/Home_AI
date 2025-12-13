import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/controller/live_controller.dart';
import 'package:home_ai/utils/colors.dart';
import 'package:home_ai/widgets/add_camera.dart';
import 'package:home_ai/widgets/live_detections.dart';
import 'package:home_ai/widgets/location_detection.dart';
import 'package:home_ai/widgets/user_watching.dart';

class LivePage extends StatelessWidget {
  LivePage({super.key});

  final LiveController controller = Get.put(LiveController());

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
                const SizedBox(height: 20),
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

                const SizedBox(height: 20),
                Stack(
                  children: [
                    LocationDetection(
                      backgroundImage: AppImages.livingRoom,
                      title: "Living Room",
                      subtitle: "2 minutes ago",
                      showTime: false,
                      showIcon: true,
                      icons: [
                        Image.asset(AppImages.blueFrame),
                        Image.asset(AppImages.sound),
                        Image.asset(AppImages.wifi),
                        Image.asset(AppImages.redVideo),
                        Image.asset(AppImages.live),
                      ],
                    ),

                    Positioned(
                      left: 10,
                      top: 12,
                      child: UserWatching(imageUrl: AppImages.human),
                    ),
                    Positioned(
                      left: 20,
                      top: 12,
                      child: UserWatching(imageUrl: AppImages.dog),
                    ),
                    Positioned(
                      left: 30,
                      top: 12,
                      child: UserWatching(imageUrl: AppImages.mom),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Column(
                  spacing: 10,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LiveDetections(imageUrl: AppImages.livingRoom),
                        LiveDetections(imageUrl: AppImages.backyard),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LiveDetections(imageUrl: AppImages.livingRoom),
                        AddCamera(),
                      ],
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
