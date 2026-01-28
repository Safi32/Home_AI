import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/controller/events_controller.dart';
import 'package:home_ai/widgets/events_history_widgets.dart';
import 'package:home_ai/widgets/todays_activity.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  final EventsController eventsController = Get.find<EventsController>();

  @override
  void initState() {
    super.initState();
    eventsController.fetchAllEvents();
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

  String _formatDate(DateTime dateTime) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final eventDate = DateTime(dateTime.year, dateTime.month, dateTime.day);

    if (eventDate == today) {
      return "Today";
    } else if (eventDate == today.subtract(Duration(days: 1))) {
      return "Yesterday";
    } else {
      return "${dateTime.day}/${dateTime.month}/${dateTime.year}";
    }
  }

  String _formatTime(DateTime dateTime) {
    return "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
  }

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
                Obx(() {
                  if (eventsController.isLoading.value) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (eventsController.allEvents.isEmpty) {
                    return Column(
                      children: [
                        TodaysActivity(
                          imageUrl: AppImages.user,
                          title: "No Events Found",
                          subtitle: "No events have been recorded",
                          time: "Now",
                          backgroundColor: Colors.white,
                          enableShadow: true,
                        ),
                      ],
                    );
                  }

                  // Group events by date
                  final Map<String, List<dynamic>> eventsByDate = {};
                  for (var event in eventsController.allEvents) {
                    final dateKey = _formatDate(event.createdAt);
                    if (!eventsByDate.containsKey(dateKey)) {
                      eventsByDate[dateKey] = [];
                    }
                    eventsByDate[dateKey]!.add(event);
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 20,
                    children: eventsByDate.entries.map((entry) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(entry.key, style: AppTextStyles.heading7),
                          ...entry.value
                              .map(
                                (event) => TodaysActivity(
                                  imageUrl: _getEventImage(event.eventType),
                                  title:
                                      "${event.eventType} - ${event.zone ?? 'Unknown'}",
                                  subtitle: event.eventDescription,
                                  time: _formatTime(event.createdAt),
                                  backgroundColor: Colors.white,
                                  enableShadow: true,
                                ),
                              )
                              .toList(),
                        ],
                      );
                    }).toList(),
                  );
                }),
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
