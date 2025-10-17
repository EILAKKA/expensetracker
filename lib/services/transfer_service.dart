import 'dart:convert';
import 'package:expenstracker/models/transfer_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TransferService {
  //income List

  // Define the key for storing incomes in shared preferences
  List<Transfer> transferList = [];

  static const String _transferKey = 'transfer';

  //save the income to shared preferences

  Future<void> saveTransfer(Transfer transfer, BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      List<String>? existingTransfer = prefs.getStringList(_transferKey);

      // convert the existing expenses to a list of income objects
      List<Transfer> existingTransferObject = [];

      if (existingTransfer != null) {
        existingTransferObject = existingTransfer
            .map((e) => Transfer.fromJSON(json.decode(e)))
            .toList();
      }

      // Add the new income to the list
      existingTransferObject.add(transfer);

      // convert the list of income  objects back to a list of strings
      List<String> updatedTransfer = existingTransferObject
          .map((e) => json.encode(e.toJSON()))
          .toList();

      // save the  updated list of incomes to shared preferences
      await prefs.setStringList(_transferKey, updatedTransfer);

      // show message

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Transfer successfully"),
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
  // Load the Transfer from shared preferenses

  Future<List<Transfer>> loadExpenses() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String>? existingTransfers = pref.getStringList(_transferKey);

    // Convert the existing expenses to a list of Expenseobjects

    List<Transfer> loadedTransfers = [];
    if (existingTransfers != null) {
      loadedTransfers = existingTransfers
          .map((e) => Transfer.fromJSON(json.decode(e)))
          .toList();
    }
    return loadedTransfers;
  }
}
