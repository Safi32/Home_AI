import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/screens/settings/select_camera_screen.dart';
import 'package:home_ai/utils/colors.dart';
import 'package:home_ai/widgets/custom_button.dart';
import 'package:home_ai/widgets/custom_space_tile.dart';
import 'package:home_ai/widgets/light_blue_button.dart';
import 'package:home_ai/widgets/top_row.dart';

class DeviceTechnicalInfoSettings extends StatelessWidget {
  const DeviceTechnicalInfoSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopRow(title: 'Device Technical Info', icon: Icons.arrow_back),
                SizedBox(height: 30),
                Text('Firmware & Updates', style: AppTextStyles.heading5),
                SizedBox(height: 30),
                customSpaceTile(leading: 'Current Version', trailing: 'X.X.X'),
                SizedBox(height: 5),
                customSpaceTile(
                  leading: 'Status Indicator',
                  trailing: '🟢 Up to Date',
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: 170,
                  child: LightBlueButton(
                    text: 'Check For Updates',
                    onPressed: () {},
                  ),
                ),
                SizedBox(height: 10),
                Divider(),
                Text('Camera Specifications', style: AppTextStyles.heading5),
                SizedBox(height: 20),
                customSpaceTile(leading: 'Camera Model', trailing: 'HC-5A'),
                SizedBox(height: 5),
                customSpaceTile(leading: 'Device ID', trailing: 'Rjssna4598gj'),
                SizedBox(height: 5),
                customSpaceTile(leading: 'Serial Number', trailing: 'A1B2C3D4'),
                Divider(),
                SizedBox(
                  width: 190,
                  child: CustomButton(
                    title: 'Reset Camera',
                    onPressed: () {
                      Get.to(() => SelectCameraScreen());
                    },
                    backgroundColor: AppColors.primary,
                    textColor: Colors.white,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
