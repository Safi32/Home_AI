import 'package:flutter/material.dart';
import 'package:home_ai/widgets/custom_dropdown_tile.dart';
import 'package:home_ai/widgets/me_me_toggle_row_widget.dart';
import 'package:home_ai/widgets/top_row.dart';

class AiAssistantSettingScreen extends StatefulWidget {
  const AiAssistantSettingScreen({super.key});

  @override
  State<AiAssistantSettingScreen> createState() => _AiAssistantSettingScreenState();
}

class _AiAssistantSettingScreenState extends State<AiAssistantSettingScreen> {
  String speechToText = "Accuracy";
  String aiResponseMode = "Brief";
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
                TopRow(
                  title: 'AI & Assistant Settings',
                  icon: Icons.arrow_back,
                ),
                SizedBox(height: 30),
                MeMeToggleRow(
                  title: 'Voice Assistant Settings',
                  subTitle: 'Enable Voice Assistant',
                  onChanged: (value) {},
                ),
                CustomDropdownTile(
                  label: "Speech-To-Text Preferences",
                  selectedOption: speechToText,
                  options: const ["Accuracy", "Speed"],
                  onChanged: (value) {
                    setState(() => speechToText = value);
                  },
                ),
                CustomDropdownTile(
                  label: "AI Responsive Mode",
                  selectedOption: aiResponseMode,
                  options: const ["Brief", "Detailed", "Smart"],
                  onChanged: (value) {
                    setState(() => aiResponseMode = value);
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


