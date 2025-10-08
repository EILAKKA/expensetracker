// widgets/custom_app_bar_ei.dart
import 'package:flutter/material.dart';

class AppBarEI extends StatelessWidget implements PreferredSizeWidget {
  final String title; // 🅰️ Sinhala or English title
  final bool centerTitle;
  final List<Widget>? actions;
  final Widget? leading;
  final Color backgroundColor;
  final Color titleColor;
  final double elevation;

  const AppBarEI({
    super.key,
    required this.title,
    this.centerTitle = true,
    this.actions,
    this.leading,
    this.backgroundColor = Colors.white,
    this.elevation = 2.0,
    this.titleColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: titleColor,
        ),
      ),
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
      elevation: elevation,
      leading: leading,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
