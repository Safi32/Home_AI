import 'package:flutter/material.dart';
import 'package:home_ai/screens/object_tracking_screen.dart';
import 'package:home_ai/widgets/me_me_toggle_row_widget.dart';
import 'package:home_ai/widgets/top_row.dart';

class DetectionList extends StatelessWidget {
  const DetectionList({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              TopRow(title: "Detection Settings", icon: Icons.arrow_back),
              SizedBox(height: 20),
              MeMeToggleRow(
                title: "Enable Object Tracking",
                initialValue: false,
                onChanged: (value) {
                  if (value) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ObjectTrackingScreen(),
                      ),
                    );
                  }
                },
              ),
              MeMeToggleRow(
                title: "Save Movement History",
                initialValue: false,
                onChanged: (value) {},
              ),
              MeMeToggleRow(
                title: "Enable Alerts For Unrecognized\nObjects",
                initialValue: false,
                onChanged: (value) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
