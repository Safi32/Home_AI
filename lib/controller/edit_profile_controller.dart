import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_ai/constants/api_constant.dart';
import 'package:home_ai/utils/colors.dart';
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
    
    // Load saved profile image path
    loadProfileImage();
  }

  Future<void> loadProfileImage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedImagePath = prefs.getString('profile_image_path');
    if (savedImagePath != null && savedImagePath.isNotEmpty) {
      profileImagePath.value = savedImagePath;
    }
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
      final ImageSource? source = await showModalBottomSheet<ImageSource>(
        context: Get.context!,
        builder: (BuildContext context) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Gallery'),
                  onTap: () => Navigator.of(context).pop(ImageSource.gallery),
                ),
                ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: const Text('Camera'),
                  onTap: () => Navigator.of(context).pop(ImageSource.camera),
                ),
              ],
            ),
          );
        },
      );

      if (source != null) {
        final XFile? image = await _picker.pickImage(source: source);
        if (image != null) {
          profileImagePath.value = image.path;
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('profile_image_path', image.path);
        }
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

      // Show first letter of username if available, otherwise show 'U'
      final displayText = username.value.isNotEmpty
          ? username.value.substring(0, 1).toUpperCase()
          : 'U';

      return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.2),
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.primary, width: 1.5),
        ),
        child: Center(
          child: Text(
            displayText,
            style: TextStyle(
              fontSize: size * 0.4,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
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
