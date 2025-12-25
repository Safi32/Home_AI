import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_ai/constants/api_constant.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';


class EditProfileController extends GetxController {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final username = ''.obs;
  final email = ''.obs;
  final isLoading = false.obs;
  final profileImagePath = ''.obs;

  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();

    loadSavedUser();

    usernameController.addListener(() {
      username.value = usernameController.text.trim();
    });

    emailController.addListener(() {
      email.value = emailController.text.trim();
    });
  }

  Future<void> loadSavedUser() async {
    final prefs = await SharedPreferences.getInstance();

    final savedUsername = prefs.getString('username') ?? '';
    final savedEmail = prefs.getString('email') ?? '';

    usernameController.text = savedUsername;
    emailController.text = savedEmail;

    username.value = savedUsername;
    email.value = savedEmail;

    print("Prefilled Username: $savedUsername");
    print("Prefilled Email: $savedEmail");
  }

  Future<void> pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        profileImagePath.value = image.path;
      }
    } catch (e) {
      _showError('Failed to pick image');
    }
  }

  Widget getProfileImage({double size = 60}) {
    return Obx(() {
      if (profileImagePath.value.isNotEmpty) {
        return ClipOval(
          child: Image.file(
            File(profileImagePath.value),
            width: size,
            height: size,
            fit: BoxFit.cover,
          ),
        );
      }

      return ClipOval(
        child: Image.asset(
          'assets/images/human.png',
          width: size,
          height: size,
          fit: BoxFit.cover,
        ),
      );
    });
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  bool validate() {
    if (username.value.isEmpty) {
      _showError("Full name is required");
      return false;
    }

    if (email.value.isEmpty) {
      _showError("Email is required");
      return false;
    }

    if (!_isValidEmail(email.value)) {
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
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "name": username.value,
          "email": email.value,
          "password": passwordController.text.trim(),
        }),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        _showSuccess(data["message"] ?? "Profile updated successfully");
      } else {
        _showError(data["message"] ?? "Update failed");
      }
    } catch (_) {
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
