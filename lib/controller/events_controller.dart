import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_ai/constants/api_constant.dart';
import 'package:home_ai/modal/event_model.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class EventsController extends GetxController {
  var isLoading = false.obs;
  var currentEvents = <Event>[].obs;
  var allEvents = <Event>[].obs;
  var errorMessage = RxnString();

  // Fetch current events only
  Future<void> fetchCurrentEvents() async {
    try {
      isLoading.value = true;
      errorMessage.value = null;

      final response = await http.get(
        Uri.parse('${ApiConstants.events}?current_only=true&limit=100'),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        currentEvents.value = data.map((json) => Event.fromJson(json)).toList();
      } else {
        errorMessage.value = "Failed to fetch current events";
        Get.snackbar(
          "Error",
          errorMessage.value!,
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.red,
        );
      }
    } catch (e) {
      errorMessage.value = e.toString();
      Get.snackbar(
        "Exception",
        e.toString(),
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Fetch all events
  Future<void> fetchAllEvents() async {
    try {
      isLoading.value = true;
      errorMessage.value = null;

      final response = await http.get(
        Uri.parse('${ApiConstants.events}?limit=100'),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        allEvents.value = data.map((json) => Event.fromJson(json)).toList();
      } else {
        errorMessage.value = "Failed to fetch all events";
        Get.snackbar(
          "Error",
          errorMessage.value!,
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.red,
        );
      }
    } catch (e) {
      errorMessage.value = e.toString();
      Get.snackbar(
        "Exception",
        e.toString(),
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Refresh both current and all events
  Future<void> refreshEvents() async {
    await Future.wait([
      fetchCurrentEvents(),
      fetchAllEvents(),
    ]);
  }

  // Get current events count
  int getCurrentEventsCount() {
    return currentEvents.length;
  }

  // Get events by zone
  List<Event> getEventsByZone(String zone) {
    return allEvents.where((event) => event.zone == zone).toList();
  }

  // Get current events by zone
  List<Event> getCurrentEventsByZone(String zone) {
    return currentEvents.where((event) => event.zone == zone).toList();
  }

  void clearEvents() {
    currentEvents.clear();
    allEvents.clear();
  }
}
