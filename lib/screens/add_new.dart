import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/screens/add_new_person.dart';
import 'package:home_ai/screens/add_new_pet.dart';
import 'package:home_ai/screens/object_recognition.dart';
import 'package:home_ai/widgets/add_new_widget.dart';

class AddNew extends StatelessWidget {
  const AddNew({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back, color: Colors.black),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Add New",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              Column(
                spacing: 10,
                children: [
                  AddNewWidget(
                    imageUrl: AppImages.person,
                    title: "Add Person",
                    onPressed: () {
                      Get.to(() => AddNewPerson());
                    },
                  ),
                  AddNewWidget(
                    imageUrl: AppImages.paw,
                    title: "Add Pet",
                    onPressed: () {
                      Get.to(() => AddNewPet());
                    },
                  ),
                  AddNewWidget(
                    imageUrl: AppImages.label,
                    title: "Add Object",
                    onPressed: () {
                      Get.to(() => ObjectRecognition(),);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
