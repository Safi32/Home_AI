import 'package:flutter/material.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/utils/colors.dart';

class LocationDetection extends StatelessWidget {
  const LocationDetection({super.key, required this.backgroundImage, required this.title, required this.subtitle});

  final String backgroundImage;
  final String title;
  final String subtitle;

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
        Positioned(
          top: 16,
          right: 16,
          child: Row(
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [Image.asset(AppImages.frame)],
              ),
              SizedBox(width: 10),
              Wrap(
                spacing: 10,
                children: [
                  Image.asset(AppImages.sound),
                  Image.asset(AppImages.wifi),
                  Image.asset(AppImages.video),
                  Image.asset(AppImages.live),
                ],
              ),
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
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      SizedBox(height: 4),
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
                  child: Icon(
                    Icons.arrow_outward,
                    color: Colors.white,
                    size: 18,
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
