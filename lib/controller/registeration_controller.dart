import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_ai/constants/api_constant.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class RegistrationController extends GetxController {
  var isLoading = false.obs;

  Future<bool> registerUser({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;

      final response = await http.post(
        Uri.parse(ApiConstants.register),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "username": username,
          "email": email,
          "password": password,
        }),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        Get.snackbar("Success", "Registration Successful",
            snackPosition: SnackPosition.TOP, backgroundColor: Colors.green, colorText: Colors.white);
        return true;  
      } else {
        final data = jsonDecode(response.body);
        Get.snackbar("Error", data["message"] ?? "Failed to register",
            snackPosition: SnackPosition.TOP, backgroundColor: Colors.red, colorText: Colors.white);
        return false;
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString(),
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.red, colorText: Colors.white);
      return false;
    } finally {
      isLoading.value = false;
    }
  }
}
