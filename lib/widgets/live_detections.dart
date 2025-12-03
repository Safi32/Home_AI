import 'package:flutter/material.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/utils/colors.dart';

class LiveDetections extends StatelessWidget {
  const LiveDetections({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.asset(
            imageUrl,
            height: 237,
            width: 170,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(right: 10, top: 10, child: Image.asset(AppImages.live)),
        Positioned(right: 10, top: 40, child: Image.asset(AppImages.redVideo)),
        Positioned(
          right: 10,
          top: 80,
          child: Image.asset(AppImages.accentFrame),
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
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Living Room',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '2 minutes ago',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 10,
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
