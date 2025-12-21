import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_ai/constants/api_constant.dart';
import 'package:http/http.dart' as http;


class EditProfileController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final RxBool isLoading = false.obs;

 
  bool _isValidEmail(String email) {
    return RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    ).hasMatch(email);
  }

  bool validate() {
    if (usernameController.text.trim().isEmpty) {
      _showError("Full name is required");
      return false;
    }

    if (emailController.text.trim().isEmpty) {
      _showError("Email is required");
      return false;
    }

    if (!_isValidEmail(emailController.text.trim())) {
      _showError("Enter a valid email address");
      return false;
    }

    if (passwordController.text.trim().length < 8) {
      _showError("Password must be at least 8 characters");
      return false;
    }

    return true;
  }

  Future<void> updateProfile() async {
    if (!validate()) return;

    try {
      isLoading.value = true;

      final response = await http.put(
        Uri.parse(ApiConstants.editProfile),
        headers: {
          "Content-Type": "application/json",
          // "Authorization": "Bearer YOUR_TOKEN"
        },
        body: jsonEncode({
          "name": usernameController.text.trim(),
          "email": emailController.text.trim(),
          "password": passwordController.text.trim(),
        }),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        _showSuccess(data["message"] ?? "Profile updated successfully");
      } else {
        _showError(data["message"] ?? "Update failed");
      }
    } catch (e) {
      _showError("Server error. Please try again");
    } finally {
      isLoading.value = false;
    }
  }

  void _showError(String message) {
    Get.snackbar(
      "Error",
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red.shade600,
      colorText: Colors.white,
      margin: const EdgeInsets.all(12),
      borderRadius: 8,
    );
  }

  void _showSuccess(String message) {
    Get.snackbar(
      "Success",
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green.shade600,
      colorText: Colors.white,
      margin: const EdgeInsets.all(12),
      borderRadius: 8,
    );
  }

  @override
  void onClose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
