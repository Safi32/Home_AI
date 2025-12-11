import 'package:flutter/material.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/utils/colors.dart';
import 'package:home_ai/widgets/custom_button.dart';
import 'package:home_ai/widgets/custom_textfield.dart';
import 'package:home_ai/widgets/top_row.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key});

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
              TopRow(title: "Person Details", icon: Icons.arrow_back),
              SizedBox(height: 30),
              Center(
                child: Stack(
                  children: [
                    Container(
                      height: 79,
                      width: 84.25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Color(0xFF113351)),
                      ),
                      child: Center(child: Text("KS")),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Image.asset(AppImages.takePicture),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Text("Edit Profile", style: AppTextStyles.heading5),
              SizedBox(height: 20),
              Column(
                spacing: 20,
                children: [
                  CustomTextfield(
                    label: "Full Name",
                    hintText: "Saim Ali Khan",
                    imageUrl: AppImages.person,
                  ),
                  CustomTextfield(
                    label: "Email",
                    hintText: "name@gmail.com",
                    imageUrl: AppImages.email,
                  ),
                  CustomTextfield(
                    label: "Password",
                    hintText: "at least 8 characters",
                    imageUrl: AppImages.lock,
                  ),
                  CustomTextfield(
                    label: "Phone Number",
                    hintText: "(1234)-5678901",
                    imageUrl: AppImages.phone,
                  ),
                ],
              ),
              SizedBox(height: 30),
              CustomButton(
                title: "Save Changes",
                onPressed: () {},
                backgroundColor: AppColors.primary,
                textColor: Colors.white,
                foregroundColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
