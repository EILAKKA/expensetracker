import 'package:expenstracker/constants/colors.dart';
import 'package:expenstracker/models/expense_model.dart';
import 'package:expenstracker/widgets/expense_card.dart';
import 'package:flutter/material.dart';
// ✅ DateFormat import

class TransactionListView extends StatefulWidget {
  final List<Expense> expenseList;
  const TransactionListView({super.key, required this.expenseList});

  @override
  State<TransactionListView> createState() => _TransactionListViewState();
}

class _TransactionListViewState extends State<TransactionListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "See your financial report",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: kMainColor,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Expences",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: kBlack,
              ),
            ),
            SizedBox(height: 20),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: widget.expenseList.length,
                      itemBuilder: (context, index) {
                        final expense = widget.expenseList[index];
                        return ExpenseCard(
                          date: expense.date,
                          amount: expense.amount,
                          category: expense.category,
                          description: expense.description,
                          time: expense.time,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
