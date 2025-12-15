import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/utils/colors.dart';
import 'package:home_ai/widgets/custom_button.dart';
import 'package:home_ai/widgets/custom_space_tile.dart';
import 'package:home_ai/widgets/light_blue_button.dart';
import 'package:home_ai/widgets/top_row.dart';

class LivingRoomCameraSettings extends StatelessWidget {
  const LivingRoomCameraSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopRow(title: 'Living Room Camera', icon: Icons.arrow_back),
                SizedBox(height: 30),
                Text('Firmware & Updates', style: AppTextStyles.heading5),
                SizedBox(height: 30),
                customSpaceTile(leading: 'Model', trailing: 'HC-5A'),
                SizedBox(height: 5),
                customSpaceTile(leading: 'Serial No', trailing: '19X8-22LM-01'),
                SizedBox(height: 5),
                customSpaceTile(leading: 'Status', trailing: '🟢 Online'),
                SizedBox(height: 5),
                customSpaceTile(leading: 'Wifi', trailing: 'Connected'),
                SizedBox(height: 25),
                CustomButton(
                  title: 'Reset Camera',
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
                                    Image.asset(
                                      AppImages.refreshDialog,
                                      height: 141,
                                      width: 197,
                                    ),
                                    const SizedBox(height: 16),
                                    Text('Living Room Camera', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),),
                                    const SizedBox(height: 16),

                                    Text(
                                      'Confirm Factory Settings?',
                                      style: AppTextStyles.heading4.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),

                                    const SizedBox(height: 16),
                                    Text(
                                      'This action removes all settings, Wi-Fi, and recognition data. The camera will restart and require full setup.',
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 24),
                                    CustomButton(
                                      title: "Confirm Reset",
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
                                              child: SizedBox(
                                                height: 516,
                                                width: 327,
                                                child: Dialog(
                                                  backgroundColor: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          16,
                                                        ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                          24.0,
                                                        ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Image.asset(
                                                          AppImages.success,
                                                          height: 141,
                                                          width: 197,
                                                        ),
                                                        const SizedBox(
                                                          height: 16,
                                                        ),
                                                        Text(
                                                          'Camera Reset Successfully',
                                                          style: AppTextStyles
                                                              .heading4
                                                              .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        const SizedBox(
                                                          height: 16,
                                                        ),
                                                        Text(
                                                          'Your camera has returned to factory settings. To use it again, complete the setup process.',
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        const SizedBox(
                                                          height: 16,
                                                        ),
                                                        LightBlueButton(
                                                          text: "Close",
                                                          onPressed: () {
                                                            Navigator.pop(
                                                              context,
                                                            );
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
                  backgroundColor: AppColors.primary,
                  textColor: Colors.white,
                  foregroundColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
