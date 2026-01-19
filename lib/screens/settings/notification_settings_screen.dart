import 'package:flutter/material.dart';
import 'package:home_ai/widgets/me_me_toggle_row_widget.dart';
import 'package:home_ai/widgets/top_row.dart';

class NotificationSettingsScreen extends StatelessWidget {
  const NotificationSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TopRow(title: 'Notification Settings', icon: Icons.arrow_back),
              SizedBox(height: 20,),
              MeMeToggleRow(
                title: 'Notification Permissions',
                onChanged:(value) {} ,
              ),
              SizedBox(height: 20,),

              MeMeToggleRow(
                title: 'Intruder Alerts',
                subTitle: 'Alerts when a person enters restricted zones',
                onChanged: (value) {},
              ),
              SizedBox(height: 20,),

              MeMeToggleRow(
                title: 'Disaster Alerts',
                subTitle: 'Fire, smoke, water leak, structural risk.',
                onChanged: (value) {},
              ),
              SizedBox(height: 20,),
              MeMeToggleRow(
                title: 'Task Recovery Alerts',
                subTitle:
                    'Camera reconnect, restart, or\nself-diagnostics update',
                onChanged: (value) {},
              ),
              SizedBox(height: 20,),
              MeMeToggleRow(
                title: 'Object Movement Alerts',
                subTitle: 'Notify when an object is moved.',
                onChanged: (value) {},
              ),
              SizedBox(height: 20,),
              MeMeToggleRow(
                title: 'General AI Notifications',
                onChanged:(value) {} ,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
