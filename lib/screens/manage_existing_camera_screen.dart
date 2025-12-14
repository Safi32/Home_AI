import 'package:flutter/material.dart';
import 'package:home_ai/widgets/existing_camera.dart';
import 'package:home_ai/widgets/top_row.dart';

class ManageExistingCameraScreen extends StatelessWidget {
  const ManageExistingCameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              TopRow(title: "Manage Existing Cameras", icon: Icons.arrow_back),
              SizedBox(height: 40),
          Column(
            spacing: 20,
            children: [
          ExistingCamera(),
           ExistingCamera(),
           ExistingCamera(),
           ExistingCamera(),
           ExistingCamera(),
            ],
          )
            ],
          ),
        ),
      ),
    );
  }
}
