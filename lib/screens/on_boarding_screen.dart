import 'package:flutter/material.dart';
import 'package:home_ai/constants/images.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/modal/on_boarding_page_model.dart';
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
      title: "Connect",
      subtitle: "Connect with people all around the world",
      imageUrl: "assets/images/onboarding2.png",
    ),
    OnBoardingPageModel(
      title: "Get Started",
      subtitle: "Let's get started now!",
      imageUrl: "assets/images/onboarding3.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
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
                  itemCount: pages.length,
                  itemBuilder: (context, index) {
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
                        SizedBox(height: 20),
                        Text(
                          page.subtitle,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
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
                                page.imageUrl,
                                height: 488,
                                width: 364,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 20,
                              right: 20,
                              child: Image.asset(
                                AppImages.group,
                                
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SmoothPageIndicator(
                  controller: pageController,
                  count: pages.length,
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
