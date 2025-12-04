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

class AddNewPerson extends StatelessWidget {
  const AddNewPerson({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                  title: "Add New Person",
                  subtitle:
                      "Capture faces to get instant notifications when recognized",
                ),
                SizedBox(height: 30),
                Center(child: UploadPhotoWidget()),
                SizedBox(height: 30),
                PointsWidget(
                  point1: "Make sure faces are well-lit and clearly visible.",
                  point2: "Enter name of the person below.",
                ),
                SizedBox(height: 30),
                NameWidget(name: "Name"),
                ShadowTextfield(
                  imageUrl: AppImages.person,
                  hintText: "Enter the person's name",
                ),
                SizedBox(height: 20),
                AlertsWidget(
                  text:
                      "Receive notifications when this person is detected or moving",
                ),
                SizedBox(height: 20),
                CustomButton(
                  title: "Save Person",
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
