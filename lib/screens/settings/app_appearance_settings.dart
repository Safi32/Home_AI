import 'package:flutter/material.dart';
import 'package:home_ai/screens/camera_setting.dart';
import 'package:home_ai/widgets/custom_dropdown_tile.dart';
import 'package:home_ai/widgets/top_row.dart';

class AppAppearanceSettings extends StatefulWidget {
  const AppAppearanceSettings({super.key});

  @override
  State<AppAppearanceSettings> createState() => _AppAppearanceSettingsState();
}

class _AppAppearanceSettingsState extends State<AppAppearanceSettings> {
  String selectedOption = 'Medium';
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
                TopRow(title: 'App Appearance', icon: Icons.arrow_back),
                SizedBox(height: 30),
                SwipeToggleRow(
                  label: 'Theme',
                  options: ['Light', 'Auto', 'Darks'],
                  initialIndex: 1,
                ),
                SizedBox(height: 30),
                CustomDropdownTile(
                  label: 'Font Size',
                  options: ['Small', 'Medium', 'Large'],
                  selectedOption: selectedOption,
                  onChanged: (newValue) {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
