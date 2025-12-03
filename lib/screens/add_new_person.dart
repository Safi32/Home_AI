import 'package:flutter/material.dart';
import 'package:home_ai/constants/images.dart';

import 'package:home_ai/widgets/person_pet_widget.dart';

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
            child: PersonPetWidget(
              title: "Add New Person",
              subtitle:
                  "Capture faces to get instant notifications when recognized",
              point1: "Make sure faces are well-lit and cleary visible.",
              point2: "Enter name of the person below.",
              name: "Name",
              imageUrl: AppImages.person,
              hintText: "Enter the person’s name",
              text:
                  "Receive notifications when this person is detected or moving.",
              btnText: "Save Person",
            ),
          ),
        ),
      ),
    );
  }
}
