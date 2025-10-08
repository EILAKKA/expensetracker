import 'package:flutter/material.dart';

class ButtonTab extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onTap;
  const ButtonTab({
    super.key,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(),
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
          margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'NotoSansSinhala', // Optional Sinhala font
              ),
            ),
          ),
        ),
      ),
    );
  }
}
