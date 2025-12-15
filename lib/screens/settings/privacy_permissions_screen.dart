import 'package:flutter/material.dart';
import 'package:home_ai/widgets/me_me_toggle_row_widget.dart';
import 'package:home_ai/widgets/top_row.dart';

class PrivacyPermissionsScreen extends StatelessWidget {
  const PrivacyPermissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TopRow(title: 'Privacy & Permissions Settings', icon: Icons.arrow_back),
              SizedBox(height: 20,),
              MeMeToggleRow(
                title: 'Camera Permissions',
                subTitle: 'Allow This Device to Access Device Cameras',
                onChanged:(value) {} ,
              ),
              SizedBox(height: 20,),

               MeMeToggleRow(
                title: 'Microphone Permissions',
                subTitle: 'Require for Two Way Audio',
                onChanged:(value) {} ,
              ),
              SizedBox(height: 20,),

               MeMeToggleRow(
                title: 'Local Network Permissions',
          
                onChanged:(value) {} ,
              ),
              SizedBox(height: 20,),
               MeMeToggleRow(
                title: 'Notification Permissions',
                onChanged:(value) {} ,
              ),
            
            ],
          ),
        ),
      ),
    );
  }
}