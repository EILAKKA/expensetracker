import 'package:expenstracker/models/botom_nav_bar_model.dart';
import 'package:expenstracker/models/income_model.dart';
import 'package:expenstracker/screens/pages/add_transaction_page.dart';
import 'package:expenstracker/screens/pages/analytics_view.dart';
import 'package:expenstracker/screens/pages/home_page.dart';
import 'package:expenstracker/screens/pages/setting_view.dart';
import 'package:expenstracker/screens/pages/transaction_list_view.dart';
import 'package:expenstracker/services/expense_service.dart';
import 'package:flutter/material.dart';

class TxData {
  static List<Income> incomeList = [];
  static final List<Widget> screens = [
    TransactionListView(expenseList: ExpenseService.expenseList),
    HomePage(),
    AnalyticsView(),
    AddTransactionPage(),

    SettingsView(),
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
