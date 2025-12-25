import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_ai/constants/api_constant.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationController extends GetxController {
  var isLoading = false.obs;
  var otpSent = false.obs;

  Future<void> saveUserLocally({
    required String username,
    required String email,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    await prefs.setString('email', email);
  }

  Future<Map<String, String?>> getSavedUser() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      "username": prefs.getString('username'),
      "email": prefs.getString('email'),
    };
  }

  Future<bool> registerUser({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      if (username.isEmpty || email.isEmpty || password.isEmpty) {
        Get.snackbar(
          "Error",
          "Please fill in all fields",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return false;
      }

      if (!GetUtils.isEmail(email)) {
        Get.snackbar(
          "Error",
          "Please enter a valid email",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return false;
      }

      if (password.length < 6) {
        Get.snackbar(
          "Error",
          "Password must be at least 6 characters",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return false;
      }

      isLoading.value = true;

      final response = await http
          .post(
            Uri.parse(ApiConstants.register),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode({
              "username": username.trim(),
              "email": email.trim().toLowerCase(),
              "password": password,
            }),
          )
          .timeout(const Duration(seconds: 30));

      log("Register Response: ${response.body}");

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        /// SAVE USER LOCALLY HERE
        await saveUserLocally(
          username: username.trim(),
          email: email.trim().toLowerCase(),
        );

        otpSent.value = true;

        Get.snackbar(
          "Success",
          data["message"] ?? "OTP sent successfully",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        return true;
      } else {
        Get.snackbar(
          "Error",
          data["message"] ?? "Registration failed",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return false;
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Something went wrong",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  /* ---------------- VERIFY OTP ---------------- */

  Future<bool> verifyOtp({required String email, required String otp}) async {
    try {
      isLoading.value = true;

      final response = await http.post(
        Uri.parse(ApiConstants.verifyOTP),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "otp": otp}),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        Get.snackbar(
          "Success",
          data["message"] ?? "OTP Verified",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        return true;
      } else {
        Get.snackbar(
          "Error",
          data["message"] ?? "Invalid OTP",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return false;
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    } finally {
      isLoading.value = false;
    }
  }
}
