import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/utils/colors.dart';
import 'package:home_ai/widgets/custom_button.dart';

class AddNewPersonController extends GetxController {
  RxBool isEnabled = false.obs;
}

class PersonPetWidget extends StatelessWidget {
  PersonPetWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.point1,
    required this.point2,
    required this.name,
    required this.imageUrl,
    required this.hintText,
    required this.text,
    required this.btnText,
  });
  final AddNewPersonController controller = Get.put(AddNewPersonController());

  final String title;
  final String subtitle;
  final String point1;
  final String point2;
  final String name;
  final String imageUrl;
  final String hintText;
  final String text;
  final String btnText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: Colors.black),
        ),
        SizedBox(height: 10),
        Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: AppTextStyles.heading3.fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              subtitle,
              style: TextStyle(fontSize: AppTextStyles.heading7.fontSize),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                  ),
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 24.0,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            leading: Icon(
                              Icons.camera_alt_outlined,
                              color: AppColors.primary,
                            ),
                            title: Text(
                              'Camera',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                              // TODO: Handle camera action
                            },
                          ),
                          Divider(height: 1),
                          ListTile(
                            leading: Icon(
                              Icons.photo_library_outlined,
                              color: AppColors.primary,
                            ),
                            title: Text(
                              'Gallery',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Container(
                height: 263,
                width: 309,
                decoration: BoxDecoration(
                  color: AppColors.lightBlue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(child: Image.asset(AppImages.cameraIcon)),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.circle, size: 8, color: Colors.grey),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                point1,
                style: TextStyle(fontSize: 13),
                softWrap: true,
              ),
            ),
          ],
        ),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.circle, size: 8, color: Colors.grey),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                point2,
                style: TextStyle(fontSize: 13),
                softWrap: true,
              ),
            ),
          ],
        ),

        SizedBox(height: 10),
        Text(
          name,
          style: TextStyle(
            fontSize: AppTextStyles.heading5.fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 1,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Image.asset(imageUrl),
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 18,
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        Column(
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
            SizedBox(height: 20),
            CustomButton(
              title: btnText,
              onPressed: () {},
              backgroundColor: AppColors.primary,
              textColor: Colors.white,
              foregroundColor: Colors.white,
            ),
          ],
        ),
      ],
    );
  }
}
