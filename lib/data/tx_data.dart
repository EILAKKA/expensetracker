import 'package:expenstracker/models/botom_nav_bar_model.dart';
import 'package:expenstracker/screens/pages/add_transaction_page.dart';
import 'package:expenstracker/screens/pages/analytics_view.dart';
import 'package:expenstracker/screens/pages/home_page.dart';
import 'package:expenstracker/screens/pages/setting_view.dart';
import 'package:expenstracker/screens/pages/transaction_list_view.dart';
import 'package:expenstracker/screens/views/add_expense_view.dart';
import 'package:expenstracker/screens/views/add_income_view.dart';
import 'package:expenstracker/screens/views/transfer_view.dart';
import 'package:flutter/material.dart';

class TxData {
  static final List<Widget> screens = [
    HomePage(),
    AnalyticsView(),
    AddTransactionPage(),
    TransactionListView(),
    SettingsView(),
  ];

  static final List<Widget> txViews = [
    AddIncomeView(),
    AddExpenseView(),
    TransferView(),
  ];

  static final List<String> txTitle = ["Add Income", "Add Expense", "Transfer"];

  static final List<String> title = [
    "Home",
    "Budget",
    "Add Transaction",
    "All Transaction",
    "Profile",
  ];

  static final List<BotomNavBarModel> bottomNavBarItems = [
    BotomNavBarModel(icon: Icons.home, title: "Home"),
    BotomNavBarModel(icon: Icons.rocket, title: "Budgets"),
    BotomNavBarModel(icon: Icons.add, title: ""),
    BotomNavBarModel(icon: Icons.list, title: "All Trans"),
    BotomNavBarModel(icon: Icons.person, title: "Profile"),
  ];
}
