import 'package:expenstracker/constants/colors.dart';
import 'package:flutter/material.dart';

class SharedOnboardingScreen extends StatelessWidget {
  final String title;
  final String imagePath;
  final String description;
  const SharedOnboardingScreen({
    super.key,
    required this.title,
    required this.imagePath,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(imagePath, width: 300, fit: BoxFit.cover),
        SizedBox(height: 20),
        Text(
          title,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 20),

        Text(
          description,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: kGrey,
          ),
        ),
      ],
    );
  }
}
