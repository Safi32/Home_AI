import 'package:flutter/material.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/widgets/person_pet_widget.dart';

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
            child: PersonPetWidget(
              title: "Add New Pet",
              subtitle:
                  "Capture your pets so Homo AI can track them safely",
              point1: "Hold your pet still for a few seconds during scanning.",
              point2: "Enter name of your pet below.",
              name: "Pet Name",
              imageUrl: AppImages.paw,
              hintText: "Enter your pet’s name",
              text:
                  "Get alerts when your pet moves or enters rooms.",
              btnText: "Save Pet",
            ),
          ),
        ),
      ),
    );
  }
}