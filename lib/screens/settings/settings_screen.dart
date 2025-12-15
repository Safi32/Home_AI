import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/screens/settings/ai_assistant_setting_screen.dart';
import 'package:home_ai/screens/settings/app_appearance_settings.dart';
import 'package:home_ai/screens/settings/device_technical_info_settings.dart';
import 'package:home_ai/screens/settings/live_view_quality_settings.dart';
import 'package:home_ai/screens/settings/notification_settings_screen.dart';
import 'package:home_ai/screens/settings/privacy_permissions_screen.dart';
import 'package:home_ai/screens/settings/video_recording_settings_screen.dart';
import 'package:home_ai/widgets/top_row.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TopRow(title: 'Settings', icon: Icons.arrow_back),
              SizedBox(height: 20),
              customSettingsTile(() {
                Get.to(() => NotificationSettingsScreen());
              }, 'Notofication Settings'),
              customSettingsTile(() {
                Get.to(() => PrivacyPermissionsScreen());
              }, 'Privacy & Permissions'),
              customSettingsTile(() {
                Get.to(() => VideoRecordingSettingsScreen());
              }, 'Video & Recording Settings'),
              customSettingsTile(() {
                 Get.to(() => AiAssistantSettingScreen());
              }, 'AI & Assistant Settings'),
              customSettingsTile(() {
                 Get.to(() => LiveViewQualitySettings());
              }, 'Camera Quality Settings'),
              customSettingsTile(() {
              }, 'Room & Locations'),
              customSettingsTile(() {
                 Get.to(() => DeviceTechnicalInfoSettings());

              }, 'Device Technical Info'),
              customSettingsTile(() {}, 'Device Settings'),
              customSettingsTile(() {
                 Get.to(() => AppAppearanceSettings());
              }, 'App Appearance'),
              customSettingsTile(() {}, 'Legal'),
            ],
          ),
        ),
      ),
    );
  }

  Widget customSettingsTile(Function() onTap, String label) {
    return InkWell(
      onTap: onTap,
      child: ListTile(leading: Text(label, style: AppTextStyles.heading6)),
    );
  }
}
