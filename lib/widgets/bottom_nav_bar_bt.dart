// bottom_nav_bar_ei.dart
import 'package:expenstracker/data/tx_data.dart';
import 'package:flutter/material.dart';

import 'package:expenstracker/constants/colors.dart';

class BottomNavBarEI extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int>? onTap;
  final Color bgColor;
  final double height;

  const BottomNavBarEI({
    super.key,
    this.currentIndex = 0,
    this.onTap,
    this.bgColor = Colors.white,
    this.height = 60,
  });

  @override
  State<BottomNavBarEI> createState() => _BottomNavBarEIState();
}

class _BottomNavBarEIState extends State<BottomNavBarEI> {
  late int selectedIndex;

  @override
  void initState() {
    selectedIndex = widget.currentIndex;
    super.initState();
  }

  void handleTap(int index) {
    setState(() => selectedIndex = index);
    widget.onTap?.call(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(color: widget.bgColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(TxData.bottomNavBarItems.length, (index) {
          final item = TxData.bottomNavBarItems[index];
          final isCenter = index == 2;

          return InkWell(
            onTap: () => handleTap(index),
            child: isCenter
                ? Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: kGrey,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(item.icon, color: kWhite, size: 30),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        item.icon,
                        color: selectedIndex == index ? kWhite : Colors.grey,
                      ),
                      Text(
                        item.title,
                        style: TextStyle(
                          color: selectedIndex == index ? kWhite : Colors.grey,
                        ),
                      ),
                    ],
                  ),
          );
        }),
      ),
    );
  }
}
