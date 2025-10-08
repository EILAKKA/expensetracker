import 'package:expenstracker/constants/colors.dart';
import 'package:expenstracker/data/tx_data.dart';
import 'package:expenstracker/widgets/app_bar_ei.dart';
import 'package:expenstracker/widgets/bottom_nav_bar_bt.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  final int initialIndex;
  const MainScreen({super.key, this.initialIndex = 0});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int _selectedIndex;
  bool isClickButton = false;

  String selectedValue = '';

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void updateValue(String value) {
    setState(() {
      selectedValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarEI(
          title: TxData.title[_selectedIndex],
          backgroundColor: kMainColor,
          titleColor: kWhite,
        ),

        body: TxData.screens[_selectedIndex],

        bottomNavigationBar: BottomNavBarEI(
          currentIndex: _selectedIndex,
          bgColor: kMainColor,
          onTap: (index) => setState(() => _selectedIndex = index),
        ),
      ),
    );
  }
}
