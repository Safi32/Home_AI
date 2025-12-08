import 'package:flutter/widgets.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/utils/colors.dart';

class AddCamera extends StatelessWidget {
  const AddCamera({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 237,
      width: 170,
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add New \n Camera",
              style: AppTextStyles.heading7.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Image.asset(AppImages.cctv, height: 116, width: 117)],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppImages.frontCamera),
                Image.asset(AppImages.addCamera),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
