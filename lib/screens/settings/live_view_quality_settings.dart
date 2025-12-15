import 'package:flutter/material.dart';
import 'package:home_ai/screens/camera_setting.dart';
import 'package:home_ai/widgets/me_me_toggle_row_widget.dart';
import 'package:home_ai/widgets/top_row.dart';

class LiveViewQualitySettings extends StatefulWidget {
  const LiveViewQualitySettings({super.key});

  @override
  State<LiveViewQualitySettings> createState() =>
      _LiveViewQualitySettingsState();
}

class _LiveViewQualitySettingsState extends State<LiveViewQualitySettings> {
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
                TopRow(title: 'Live View Quality', icon: Icons.arrow_back),
                SizedBox(height: 30),
                SwipeToggleRow(label: 'Streaming Quality', options: ['Low', 'Medium', 'High'], initialIndex: 1,),
                SizedBox(height: 30),
                SwipeToggleRow(label: 'Frame Rate', options: ['30 fps', '24 fps', '15 fps'], initialIndex: 1,),
                SizedBox(height: 30),
                MeMeToggleRow(title: 'Low Latency Mode', subTitle: 'Reduces Delay for Real Time View', onChanged: (value) {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
