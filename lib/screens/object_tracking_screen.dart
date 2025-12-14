import 'package:flutter/material.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/utils/colors.dart';
import 'package:home_ai/widgets/alert_settings_card.dart';
import 'package:home_ai/widgets/me_me_toggle_row_widget.dart';
import 'package:home_ai/widgets/retention_dropdown.dart';
import 'package:home_ai/widgets/top_row.dart';

class ObjectTrackingScreen extends StatelessWidget {
  const ObjectTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopRow(title: "Detection Settings", icon: Icons.arrow_back),
                SizedBox(height: 20),
                MeMeToggleRow(
                  title: "Enable Object Tracking",
                  initialValue: true,
                  onChanged: (value) {},
                ),
                MeMeToggleRow(
                  title: "Show Tracking Path",
                  initialValue: false,
                  onChanged: (value) {},
                ),
                MeMeToggleRow(
                  title: "Multi-Object Tracking",
                  initialValue: false,
                  onChanged: (value) {},
                ),
                SizedBox(height: 20),
                MeMeToggleRow(
                  title: "Save Movement History",
                  initialValue: false,
                  onChanged: (value) {},
                ),
                SizedBox(height: 20),
                Text("Retention Period", style: AppTextStyles.heading7),
                SizedBox(height: 10),
                RetentionDropdown(initialValue: 7, onChanged: (value) {}),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "View History",
                      style: AppTextStyles.heading7.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                MeMeToggleRow(
                  title: "Enable Alerts for Unrecognized\nObjects",
                  initialValue: false,
                  onChanged: (value) {},
                ),
                const SizedBox(height: 24),
                const Text("Alert Settings", style: AppTextStyles.heading7),
                const SizedBox(height: 16),
                AlertSettingsCard(
                  initialSensitivity: 0.5,
                  initialAlertType: 'All',
                  onSensitivityChanged: (value) {},
                  onAlertTypeChanged: (types) {
                    // Handle alert types change
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
