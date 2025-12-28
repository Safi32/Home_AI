import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_ai/constants/api_constant.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class ResetPasswordController extends GetxController {
  final emailController = TextEditingController();
  final otpController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  var isLoading = false.obs;
  var isOTPSent = false.obs;
  var isOTPVerified = false.obs;

  Future<void> sendOTP() async {
    try {
      isLoading.value = true;

      final response = await http.post(
        Uri.parse(ApiConstants.sendOTP),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "email": emailController.text.trim(),
        }),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        isOTPSent.value = true;
        Get.snackbar(
          "Success",
          data['message'] ?? "OTP sent successfully",
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
        );
      } else {
        Get.snackbar(
          "Error",
          data['message'] ?? "Failed to send OTP",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Something went wrong",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> verifyOTP() async {
    try {
      isLoading.value = true;

      final response = await http.post(
        Uri.parse(ApiConstants.verifyOTP),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "email": emailController.text.trim(),
          "otp": otpController.text.trim(),
        }),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        isOTPVerified.value = true;
        Get.snackbar(
          "Success",
          data['message'] ?? "OTP verified",
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
        );
      } else {
        Get.snackbar(
          "Error",
          data['message'] ?? "Invalid OTP",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (e) {
      
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> resetPassword() async {
    if (newPasswordController.text != confirmPasswordController.text) {
      Get.snackbar("Error", "Passwords do not match");
      return;
    }

    try {
      isLoading.value = true;

      final response = await http.post(
        Uri.parse(ApiConstants.resetPassword),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "email": emailController.text.trim(),
          "newPassword": newPasswordController.text.trim(),
          "confirmPassword": confirmPasswordController.text.trim(),
        }),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        Get.snackbar(
          "Success",
          data['message'] ?? "Password reset successful",
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
        );
        clearFields();
        Get.offAllNamed('/login');
      } else {
        Get.snackbar(
          "Error",
          data['message'] ?? "Reset failed",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Something went wrong",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void clearFields() {
    emailController.clear();
    otpController.clear();
    newPasswordController.clear();
    confirmPasswordController.clear();
    isOTPSent.value = false;
    isOTPVerified.value = false;
  }

  @override
  void onClose() {
    emailController.dispose();
    otpController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
