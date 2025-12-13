import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/screens/edit_person.dart';
import 'package:home_ai/utils/colors.dart';
import 'package:home_ai/widgets/custom_button.dart';
import 'package:home_ai/widgets/light_blue_button.dart';
import 'package:home_ai/widgets/menu_item.dart';

class CircleImage extends StatelessWidget {
  const CircleImage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showEditDeleteMenu(context);
      },
      child: ClipOval(
        child: Image.asset(
          AppImages.mom,
          height: 81,
          width: 81,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  void showEditDeleteMenu(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (context) {
        return Stack(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(color: Colors.transparent),
            ),

            Positioned(
              top: 260,
              left: 180,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: 160,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MenuItem(
                        icon: Icons.edit,
                        text: 'Edit',
                        onTap: () {
                          Get.to(() => EditPerson());
                        },
                      ),
                      const Divider(height: 1),
                      MenuItem(
                        icon: Icons.delete_outline,
                        text: 'Delete',
                        textColor: Colors.red,
                        iconColor: Colors.red,
                        onTap: () {
                          showRemovePersonDialog(context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void showRemovePersonDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 6,
            sigmaY: 6,
          ),
          child: SizedBox(
            height: 596,
            width: 327,
            child: Dialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              insetPadding: const EdgeInsets.symmetric(horizontal: 24),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.close),
                      ),
                    ),
                    SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        AppImages.human,
                        height: 200,
                        width: 279,
                        fit: BoxFit.cover,
                      ),
                    ),
          
                    const SizedBox(height: 16),
          
                    Text(
                      "Remove Kamran",
                      style: AppTextStyles.heading5.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
          
                    const SizedBox(height: 12),
          
                    _bulletText(
                      "This person will no longer be identified in camera feeds.",
                    ),
                    _bulletText("Past detections and insights may be removed."),
                    _bulletText("You can add them again anytime."),
          
                    const SizedBox(height: 20),
          
                    CustomButton(
                      title: "Delete Person",
                      onPressed: () {},
                      backgroundColor: AppColors.primary,
                      textColor: Colors.white,
                      foregroundColor: Colors.white,
                    ),
                    const SizedBox(height: 10),
          
                    LightBlueButton(text: "Cancel", onPressed: () {}),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _bulletText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• ", style: TextStyle(fontSize: 16)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}
