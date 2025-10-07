import 'package:expenstracker/data/onboarding_data.dart';
import 'package:expenstracker/screens/auth_screen.dart';
import 'package:expenstracker/screens/shared_onboarding_screen.dart';
import 'package:expenstracker/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool showAuthPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  // Onboarding Screens
                  PageView(
                    controller: _controller,
                    onPageChanged: (index) {
                      setState(() {
                        showAuthPage = index == 2;
                      });
                    },
                    children: [
                      SharedOnboardingScreen(
                        title: OnboardingData.onboadingDataList[0].title,
                        imagePath:
                            OnboardingData.onboadingDataList[0].imagePath,
                        description:
                            OnboardingData.onboadingDataList[0].description,
                      ),
                      SharedOnboardingScreen(
                        title: OnboardingData.onboadingDataList[1].title,
                        imagePath:
                            OnboardingData.onboadingDataList[1].imagePath,
                        description:
                            OnboardingData.onboadingDataList[1].description,
                      ),
                      SharedOnboardingScreen(
                        title: OnboardingData.onboadingDataList[2].title,
                        imagePath:
                            OnboardingData.onboadingDataList[2].imagePath,
                        description:
                            OnboardingData.onboadingDataList[2].description,
                      ),
                    ],
                  ),

                  Positioned(
                    bottom: 50,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: !showAuthPage
                            ? () {
                                _controller.animateToPage(
                                  _controller.page!.toInt() + 1,
                                  duration: Duration(microseconds: 400),
                                  curve: Curves.easeInOut,
                                );
                              }
                            : () {
                                // Navigate to  the Authscreen

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AuthScreen(),
                                  ),
                                );
                              },
                        child: CustomButton(
                          buttonName: showAuthPage ? 'Get Stated' : 'Next',
                          buttonColor: Colors.teal,
                        ),
                      ),
                    ),
                  ),

                  Container(
                    alignment: Alignment(0, 0.65),
                    child: SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                      effect: ColorTransitionEffect(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
