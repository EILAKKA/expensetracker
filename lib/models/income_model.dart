// income category enum
import 'package:expenstracker/models/transfer_model.dart';
import 'package:flutter/material.dart';

enum IncomeCategory { freelance, salary, pasive, sales }

// payment methods enum

// category images

final Map<IncomeCategory, String> incomeCategoryImages = {
  IncomeCategory.freelance: "assets/images/freelance.png",
  IncomeCategory.salary: "assets/images/health.png",
  IncomeCategory.pasive: "assets/images/car.png",
  IncomeCategory.sales: "assets/images/salary.png",
};
// income ctegory colors
final Map<IncomeCategory, Color> incomeCategoryColors = {
  IncomeCategory.freelance: const Color(0XFFE57373),
  IncomeCategory.salary: const Color(0XFF81C784),
  IncomeCategory.pasive: const Color(0XFF64B5F6),
  IncomeCategory.sales: const Color(0XFFFFD54F),
};

class Income {
  final int id;

  final double amount;
  final IncomeCategory category;
  final PaymentMethod paymentMethod;
  final DateTime date;
  final DateTime time;
  final String description;

  Income({
    required this.id,

    required this.amount,
    required this.category,
    required this.paymentMethod,
    required this.date,
    required this.time,
    required this.description,
  });

  // Convert the income object to  a JSON object

  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'amount': amount,
      'category': category.index,
      'paymethod': paymentMethod.index,
      'date': date.toIso8601String(),
      'time': time.toIso8601String(),
      'description': description,
    };
  }

  // Create an income object from  a JSON object
  factory Income.fromJSON(Map<String, dynamic> json) {
    return Income(
      id: json['id'],
      amount: json['amount'],
      category: IncomeCategory.values[json['category']],
      paymentMethod: PaymentMethod.values[json["paymethod"]],
      date: DateTime.parse(json['date']),
      time: DateTime.parse(json['time']),
      description: json['description'],
    );
  }
}
