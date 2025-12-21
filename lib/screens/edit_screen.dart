import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/controller/edit_profile_controller.dart';
import 'package:home_ai/utils/colors.dart';
import 'package:home_ai/widgets/custom_button.dart';
import 'package:home_ai/widgets/custom_textfield.dart';
import 'package:home_ai/widgets/top_row.dart';

class EditScreen extends StatelessWidget {
  EditScreen({super.key});

  final EditProfileController controller = Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopRow(title: "Person Details", icon: Icons.arrow_back),

              const SizedBox(height: 30),

              /// Profile Avatar
              Center(
                child: Stack(
                  children: [
                    Container(
                      height: 79,
                      width: 84.25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFF113351)),
                      ),
                      alignment: Alignment.center,
                      child: const Text("KS"),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Image.asset(AppImages.takePicture),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),
              Text("Edit Profile", style: AppTextStyles.heading5),
              const SizedBox(height: 20),

              /// Form Fields
              CustomTextfield(
                controller: controller.usernameController,
                label: "Full Name",
                hintText: "Saim Ali Khan",
                imageUrl: AppImages.person,
              ),

              const SizedBox(height: 20),

              CustomTextfield(
                controller: controller.emailController,
                label: "Email",
                hintText: "name@gmail.com",
                imageUrl: AppImages.email,
              ),

              const SizedBox(height: 20),

              CustomTextfield(
                controller: controller.passwordController,
                label: "Password",
                hintText: "At least 8 characters",
                imageUrl: AppImages.lock,
                obscureText: true,
              ),

              const SizedBox(height: 30),

              /// Save Button
              Obx(
                () => CustomButton(
                  title: controller.isLoading.value
                      ? "Saving..."
                      : "Save Changes",
                  onPressed: () {
                    controller.isLoading.value
                        ? null
                        : controller.updateProfile;
                  },
                  backgroundColor: AppColors.primary,
                  textColor: Colors.white,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
