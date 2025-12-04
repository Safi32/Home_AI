import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/utils/colors.dart';

class AddNewPersonController extends GetxController {
  RxBool isEnabled = false.obs;
}

final AddNewPersonController controller = Get.put(AddNewPersonController());

class AlertsWidget extends StatelessWidget {
  const AlertsWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(AppImages.electric, color: AppColors.primary),
            SizedBox(width: 10),
            Text(
              "Motion & Presence Alerts:",
              style: TextStyle(
                fontSize: AppTextStyles.heading6.fontSize,
                fontWeight: FontWeight.w600,
              ),
            ),
            Spacer(),
            Obx(
              () => Switch(
                value: controller.isEnabled.value,
                onChanged: (value) {
                  controller.isEnabled.value = value;
                },
                activeColor: AppColors.primary,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(text),
      ],
    );
  }
}
