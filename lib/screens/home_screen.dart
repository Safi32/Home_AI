import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/controller/events_controller.dart';
import 'package:home_ai/screens/add_new.dart';
import 'package:home_ai/screens/last_seen_screen.dart';
import 'package:home_ai/screens/object_movement.dart';
import 'package:home_ai/screens/person_movement.dart';
import 'package:home_ai/utils/colors.dart';
import 'package:home_ai/widgets/detections.dart';
import 'package:home_ai/widgets/live_detections.dart';
import 'package:home_ai/widgets/location_detection.dart';
import 'package:home_ai/widgets/row_widget.dart';
import 'package:home_ai/widgets/todays_activity.dart';
import 'package:home_ai/widgets/user_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final EventsController eventsController = Get.put(EventsController());

  @override
  void initState() {
    super.initState();
    eventsController.fetchCurrentEvents();
  }

  String _getEventImage(String eventType) {
    switch (eventType.toLowerCase()) {
      case 'person':
      case 'person detected':
        return AppImages.user;
      case 'motion':
      case 'movement':
        return AppImages.electric;
      case 'object':
      case 'object movement':
        return AppImages.keys;
      default:
        return AppImages.electric;
    }
  }

  String _formatTime(DateTime dateTime) {
    return "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
  }

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
                        onPressed: () {
                          Get.to(() => const ObjectMovement());
                        },
                        imageUrl: AppImages.keys,
                        title: "Keys",
                        subtitle: "Moved",
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
                  showTime: false,
                  showIcon: true,
                  icons: [
                    Image.asset(AppImages.frame),
                    Image.asset(AppImages.sound),
                    Image.asset(AppImages.wifi),
                    Image.asset(AppImages.video),
                    Image.asset(AppImages.live),
                  ],
                ),
                SizedBox(height: 30),
                RowWidget(
                  title: "Today's Activity",
                  subtitle: "See Full History",
                ),
                SizedBox(height: 20),
                Obx(() {
                  if (eventsController.isLoading.value) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (eventsController.currentEvents.isEmpty) {
                    return Column(
                      children: [
                        TodaysActivity(
                          imageUrl: AppImages.electric,
                          title: "No Current Events",
                          subtitle: "All systems are quiet",
                          time: "Now",
                        ),
                      ],
                    );
                  }

                  return Column(
                    spacing: 10,
                    children: eventsController.currentEvents.take(3).map((
                      event,
                    ) {
                      return TodaysActivity(
                        imageUrl: _getEventImage(event.eventType),
                        title:
                            "${event.eventType} - ${event.zone ?? 'Unknown'}",
                        subtitle: event.eventDescription,
                        time: _formatTime(event.createdAt),
                      );
                    }).toList(),
                  );
                }),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LiveDetections(
                      imageUrl: AppImages.livingRoom,
                      showDetections: false,
                    ),
                    LiveDetections(
                      imageUrl: AppImages.backyard,
                      showDetections: false,
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
