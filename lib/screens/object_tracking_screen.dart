import 'package:flutter/material.dart';
import 'package:home_ai/widgets/me_me_toggle_row_widget.dart';
import 'package:home_ai/widgets/top_row.dart';

class ObjectTrackingScreen extends StatelessWidget {
  const ObjectTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
             TopRow(title: "Detection Settings", icon: Icons.arrow_back),
                SizedBox(height: 20),
                MeMeToggleRow(
                  title: "Enable Object Tracking",
                  initialValue: true,
                  onChanged: (value) {
                  },
                ),
          ],
        ),
      ),
      ));
  }
}
