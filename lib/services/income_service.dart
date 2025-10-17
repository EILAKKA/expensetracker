import 'dart:convert';
import 'package:expenstracker/models/income_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IncomeService {
  //income List

  // Define the key for storing incomes in shared preferences
  List<Income> incomeList = [];

  static const String _incomeKey = 'income';

  //save the income to shared preferences

  Future<void> saveIncome(Income income, BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      List<String>? existingIncome = prefs.getStringList(_incomeKey);

      // convert the existing expenses to a list of income objects
      List<Income> existingIncomeObject = [];

      if (existingIncome != null) {
        existingIncomeObject = existingIncome
            .map((e) => Income.fromJSON(json.decode(e)))
            .toList();
      }

      // Add the new income to the list
      existingIncomeObject.add(income);

      // convert the list of income  objects back to a list of strings
      List<String> updatedIncomes = existingIncomeObject
          .map((e) => json.encode(e.toJSON()))
          .toList();

      // save the  updated list of incomes to shared preferences
      await prefs.setStringList(_incomeKey, updatedIncomes);

      // show message

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Income added successfully"),
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

  Future<List<Income>> loadIncomes() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String>? existingIncomes = pref.getStringList(_incomeKey);

    // Convert the existing expenses to a list of Expenseobjects

    List<Income> loadedIncomes = [];
    if (existingIncomes != null) {
      loadedIncomes = existingIncomes
          .map((e) => Income.fromJSON(json.decode(e)))
          .toList();
    }
    return loadedIncomes;
  }
}
