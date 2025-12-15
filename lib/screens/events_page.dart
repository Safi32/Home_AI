import 'package:flutter/material.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/widgets/events_history_widgets.dart';
import 'package:home_ai/widgets/todays_activity.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {

    final GlobalKey _filterKey = GlobalKey();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 10,
                    children: [
                      EventsHistoryWidgets(
                        key: _filterKey,
                        onTap: () {
                          showFilterMenu(context, _filterKey);
                        },
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
  void showFilterMenu(BuildContext context, GlobalKey key) {
    final RenderBox renderBox =
        key.currentContext!.findRenderObject() as RenderBox;
    final Offset position = renderBox.localToGlobal(Offset.zero);
    final Size size = renderBox.size;

    showMenu(
      context: context,
      color: Colors.white,
      elevation: 6,
      position: RelativeRect.fromLTRB(
        position.dx,
        position.dy + size.height + 8,
        position.dx + size.width,
        0,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      items: [
        _menuItem("None", enabled: true),
        _menuItem("Person Events", enabled: true),
        _menuItem("Pet Events", enabled: false),
        _menuItem("Object Events", enabled: false),
        _menuItem("Intruder", enabled: false),
        _menuItem("Disaster & Environmental", enabled: false),
        _menuItem("Sound", enabled: false),
      ],
    );
  }

  PopupMenuItem _menuItem(String title, {required bool enabled}) {
    return PopupMenuItem(
      enabled: enabled,
      height: 42,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          color: enabled ? Colors.black : Colors.grey.shade400,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

}
