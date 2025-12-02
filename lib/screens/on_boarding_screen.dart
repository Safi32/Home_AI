import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/modal/on_boarding_page_model.dart';
import 'package:home_ai/widgets/custom_bottom_bar.dart';
import 'package:home_ai/widgets/privacy_toggle.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class OnBoardingController extends GetxController {
  RxBool cameraAccess = true.obs;
  RxBool microphoneAccess = true.obs;
  RxBool notifications = false.obs;
  RxBool cookies = false.obs;
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final OnBoardingController controller = Get.put(OnBoardingController());
  final PageController pageController = PageController();
  final RxInt currentPage = 0.obs;

  final List<OnBoardingPageModel> pages = [
    OnBoardingPageModel(
      title: "Welcome To \n IRIS AI",
      subtitle:
          "Smart Object Recognition, Real-Time Alerts, and Intelligent Tracking, All in One App",
      imageUrl: AppImages.onBoarding,
    ),
    OnBoardingPageModel(
      title: "Smart Object, Pet & \n Person Tracking",
      subtitle: "Detect and track people, pets and objects automatically",
      imageUrl: AppImages.onboarding2,
    ),
    OnBoardingPageModel(
      title: "Real-Time Alerts \n & Notifications",
      subtitle: "Receive instant alerts for intruders, pets, or objects",
      imageUrl: AppImages.onboarding3,
    ),
  ];

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      currentPage.value = pageController.page?.round() ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final totalPages = pages.length + 1;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(AppImages.welcomeScreen, fit: BoxFit.cover),

          Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  itemCount: totalPages,
                  itemBuilder: (context, index) {
                    if (index < pages.length) {
                      final page = pages[index];
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            page.title,
                            style: TextStyle(
                              fontSize: AppTextStyles.heading3.fontSize,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10),
                          Text(
                            page.subtitle,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: AppTextStyles.heading7.fontSize,
                              color: Colors.grey[700],
                            ),
                          ),
                          SizedBox(height: 20),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset(
                                  page.imageUrl ?? "",
                                  height: 488,
                                  width: 364,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 20,
                                right: 20,
                                child: Image.asset(AppImages.group),
                              ),
                            ],
                          ),
                        ],
                      );
                    }

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 95,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Your Privacy, Fully\nProtected',
                            style: AppTextStyles.heading1.copyWith(
                              fontSize: 26,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'All processing happens locally, no data leaves your device without consent.',
                            style: AppTextStyles.heading7.copyWith(
                              color: Colors.black54,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 32),

                          Obx(
                            () => PrivacyToggle(
                              imageUrl: AppImages.camera,
                              title: 'Camera Access',
                              subtitle:
                                  'Required to detect and monitor people, pets, and objects.',
                              value: controller.cameraAccess.value,
                              onChanged: (val) =>
                                  controller.cameraAccess.value = val,
                            ),
                          ),
                          Obx(
                            () => PrivacyToggle(
                              imageUrl: AppImages.microphone,
                              title: 'Microphone Access',
                              subtitle: 'Enable voice commands and alerts.',
                              value: controller.microphoneAccess.value,
                              onChanged: (val) =>
                                  controller.microphoneAccess.value = val,
                            ),
                          ),
                          Obx(
                            () => PrivacyToggle(
                              imageUrl: AppImages.bell,
                              title: 'Notifications',
                              subtitle:
                                  'Get real-time alerts for intruders, pets, or objects.',
                              value: controller.notifications.value,
                              onChanged: (val) =>
                                  controller.notifications.value = val,
                            ),
                          ),
                          Obx(
                            () => PrivacyToggle(
                              imageUrl: AppImages.cookies,
                              title: 'Cookies & Policies',
                              subtitle:
                                  'Accept our privacy policy and cookies for the best experience.',
                              value: controller.cookies.value,
                              onChanged: (val) =>
                                  controller.cookies.value = val,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              Obx(
                () => Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                    left: 20,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: SmoothPageIndicator(
                            controller: pageController,
                            count: totalPages,
                            effect: ExpandingDotsEffect(
                              dotHeight: 8,
                              dotWidth: 8,
                              activeDotColor: Colors.blue,
                              dotColor: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      currentPage.value == totalPages - 1
                          ? Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() => CustomBottomBar());
                                  },
                                  child: Text(
                                    "Continue with setup",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 4),
                                Icon(
                                  Icons.arrow_forward_rounded,
                                  color: Colors.black,
                                  size: 16,
                                ),
                              ],
                            )
                          : Row(
                              children: [
                                Text(
                                  "Swipe",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: 4),
                                Icon(
                                  Icons.arrow_forward_rounded,
                                  color: Colors.black,
                                  size: 16,
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
