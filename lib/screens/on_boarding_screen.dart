import 'package:flutter/material.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/modal/on_boarding_page_model.dart';
import 'package:home_ai/widgets/privacy_toggle.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'; 

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController pageController = PageController();

  final List<OnBoardingPageModel> pages = [
    OnBoardingPageModel(
      title: "Welcome To \n IRIS AI",
      subtitle: "Smart Object Recognition, Real-Time Alerts, and Intelligent Tracking, All in One App",
      imageUrl: AppImages.onBoarding,
    ),
    OnBoardingPageModel(
      title: "Smart Object, Pet & \n Person Tracking",
      subtitle: "Detect and track perople, pets and objects automatically ",
      imageUrl: AppImages.onboarding2,
    ),

    OnBoardingPageModel(
      title: "Real-Time Alerts \n & Notifications",
      subtitle: "Receive instant alerts for intruders, pets, or objects",
      imageUrl: AppImages.onboarding3,
    ),
   
  ];

  @override
  Widget build(BuildContext context) {
    final totalPages = pages.length + 1;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            AppImages.welcomeScreen,
            fit: BoxFit.cover,
          ),
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
                    } else {
                    
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Your Privacy, Fully\nProtected',
                              style: AppTextStyles.heading1.copyWith(
                                fontSize: 26,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(height: 12),
                            Text(
                              'All processing happens locally, no data leaves your device without consent.',
                              style: AppTextStyles.heading7.copyWith(
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(height: 32),
                            PrivacyToggle(
                              icon: Icons.videocam,
                              title: 'Camera Access',
                              subtitle:
                                  'Required to detect and monitor people, pets, and objects.',
                              value: true,
                            ),
                            PrivacyToggle(
                              icon: Icons.mic,
                              title: 'Microphone Access',
                              subtitle: 'Enable voice commands and alerts.',
                              value: true,
                            ),
                            PrivacyToggle(
                              icon: Icons.notifications,
                              title: 'Notifications',
                              subtitle:
                                  'Get real-time alerts for intruders, pets, or objects.',
                              value: false,
                            ),
                            PrivacyToggle(
                              icon: Icons.privacy_tip,
                              title: 'Cookies & Policies',
                              subtitle:
                                  'Accept our privacy policy and cookies for the best experience.',
                              value: false,
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
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
            ],
          ),
        ],
      ),
    );

  }


}
