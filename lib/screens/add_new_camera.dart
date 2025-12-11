import 'package:flutter/material.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/widgets/title_subtitle_widget.dart';

class AddNewCamera extends StatelessWidget {
  const AddNewCamera({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            children: [
              TitleSubtitleWidget(
                title: "Add New Camera",
                subtitle: "Select a method to connect your camera to the app",
              ),
              SizedBox(height: 20,),
              SizedBox(
                height: 114,
                width: 130,
                child: Card(
                  color: Colors.white,
                  elevation: 1,
                  child: Column(
                    spacing: 20,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.scanner),
                      Text("QR Code Scan",
                        style: AppTextStyles.heading7.copyWith(
                          fontWeight: FontWeight.w600
                        )
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
