import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/screens/add_new_person.dart';
import 'package:home_ai/screens/add_new_pet.dart';
import 'package:home_ai/screens/edit_screen.dart';
import 'package:home_ai/screens/object_recognition.dart';
import 'package:home_ai/utils/colors.dart';
import 'package:home_ai/widgets/add_new_drawer_widget.dart';
import 'package:home_ai/widgets/sidebar_items.dart';

class MySideMenu extends StatelessWidget {
  MySideMenu({super.key});

  final ValueNotifier<int> selectedIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.background,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Profile Card
            Container(
              height: 99,
              width: 267,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                      color: AppColors.background,
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        AppImages.human,
                        fit: BoxFit.cover,
                        width: 60,
                        height: 60,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Ahmad Ali", style: AppTextStyles.heading5),
                      const Text(
                        "Albertstevano@gmail.com",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 19,
                        width: 60,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.zero,
                          ),
                          onPressed: () {
                            Get.to(() => EditScreen());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AppImages.editUser,
                                height: 12,
                                width: 12,
                              ),
                              const SizedBox(width: 4),
                              const Text(
                                "Edit",
                                style: TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            Text(
              "Add New",
              style: AppTextStyles.heading6.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 8,
                children: [
                  AddNewDrawerWidget(
                    imageUrl: AppImages.person,
                    text: "Person",
                    onPressed: () {
                      Get.to(() => AddNewPerson());
                    },
                  ),
                  AddNewDrawerWidget(
                    imageUrl: AppImages.paw,
                    text: "Pet",
                    onPressed: () {
                      Get.to(() => AddNewPet());
                    },
                  ),
                  AddNewDrawerWidget(
                    imageUrl: AppImages.object,
                    text: "Object",
                    onPressed: () {
                      Get.to(() => ObjectRecognition());
                    },
                  ),
                  AddNewDrawerWidget(
                    imageUrl: AppImages.cctv,
                    text: "Camera",
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ValueListenableBuilder<int>(
                  valueListenable: selectedIndex,
                  builder: (context, value, _) {
                    return ListView.separated(
                      padding: EdgeInsets.zero,
                      physics: const BouncingScrollPhysics(),
                      itemCount: 10,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        return SidebarItems(
                          index: index,
                          selectedIndex: value,
                          onTap: () => selectedIndex.value = index,
                          imageUrl: [
                            AppImages.deviceManagement,
                            AppImages.person,
                            AppImages.label,
                            AppImages.paw,
                            AppImages.settings,
                            AppImages.alert,
                            AppImages.helpSupport,
                            AppImages.sharedAccess,
                            AppImages.privacyPolicy,
                            AppImages.signOut,
                          ][index],
                          text: [
                            "Device Management",
                            "Face Recognition",
                            "Object Management",
                            "Paw Management",
                            "Settings",
                            "Alert Center",
                            "Help & Support",
                            "Shared Access",
                            "Privacy Setting",
                            "Sign Out",
                          ][index],
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
