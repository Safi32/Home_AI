import 'package:flutter/material.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/screens/camera_setting.dart';
import 'package:home_ai/widgets/custom_space_tile.dart';
import 'package:home_ai/widgets/light_blue_button.dart';
import 'package:home_ai/widgets/me_me_toggle_row_widget.dart';
import 'package:home_ai/widgets/top_row.dart';

class VideoRecordingSettingsScreen extends StatefulWidget {
  const VideoRecordingSettingsScreen({super.key});

  @override
  State<VideoRecordingSettingsScreen> createState() =>
      _VideoRecordingSettingsScreenState();
}

class _VideoRecordingSettingsScreenState
    extends State<VideoRecordingSettingsScreen> {
  bool selectedRadio = false;
  String? selectedMonth;

  List<String> monthsDrop = ['1 Month', '3 Months', '5 Months'];

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
                  title: 'Video & Recording Settings',
                  icon: Icons.arrow_back,
                ),
                SizedBox(height: 30),
                SwipeToggleRow(
                  label: "Video Quality",
                  options: ["720p", "1080p", "2K"],
                  initialIndex: 1,
                ),
                SizedBox(height: 30),
                Text('Video History Duration', style: AppTextStyles.heading5),
                SizedBox(height: 10),
                Text('Auto-Delete Rules', style: AppTextStyles.heading7),
                SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Radio<bool>(
                        groupValue: selectedRadio,
                        value: true,
                        onChanged: (newVal) {
                          setState(() {
                            selectedRadio = newVal!;
                          });
                        },
                      ),
                      Text(
                        'Don\'t Auto-Delete Activity',
                        style: AppTextStyles.heading7,
                      ),
                    ],
                  ),
                ),
                Center(
                  child: DropdownButton<String>(
                    value: selectedMonth,
                    hint: const Text('Select'),
                    items: monthsDrop.map((String month) {
                      return DropdownMenuItem<String>(
                        value: month,
                        child: Text(month),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedMonth = newValue;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Radio<bool>(
                        groupValue: selectedRadio,
                        value: false,
                        onChanged: (newVal) {
                          setState(() {
                            selectedRadio = newVal!;
                          });
                        },
                      ),
                      Text('Auto-Delete Activity', style: AppTextStyles.heading7),
                    ],
                  ),
                ),
                Divider(),
                SizedBox(height: 10),
                Text('SD Card Usage', style: AppTextStyles.heading5),
                SizedBox(height: 10),
                SizedBox(height: 43, child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                      spacing: 5,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('1.3', style: TextStyle(fontSize: 40),),
                          Text('GB', style: AppTextStyles.heading7,),
                        ],
                      ),
                     Row(
                      spacing: 5,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('4', style: TextStyle(fontSize: 20),),
                          Text('GB', style: AppTextStyles.heading7,),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                StorageProgressBar(used: 1.3, total: 4),
                SizedBox(height: 20,),
                customSpaceTile(leading: 'Total Capacity', trailing: '4 GB'),
                customSpaceTile(leading: 'Used Capacity', trailing: '1.3 GB'),
                customSpaceTile(leading: 'Available Space', trailing: '2.7 GB'),
                MeMeToggleRow(title: 'Auto-Delete Oldest Recordings', onChanged: (value) {}),
                SizedBox(
                  width: 140,
                  child: LightBlueButton(
                    text: 'Format SD Card',
                    onPressed: () {},
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



class StorageProgressBar extends StatelessWidget {
  final double used; 
  final double total;

  const StorageProgressBar({
    super.key,
    required this.used,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    final progress = (used / total).clamp(0.0, 1.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: SizedBox(
            height: 8,
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey.shade300,
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color(0xFF2F6BFF), // blue
              ),
            ),
          ),
        ),
      ],
    );
  }
}
