import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:home_ai/constants/api_constant.dart';
import 'package:home_ai/controller/session_controller.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;



class LoginController extends GetxController {
  var isLoading = false.obs;

  final GetStorage storage = GetStorage();
  final session = SessionController.instance;

  Future<bool> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;

      final response = await http.post(
        Uri.parse(ApiConstants.login),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "password": password}),
      );

      if (response.statusCode == 200) {
        
        final data = jsonDecode(response.body);
        session.saveSession(
          data["user"]["id"].toString(),
          data["token"],
          DateTime.now().add(Duration(minutes: 60)),
        );

        Get.snackbar(
          "Success",
          "Login Successful",
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.green,
        );

        return true;
      } else {
        final data = jsonDecode(response.body);
        Get.snackbar(
          "Error",
          data["message"] ?? "Login failed",
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.red,
        );
        return false;
      }
    } catch (e) {
      Get.snackbar(
        "Exception",
        e.toString(),
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  bool isLoggedIn() {
    final token = storage.read("token");
    return token != null;
  }

  Future<void> logout() async {
    await storage.remove("token");
    await storage.remove("user");
    Get.snackbar(
      "Success",
      "Logged out successfully",
      snackPosition: SnackPosition.TOP,
    );
  }

  String? getToken() => storage.read("token");
  Map<String, dynamic>? getUser() => storage.read("user");
}
