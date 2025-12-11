import 'package:flutter/material.dart';

class DeviceManagementWidget extends StatelessWidget {
  const DeviceManagementWidget({
    super.key,
    required this.imageUrl,
    required this.text,
    this.image,
    required this.backgroundColor,
    required this.textStyle,
    required this.height,
    required this.width, required this.onPressed,
  });

  final String imageUrl;
  final String text;
  final String? image;
  final Color backgroundColor;
  final TextStyle textStyle;
  final double height;
  final double width;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(child: Image.asset(imageUrl)),
              ),
              SizedBox(width: 10),
              Text(text, style: textStyle),
      
              Spacer(),
              image == null ? const SizedBox() : Image.asset(image!),
            ],
          ),
        ),
      ),
    );
  }
}
