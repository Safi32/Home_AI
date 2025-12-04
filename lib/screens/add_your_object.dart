import 'package:flutter/material.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/utils/colors.dart';
import 'package:home_ai/widgets/custom_button.dart';
import 'package:home_ai/widgets/name_widget.dart';
import 'package:home_ai/widgets/points_widget.dart';
import 'package:home_ai/widgets/shadow_textfield.dart';
import 'package:home_ai/widgets/title_subtitle_widget.dart';
import 'package:home_ai/widgets/upload_photo_widget.dart';

class AddYourObject extends StatelessWidget {
  const AddYourObject({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back, color: Colors.black),
                ),
          
                TitleSubtitleWidget(
                  title: "Add Your Object",
                  subtitle:
                      "Upload a photo or scan the item so AI can recognize it across your cameras.",
                ),
                SizedBox(height: 10),
                Center(child: UploadPhotoWidget()),
                PointsWidget(
                  point1:
                      "Place the object in the frame. Make sure it's well lit.",
                ),
                NameWidget(name: "Object Name"),
                ShadowTextfield(
                  imageUrl: AppImages.label,
                  hintText: "e.g keys, car...",
                ),
                CustomButton(
                  title: "Save Object",
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
