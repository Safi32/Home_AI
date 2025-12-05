import 'package:flutter/material.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/widgets/user_details.dart';

class UserStatus extends StatelessWidget {
  const UserStatus({
    super.key,
    required this.userName,
    required this.status,
     this.statusColor,
    required this.imageUrl,
  });

  final String userName;
  final String status;
  final Color? statusColor;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        UserDetails(imageUrl: imageUrl),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userName,
              style: TextStyle(
                fontSize: AppTextStyles.heading5.fontSize,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "•",
                  style: TextStyle(
                    fontSize: 18,
                    height: 1.2,
                    color: statusColor,
                  ),
                ),
                SizedBox(width: 5),
                Text(status, style: TextStyle(fontSize: 13)),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
