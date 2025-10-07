import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final double mainContainerHeight;
  final double mainContainerWidth;
  final double buttonRadius;
  final IconData icon1;
  final IconData icon2;
  final IconData icon3;
  final IconData icon4;

  final int currentIndex;
  final Function(int) onTap;
  final double height;

  final Color mainContainerColor;
  final Color buttonContainerColor;
  final Color borderColor;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    this.mainContainerHeight = 50,
    this.mainContainerWidth = 100,
    this.buttonRadius = 50,
    this.height = 50,

    this.mainContainerColor = Colors.blue,
    this.buttonContainerColor = Colors.blue,

    this.borderColor = Colors.white,
    required this.icon1,
    required this.icon2,
    required this.icon3,
    required this.icon4,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.mainContainerHeight,
      width: widget.mainContainerWidth,
      decoration: BoxDecoration(
        color: widget.mainContainerColor,

        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 12)],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem(icon: widget.icon1, index: 0),
            _buildNavItem(icon: widget.icon2, index: 1),
            SizedBox(width: 50),
            _buildNavItem(icon: widget.icon3, index: 2),
            _buildNavItem(icon: widget.icon4, index: 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({required IconData icon, required int index}) {
    final isSelected = index == widget.currentIndex;
    return InkWell(
      onTap: () => widget.onTap(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: isSelected ? Colors.teal : Colors.grey, size: 24),
        ],
      ),
    );
  }
}
