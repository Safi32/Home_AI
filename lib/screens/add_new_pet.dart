import 'package:flutter/material.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/utils/colors.dart';
import 'package:home_ai/widgets/alerts_widget.dart';
import 'package:home_ai/widgets/custom_button.dart';
import 'package:home_ai/widgets/name_widget.dart';
import 'package:home_ai/widgets/points_widget.dart';
import 'package:home_ai/widgets/shadow_textfield.dart';
import 'package:home_ai/widgets/title_subtitle_widget.dart';
import 'package:home_ai/widgets/upload_photo_widget.dart';

class AddNewPet extends StatelessWidget {
  const AddNewPet({super.key});

  @override
  Widget build(BuildContext context) {
    return   SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back, color: Colors.black),
                ),
                TitleSubtitleWidget(
                  title: "Add New Pet",
                  subtitle:
                      "Capture your pets so Homo AI can track them safely",
                ),
                SizedBox(height: 30),
                Center(child: UploadPhotoWidget()),
                SizedBox(height: 30),
                PointsWidget(
                  point1:
                      "Hold your pets still for a few seconds during scanning.",
                  point2: "Enter name of your pet below.",
                ),
                SizedBox(height: 30),
                NameWidget(name: "Pet Name"),
                ShadowTextfield(
                  imageUrl: AppImages.paw,
                  hintText: "Enter your pet's name",
                ),
                SizedBox(height: 20),
                AlertsWidget(
                  text:
                      "Get alerts when your pet moves or enters rooms",
                ),
                SizedBox(height: 20),
                CustomButton(
                  title: "Save Pet",
                  onPressed: () {},
                  backgroundColor: AppColors.primary,
                  textColor: Colors.white,
                  foregroundColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}