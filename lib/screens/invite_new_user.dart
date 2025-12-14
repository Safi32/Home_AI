import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/utils/colors.dart';
import 'package:home_ai/widgets/custom_button.dart';
import 'package:home_ai/widgets/custom_textfield.dart';

class InviteNewUser extends StatelessWidget {
  const InviteNewUser({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(Icons.arrow_back, color: Colors.black),
              ),
              SizedBox(height: 20),
              Text("Invite New User", style: AppTextStyles.heading5),
              SizedBox(height: 10),
              Text(
                "Add a new member and define what they can access.",
                style: AppTextStyles.heading7,
              ),
              SizedBox(height: 40),
              CustomTextfield(
                label: "Full Name",
                hintText: "Saim Ali Khan",
                imageUrl: AppImages.person,
              ),
              SizedBox(height: 20),
              CustomTextfield(
                label: "Email",
                hintText: "name@example.com",
                imageUrl: AppImages.email,
              ),
              SizedBox(height: 20),
              Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text(
      "Permission Level",
      style: AppTextStyles.heading6.copyWith(
        fontWeight: FontWeight.w600,
      ),
    ),
    Container(
      height: 28,
      width: 115,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isDense: true,
          value: 'Admin', // You can make this a state variable if needed
          icon: const Icon(Icons.arrow_drop_down, 
                 size: 20, 
                 color: Colors.black),
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black,
          ),
          items: <String>['Admin', 'Super Admin'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextStyle(fontSize: 12),
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            // Handle permission change
          },
        ),
      ),
    ),
  ],
),
              SizedBox(height: 40),
              CustomButton(
                title: "Send Invite",
                onPressed: () {},
                backgroundColor: AppColors.primary,
                textColor: AppColors.white,
                foregroundColor: AppColors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
