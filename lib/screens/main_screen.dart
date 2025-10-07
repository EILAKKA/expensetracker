import 'package:expenstracker/constants/colors.dart';
import 'package:expenstracker/screens/views/add_transaction_page.dart';
import 'package:expenstracker/screens/views/analytics_view.dart';
import 'package:expenstracker/screens/views/home_view.dart';
import 'package:expenstracker/screens/views/setting_view.dart';
import 'package:expenstracker/screens/views/transaction_list_view.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<Widget> views = [
      HomeView(),
      AnalyticsView(),
      AddTransactionPage(),
      TransactionListView(),
      SettingsView(),
    ];
    return Scaffold(
      appBar: AppBar(title: Text('main Screern')),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: kWhite,
        currentIndex: _currentPageIndex,
        onTap: (value) {
          setState(() {
            _currentPageIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.rocket), label: "Budgets"),
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                color: kMainColor,
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(10),
              child: Icon(Icons.add, color: kWhite),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Transactions",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
