import 'package:flutter/material.dart';
import 'package:home_ai/constants/text_styles.dart';

class NotificationAlert extends StatelessWidget {
  const NotificationAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 67,
      width: 364,
      child: Card(
        color: Colors.white,
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Unidentified Person Detected",
                    style: AppTextStyles.heading7.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3A3A3A),
                    ),
                  ),
                  Text("5:31 PM", style: AppTextStyles.heading7),
                ],
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Spotted near the Main Enterance at 8:11PM.",
                    style: AppTextStyles.heading7.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
