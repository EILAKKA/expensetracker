import 'package:flutter/material.dart';

// ✅ import lists
class AddTransactionPage extends StatefulWidget {
  final String? receivedValue;
  const AddTransactionPage({super.key, this.receivedValue});
  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Add Transaction")));
  }
}
