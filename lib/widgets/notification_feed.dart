import 'package:flutter/material.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/constants/text_styles.dart';

class NotificationFeed extends StatelessWidget {
  const NotificationFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,
      width: 364,
      child: Card(
        color: Colors.white,
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AppImages.person, color: Colors.black),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 3,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Person Detected",
                            style: AppTextStyles.heading7.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Text("5:31 PM", style: TextStyle(fontSize: 12)),
                        ],
                      ),
                      Text(
                        "Dad Entered the house",
                        style: TextStyle(fontSize: 12),
                      ),
                      Row(
                        children: [
                          Text("5:31 PM", style: TextStyle(fontSize: 10)),
                          SizedBox(width: 20),
                          Image.asset(
                            AppImages.cctv,
                            height: 12,
                            width: 12,
                            color: Colors.black,
                          ),
                          Text(
                            "Front Door Camera",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
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
