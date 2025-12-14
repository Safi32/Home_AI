import 'package:flutter/material.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/widgets/me_me_toggle_row_widget.dart';
import 'package:home_ai/widgets/top_row.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopRow(title: "Alert Center", icon: Icons.arrow_back),
            const SizedBox(height: 20),
            Text("Standard Alerts",
            style: AppTextStyles.heading6.copyWith(
              fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
             MeMeToggleRow(
                title: "Motion",
                initialValue: false,
                onChanged: (value) {},
              ),
               MeMeToggleRow(
                title: "Sound",
                initialValue: false,
                onChanged: (value) {},
              ),
               MeMeToggleRow(
                title: "Door/Window Entry",
                initialValue: false,
                onChanged: (value) {},
              ),
               MeMeToggleRow(
                title: "Face Detection",
                initialValue: false,
                onChanged: (value) {},
              ),
               MeMeToggleRow(
                title: "Package Detection",
                initialValue: false,
                onChanged: (value) {},
              ),
              SizedBox(height: 40,),
               MeMeToggleRow(
                title: "Object Movment Alerts\nNotify When Object Moved",
                initialValue: false,
                onChanged: (value) {},
              ),
              SizedBox(height: 30,),
                 MeMeToggleRow(
                title: "Pet Movment Alerts\nNotify When Pet Enters Restricted Area",
                initialValue: false,
                onChanged: (value) {},
              ),
          ],
        ),
      ),
    ),);
  }
}
