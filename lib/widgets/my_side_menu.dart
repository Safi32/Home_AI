

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/modal/sidebar_model.dart';
import 'package:home_ai/screens/add_new_person.dart';
import 'package:home_ai/screens/add_new_pet.dart';
import 'package:home_ai/screens/alert_screen.dart';
import 'package:home_ai/screens/device_management_screen.dart';
import 'package:home_ai/screens/edit_screen.dart';
import 'package:home_ai/screens/object_management.dart';
import 'package:home_ai/screens/object_recognition.dart';
import 'package:home_ai/screens/person_management_screen.dart';
import 'package:home_ai/screens/pet_management.dart';
import 'package:home_ai/screens/settings/settings_screen.dart';
import 'package:home_ai/screens/shared_access.dart';
import 'package:home_ai/utils/colors.dart';
import 'package:home_ai/widgets/add_new_drawer_widget.dart';
import 'package:home_ai/widgets/custom_button.dart';
import 'package:home_ai/widgets/light_blue_button.dart';
import 'package:home_ai/widgets/points_widget.dart';
import 'package:home_ai/widgets/sidebar_items.dart';

class MySideMenu extends StatelessWidget {
  MySideMenu({super.key});

  /// ---------------- STATE ----------------
  final ValueNotifier<int> selectedIndex = ValueNotifier<int>(0);

  /// ---------------- DATA ----------------
  final List<SidebarItem> sideBarItems = [
    SidebarItem(
      imageUrl: AppImages.deviceManagement,
      name: "Device Management",
      onPressed: () => Get.to(() => const DeviceManagementScreen()),
    ),
    SidebarItem(
      imageUrl: AppImages.person,
      name: "Person Management",
      onPressed: () => Get.to(() => const PersonManagementScreen()),
    ),
    SidebarItem(
      imageUrl: AppImages.label,
      name: "Object Management",
      onPressed: () => Get.to(() => const ObjectManagement()),
    ),
    SidebarItem(
      imageUrl: AppImages.paw,
      name: "Pet Management",
      onPressed: () => Get.to(() => const PetManagement()),
    ),
    SidebarItem(
      imageUrl: AppImages.settings,
      name: "Settings",
      onPressed: () => Get.to(() => const SettingsScreen()),
    ),
    SidebarItem(
      imageUrl: AppImages.alert,
      name: "Alert Center",
      onPressed: () => Get.to(() => const AlertScreen()),
    ),
    SidebarItem(
      imageUrl: AppImages.helpSupport,
      name: "Help & Support",
      onPressed: () {},
    ),
    SidebarItem(
      imageUrl: AppImages.sharedAccess,
      name: "Shared Access",
      onPressed: () => Get.to(() => const SharedAccess()),
    ),
    SidebarItem(
      imageUrl: AppImages.privacyPolicy,
      name: "Privacy Setting",
      onPressed: () {},
    ),
    SidebarItem(
      imageUrl: AppImages.signOut,
      name: "Sign Out",
      onPressed: () {
        showDialog(
          context: Get.context!,
          barrierColor: Colors.black54,
          builder: (BuildContext context) {
            return BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
              child: SizedBox(
                height: 516,
                width: 327,
                child: Dialog(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(AppImages.exit, height: 141, width: 197),
                        const SizedBox(height: 16),

                        Text(
                          'Sign Out Of IRIS AI?',
                          style: AppTextStyles.heading4.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 16),
                        PointsWidget(
                          point1:
                              "You will be logged out from your account on this device.",
                          point2:
                              "Your cameras and alerts will continue to function normally.",
                        ),
                        const SizedBox(height: 24),
                        CustomButton(
                          title: "Sign Out",
                          onPressed: () {
                            Navigator.pop(context);
                            showDialog(
                              context: Get.context!,
                              barrierColor: Colors.black54,
                              builder: (BuildContext context) {
                                return BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 6,
                                    sigmaY: 6,
                                  ),
                                );
                              },
                            );
                          },
                          backgroundColor: AppColors.primary,
                          textColor: Colors.white,
                          foregroundColor: Colors.white,
                        ),
                        SizedBox(height: 10),
                        LightBlueButton(
                          text: "Cancel",
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    ),
  ];

 

  /// ---------------- UI ----------------
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.background,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileCard(),
            const SizedBox(height: 20),
            _buildAddNewSection(),
            const SizedBox(height: 20),
            _buildSidebarList(context),
          ],
        ),
      ),
    );
  }

  /// ---------------- PROFILE ----------------
  Widget _buildProfileCard() {
    return Container(
      height: 99,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          ClipOval(child: Image.asset(AppImages.human, width: 60, height: 60)),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Ahmad Ali", style: AppTextStyles.heading5),
                const Text(
                  "Albertstevano@gmail.com",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 20,
                  child: ElevatedButton(
                    onPressed: () => Get.to(() => EditScreen()),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: EdgeInsets.zero,
                    ),
                    child: const Text("Edit", style: TextStyle(fontSize: 10)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// ---------------- ADD NEW ----------------
  Widget _buildAddNewSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Add New",
          style: AppTextStyles.heading6.copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              AddNewDrawerWidget(
                imageUrl: AppImages.person,
                text: "Person",
                onPressed: () => Get.to(() => AddNewPerson()),
              ),
              AddNewDrawerWidget(
                imageUrl: AppImages.paw,
                text: "Pet",
                onPressed: () => Get.to(() => AddNewPet()),
              ),
              AddNewDrawerWidget(
                imageUrl: AppImages.object,
                text: "Object",
                onPressed: () => Get.to(() => ObjectRecognition()),
              ),
              AddNewDrawerWidget(
                imageUrl: AppImages.cctv,
                text: "Camera",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// ---------------- SIDEBAR LIST ----------------
  Widget _buildSidebarList(BuildContext context) {
    return Expanded(
      child: ValueListenableBuilder<int>(
        valueListenable: selectedIndex,
        builder: (_, value, __) {
          return ListView.separated(
            itemCount: sideBarItems.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (_, index) {
              final item = sideBarItems[index];
              return SidebarItems(
                index: index,
                selectedIndex: value,
                imageUrl: item.imageUrl,
                text: item.name,
                onTap: () {
                  selectedIndex.value = index;

                  item.onPressed();
                },
              );
            },
          );
        },
      ),
    );
  }
}
