import 'dart:convert';
import 'package:expenstracker/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExpenseService {
  //  expense list
  static List<Expense> expenseList = [];

  // Define the key for storing Expense in shared preferences

  static const String _expenseKey = 'expense';

  //save the income to shared preferences

  Future<void> saveExpense(Expense expense, BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      List<String>? existingExpense = prefs.getStringList(_expenseKey);

      // convert the existing expenses to a list of income objects
      List<Expense> existingExpenseObject = [];

      if (existingExpense != null) {
        existingExpenseObject = existingExpense
            .map((e) => Expense.fromJSON(json.decode(e)))
            .toList();
      }

      // Add the new income to the list
      existingExpenseObject.add(expense);

      // convert the list of income  objects back to a list of strings
      List<String> updatedExpenses = existingExpenseObject
          .map((e) => json.encode(e.toJSON()))
          .toList();

      // save the  updated list of incomes to shared preferences
      await prefs.setStringList(_expenseKey, updatedExpenses);

      // show message

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Expense added successfully"),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.toString()),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }
  // Load the expenses from shared preferenses

  Future<List<Expense>> loadExpenses() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String>? existingExpenses = pref.getStringList(_expenseKey);

    // Convert the existing expenses to a list of Expenseobjects

    List<Expense> loadedExpenses = [];
    if (existingExpenses != null) {
      loadedExpenses = existingExpenses
          .map((e) => Expense.fromJSON(json.decode(e)))
          .toList();
    }
    return loadedExpenses;
  }
}
