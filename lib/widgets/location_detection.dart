import 'package:flutter/material.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/utils/colors.dart';

class LocationDetection extends StatelessWidget {
  const LocationDetection({
    super.key,
    required this.backgroundImage,
    required this.title,
    required this.subtitle,
    this.icons,
    this.showIcon = true,
    this.showTime = false,
  });

  final String backgroundImage;
  final String title;
  final String subtitle;

  final List<Widget>? icons;
  final bool showIcon;
  final bool showTime;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            backgroundImage,
            width: 364,
            height: 237,
            fit: BoxFit.cover,
          ),
        ),
        if (showIcon)
          Positioned(
            top: 16,
            right: 16,
            child: Row(
              children: [
                const SizedBox(width: 10),
                Wrap(spacing: 10, children: icons ?? []),
              ],
            ),
          ),
        Positioned(
          left: 12,
          right: 12,
          bottom: 16,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 42,
                width: 344,
                decoration: BoxDecoration(
                  color: const Color(0xBF0F1A2E),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      
                      Text(
                        subtitle,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 13,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (showIcon)
                Positioned(
                  right: 10,
                  top: 0,
                  bottom: 0,
                  child: Container(
                    height: 30,
                    width: 29,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_outward,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              if (showTime)
                Positioned(
                  right: 20,
                  bottom: 5,
                  child: Text(
                    "Today, 09:41 AM",
                    style: AppTextStyles.heading5.copyWith(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 10,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
