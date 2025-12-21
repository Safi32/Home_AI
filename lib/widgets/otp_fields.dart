import 'package:flutter/material.dart';
import 'package:home_ai/utils/colors.dart';

class OtpFields extends StatelessWidget {
  final int length;
  final void Function(String) onChanged;
  final double fieldWidth;
  final double fieldSpacing;
  final TextEditingController? controller;

  const OtpFields({
    super.key,
    this.length = 4,
    required this.onChanged,
    this.fieldWidth = 48,
    this.fieldSpacing = 12,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      width: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(length, (index) {
          return Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: fieldSpacing / 2),
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                maxLength: 1,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                decoration: const InputDecoration(
                  counterText: '',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(color: AppColors.primary),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(color: AppColors.alert),
                  ),  
                ),
                onChanged: (value) {
                  onChanged(value);
                  if (value.isNotEmpty && index < length - 1) {
                    FocusScope.of(context).nextFocus();
                  } else if (value.isEmpty && index > 0) {
                    FocusScope.of(context).previousFocus();
                  }
                },
              ),
            ),
          );
        }),
      ),
    );
  }
}
