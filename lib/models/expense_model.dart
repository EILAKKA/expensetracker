// income category enum
import 'package:expenstracker/models/transfer_model.dart';
import 'package:flutter/material.dart';

enum ExpenseCategory { shoping, subscription, food, health, transport }

// payment methods enum

// category images

final Map<ExpenseCategory, String> expenseCategoryImages = {
  ExpenseCategory.shoping: "aassets/images/bag.png",
  ExpenseCategory.subscription: "assets/images/bill.png",
  ExpenseCategory.food: "aassets/images/restaurant.png",
  ExpenseCategory.health: "assets/images/health.png",
  ExpenseCategory.transport: "assets/images/car.png",
};
// income ctegory colors
final Map<ExpenseCategory, Color> expenseCategoryColors = {
  ExpenseCategory.shoping: const Color(0XFFE57373),
  ExpenseCategory.subscription: const Color(0XFF81C784),
  ExpenseCategory.food: const Color(0XFF64B5F6),
  ExpenseCategory.health: const Color(0XFFFFD54F),
  ExpenseCategory.transport: const Color(0XFFFFBB99),
};

class Expense {
  final int id;
  final String title;
  final double amount;
  final ExpenseCategory category;
  final PaymentMethod paymentMethod;
  final DateTime date;
  final DateTime time;
  final String description;

  Expense({
    required this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.paymentMethod,
    required this.date,
    required this.time,
    required this.description,
  });
}
