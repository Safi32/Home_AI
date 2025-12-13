import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/utils/colors.dart';
import 'package:home_ai/widgets/custom_button.dart';
import 'package:home_ai/widgets/name_widget.dart';
import 'package:home_ai/widgets/shadow_textfield.dart';
import 'package:home_ai/widgets/title_subtitle_widget.dart';

class EditPerson extends StatelessWidget {
  const EditPerson({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              SizedBox(height: 30),
              TitleSubtitleWidget(
                title: "Edit Person Profile",
                subtitle:
                    "Update how this person is recognized and how alert are sent",
              ),
              SizedBox(height: 30),
              Center(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        AppImages.mom,
                        height: 263,
                        width: 309,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 39,
                      width: 150,
                      decoration: BoxDecoration(color: AppColors.lightBlue),
                      child: Center(
                        child: Text(
                          "Change Photo",
                          style: AppTextStyles.heading6.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              NameWidget(name: "Name"),
              SizedBox(height: 20),
              ShadowTextfield(imageUrl: AppImages.person, hintText: "Kamran"),
              SizedBox(height: 20),
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
