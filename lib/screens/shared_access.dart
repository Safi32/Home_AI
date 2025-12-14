import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/screens/invite_new_user.dart';
import 'package:home_ai/utils/colors.dart';
import 'package:home_ai/widgets/device_management_widget.dart';
import 'package:home_ai/widgets/top_row.dart';

class SharedAccess extends StatefulWidget {
  const SharedAccess({super.key});

  @override
  State<SharedAccess> createState() => _SharedAccessState();
}

class _SharedAccessState extends State<SharedAccess> {
  String selectedRole = 'Admin';
  final List<Map<String, String>> members = [
    {
      'name': 'Kamran Shah',
      'email': 'kamranshah@example.com',
      'lastLogin': 'Last login: 2h ago',
      'role': 'Admin',
    },
    {
      'name': 'Kamran Shah',
      'email': 'kamranshah@example.com',
      'lastLogin': 'Last login: 2h ago',
      'role': 'Admin',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopRow(title: "Shared Access", icon: Icons.arrow_back),
              const SizedBox(height: 20),
              DeviceManagementWidget(
                backgroundColor: AppColors.lightBlue,
                imageUrl: AppImages.sharedAccess,
                text: "Invite New User",
                textStyle: AppTextStyles.heading6.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                height: 70,
                width: 364,
                onPressed: () {
                  Get.to(() => InviteNewUser());
                },
                image: AppImages.addCamera,
              ),
              const SizedBox(height: 20),
              Text(
                "Current Members",
                style: AppTextStyles.heading6,
              ),
              const SizedBox(height: 20),
              ...members.map((member) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 114,
                    width: 364,
                    decoration: BoxDecoration(
                      color: AppColors.lightBlue,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                member['name']!,
                                style: AppTextStyles.heading6.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                             Container(
                               height: 28,  
                               width: 115,   
                               padding: const EdgeInsets.symmetric(horizontal: 8),  // Reduced horizontal padding
                               decoration: BoxDecoration(
                                 color: Colors.white,
                                 borderRadius: BorderRadius.circular(10),
                                 border: Border.all(color: Colors.grey[300]!),
                               ),
                               child: DropdownButtonHideUnderline(
                                 child: DropdownButton<String>(
                                   isDense: true,   
                                   value: selectedRole,
                                   icon: const Icon(Icons.arrow_drop_down, 
                                          size: 20, 
                                          color: Colors.black),
                                   style: const TextStyle(
                                     fontSize: 12, 
                                     color: Colors.black,
                                   ),
                                   items: <String>['Admin', 'Super Admin'].map((String value) {
                                     return DropdownMenuItem<String>(
                                       value: value,
                                       child: Text(
                                         value,
                                         style: const TextStyle(fontSize: 12),  // Ensure consistent font size
                                       ),
                                     );
                                   }).toList(),
                                   onChanged: (String? newValue) {
                                     if (newValue != null) {
                                       setState(() {
                                         selectedRole = newValue;
                                       });
                                     }
                                   },
                                 ),
                               ),
                             )
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            member['email']!,
                            style: AppTextStyles.bodySmall.copyWith(
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            member['lastLogin']!,
                            style: AppTextStyles.bodySmall.copyWith(
                              color: Colors.grey[500],
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size.zero,
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: Text(
                                  'Remove Access',
                                  style: TextStyle(
                                    color: Colors.red[400],
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}