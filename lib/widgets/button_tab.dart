import 'package:expenstracker/constants/colors.dart';
import 'package:flutter/material.dart';

class ButtonTab extends StatelessWidget {
  final String label;
  final Color color;
  final Color titleColor;
  final VoidCallback onTap;
  final Border border;
  const ButtonTab({
    super.key,
    required this.label,
    required this.color,
    required this.onTap,
    required this.border,
    this.titleColor = kWhite,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1.25, horizontal: 1),
        child: InkWell(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: border,
              color: color,
              borderRadius: BorderRadius.circular(8),
            ),
            margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
            child: Center(
              child: Text(
                label,
                style: TextStyle(
                  color: titleColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'NotoSansSinhala', // Optional Sinhala font
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
