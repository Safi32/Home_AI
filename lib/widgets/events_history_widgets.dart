import 'package:flutter/widgets.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/utils/colors.dart';

class EventsHistoryWidgets extends StatelessWidget {
  const EventsHistoryWidgets({
    super.key,
    required this.imageUrl,
    required this.title,
    this.onTap,
  });

  final String imageUrl;
  final String title;
  final VoidCallback? onTap;

  bool get isSmallIcon =>
      imageUrl == AppImages.filter || imageUrl == AppImages.calendar;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: AppColors.background,
              shape: BoxShape.circle,
            ),
            child: isSmallIcon
                ? Center(child: Image.asset(imageUrl, height: 25, width: 25))
                : ClipOval(child: Image.asset(imageUrl, fit: BoxFit.cover)),
          ),
        ),
        const SizedBox(height: 10),
        Text(title, style: AppTextStyles.heading7),
        SizedBox(height: 10),
      ],
    );
  }
}
