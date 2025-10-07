import 'package:expenstracker/screens/main_screen.dart';
import 'package:expenstracker/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  final bool showMainScreen;
  const Wrapper({super.key, required this.showMainScreen});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return widget.showMainScreen ? MainScreen() : OnboardingScreen();
  }
}
