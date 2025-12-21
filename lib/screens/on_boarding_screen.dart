import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/modal/on_boarding_page_model.dart';
import 'package:home_ai/screens/connect_wifi.dart';
import 'package:home_ai/widgets/privacy_toggle.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

/// ---------------- CONTROLLER ----------------
class OnBoardingController extends GetxController {
  final cameraAccess = true.obs;
  final microphoneAccess = true.obs;
  final notifications = false.obs;
  final cookies = false.obs;

  final currentPage = 0.obs;
}

/// ---------------- SCREEN ----------------
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = Get.put(OnBoardingController());
  late final PageController pageController;

  final List<OnBoardingPageModel> pages = [
    OnBoardingPageModel(
      title: "Welcome To \nIRIS AI",
      subtitle:
          "Smart Object Recognition, Real-Time Alerts, and Intelligent Tracking, All in One App",
      imageUrl: AppImages.onBoarding,
    ),
    OnBoardingPageModel(
      title: "Smart Object, Pet & \nPerson Tracking",
      subtitle: "Detect and track people, pets and objects automatically",
      imageUrl: AppImages.onboarding2,
    ),
    OnBoardingPageModel(
      title: "Real-Time Alerts \n& Notifications",
      subtitle: "Receive instant alerts for intruders, pets, or objects",
      imageUrl: AppImages.onboarding3,
    ),
  ];

  int get totalPages => pages.length + 1;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void goToNextPage() {
    if (controller.currentPage.value < totalPages - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  /// ---------------- UI ----------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(AppImages.welcomeScreen, fit: BoxFit.cover),

          Column(
            children: [
              /// ---------------- PAGE VIEW ----------------
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  itemCount: totalPages,
                  onPageChanged: (index) =>
                      controller.currentPage.value = index,
                  itemBuilder: (context, index) {
                    if (index < pages.length) {
                      return _buildIntroPage(pages[index]);
                    }
                    return _buildPrivacyPage();
                  },
                ),
              ),

              /// ---------------- BOTTOM BAR ----------------
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Obx(
                  () => Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: SmoothPageIndicator(
                            controller: pageController,
                            count: totalPages,
                            effect: const ExpandingDotsEffect(
                              dotHeight: 8,
                              dotWidth: 8,
                              activeDotColor: Colors.blue,
                              dotColor: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: controller.currentPage.value == totalPages - 1
                            ? () => Get.to(() => const ConnectWifi())
                            : goToNextPage,
                        child: Row(
                          children: [
                            Text(
                              controller.currentPage.value == totalPages - 1
                                  ? "Continue with setup"
                                  : "Skip",
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Icon(
                              Icons.arrow_forward_rounded,
                              size: 16,
                              color: Colors.black,
                            ),
                          ],
                        ),
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

  /// ---------------- INTRO PAGE ----------------
  Widget _buildIntroPage(OnBoardingPageModel page) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          page.title,
          style: AppTextStyles.heading3.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Text(
          page.subtitle,
          textAlign: TextAlign.center,
          style: AppTextStyles.heading7.copyWith(color: Colors.grey[700]),
        ),
        const SizedBox(height: 20),
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

  /// ---------------- PRIVACY PAGE ----------------
  Widget _buildPrivacyPage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 95),
      child: Column(
        children: [
          Text(
            'Your Privacy, Fully\nProtected',
            style: AppTextStyles.heading1.copyWith(fontSize: 26),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            'All processing happens locally, no data leaves your device without consent.',
            style: AppTextStyles.heading7.copyWith(color: Colors.black54),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),

          Obx(
            () => PrivacyToggle(
              imageUrl: AppImages.camera,
              title: 'Camera Access',
              subtitle:
                  'Required to detect and monitor people, pets, and objects.',
              value: controller.cameraAccess.value,
              onChanged: (v) => controller.cameraAccess.value = v,
            ),
          ),

          Obx(
            () => PrivacyToggle(
              imageUrl: AppImages.microphone,
              title: 'Microphone Access',
              subtitle: 'Enable voice commands and alerts.',
              value: controller.microphoneAccess.value,
              onChanged: (v) => controller.microphoneAccess.value = v,
            ),
          ),

          Obx(
            () => PrivacyToggle(
              imageUrl: AppImages.bell,
              title: 'Notifications',
              subtitle: 'Get real-time alerts for intruders, pets, or objects.',
              value: controller.notifications.value,
              onChanged: (v) => controller.notifications.value = v,
            ),
          ),

          Obx(
            () => PrivacyToggle(
              imageUrl: AppImages.cookies,
              title: 'Cookies & Policies',
              subtitle:
                  'Accept our privacy policy and cookies for the best experience.',
              value: controller.cookies.value,
              onChanged: (v) => controller.cookies.value = v,
            ),
          ),
        ],
      ),
    );
  }
}
