import 'package:flutter/material.dart';
import 'package:home_ai/utils/colors.dart';

class AddNewDrawerWidget extends StatelessWidget {
  const AddNewDrawerWidget({
    super.key,
    required this.imageUrl,
    required this.text, required this.onPressed,
  });

  final String imageUrl;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 65,
        width: 75,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: AppColors.background,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.asset(
                    imageUrl,
                    height: 12,
                    width: 12,
                    color: Colors.black,
                  ),
                ),
              ),

              Text(text, style: TextStyle(fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }
}
