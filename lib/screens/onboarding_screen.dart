import 'package:expenstracker/data/onboarding_data.dart';
import 'package:expenstracker/screens/shared_onboarding_screen.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              // Onboarding Screens
              PageView(
                children: [
                  SharedOnboardingScreen(
                    title: OnboardingData.onboadingDataList[0].title,
                    imagePath: OnboardingData.onboadingDataList[0].imagePath,
                    description:
                        OnboardingData.onboadingDataList[0].description,
                  ),
                  SharedOnboardingScreen(
                    title: OnboardingData.onboadingDataList[1].title,
                    imagePath: OnboardingData.onboadingDataList[1].imagePath,
                    description:
                        OnboardingData.onboadingDataList[1].description,
                  ),
                  SharedOnboardingScreen(
                    title: OnboardingData.onboadingDataList[2].title,
                    imagePath: OnboardingData.onboadingDataList[2].imagePath,
                    description:
                        OnboardingData.onboadingDataList[2].description,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
