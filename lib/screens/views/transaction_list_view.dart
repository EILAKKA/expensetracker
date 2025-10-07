import 'package:flutter/material.dart';
// ✅ DateFormat import

class TransactionListView extends StatelessWidget {
  const TransactionListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("All Transactions")),
      body: Column(children: [
          
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/add',
          ); // ✅ navigate to AddTransactionPage
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
