import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/screens/add_new.dart';
import 'package:home_ai/utils/colors.dart';
import 'package:home_ai/widgets/object_selection.dart';


class ObjectRecognition extends StatelessWidget {
  const ObjectRecognition({super.key});

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 18,
                    ),
                  ),
                  Text(
                    "Skip >>",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  "Object Recognition",
                  style: TextStyle(
                    fontSize: AppTextStyles.heading3.fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(
                "Select items for AI tracking, or add your own custom objects.",
                style: TextStyle(fontSize: AppTextStyles.heading7.fontSize),
                textAlign: TextAlign.center,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const AddNew());
                          },
                          child: Container(
                            height: 81,
                            width: 81,
                            decoration: BoxDecoration(
                              color: AppColors.lightBlue,
                              shape: BoxShape.circle,
                            ),
                            child: Center(child: Image.asset(AppImages.add)),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Add New",
                          style: TextStyle(
                            fontSize: AppTextStyles.heading7.fontSize,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    ObjectSelection(
                      imageUrl: AppImages.vehicle,
                      title: "Vehicle",
                    ),
                    SizedBox(width: 10),
                     ObjectSelection(
                      imageUrl: AppImages.newspaper,
                      title: "Newspaper",
                    ),
                    SizedBox(width: 10),
                     ObjectSelection(
                      imageUrl: AppImages.keys,
                      title: "Keys",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
