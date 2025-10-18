import 'package:expenstracker/constants/colors.dart';
import 'package:expenstracker/models/expense_model.dart';

import 'package:expenstracker/models/transfer_model.dart';
import 'package:expenstracker/services/expense_service.dart';
import 'package:expenstracker/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddExpenseView extends StatefulWidget {
  final Function(Expense) addExpense;
  const AddExpenseView({super.key, required this.addExpense});

  @override
  State<AddExpenseView> createState() => _AddExpenseViewState();
}

class _AddExpenseViewState extends State<AddExpenseView> {
  ExpenseCategory expenseCategory = ExpenseCategory.subscription;
  PaymentMethod paymentMethodEx = PaymentMethod.cash;
  final TextEditingController _amountControllerEx = TextEditingController();

  final TextEditingController _noteControllerEx = TextEditingController();

  DateTime _selectedDate = DateTime.now();
  DateTime _selectedTime = DateTime.now();

  @override
  void dispose() {
    _amountControllerEx.dispose();

    _noteControllerEx.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "How Much?",
                  style: TextStyle(
                    color: kLightGrey.withValues(alpha: 0.8),
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextField(
                  controller: _amountControllerEx,
                  style: TextStyle(
                    fontSize: 60,
                    color: kWhite,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    hintText: "0",
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: kWhite,
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // user data form
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.53,
          decoration: BoxDecoration(
            color: kWhite,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Form(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // category selector Dropdow
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      items: ExpenseCategory.values
                          .map(
                            (category) => DropdownMenuItem(
                              value: category,
                              child: Text(category.name),
                            ),
                          )
                          .toList(),
                      initialValue: expenseCategory,
                      onChanged: (value) {
                        setState(() {
                          expenseCategory = value!;
                        });
                      },
                    ),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      items: PaymentMethod.values
                          .map(
                            (paymentMethod) => DropdownMenuItem(
                              value: paymentMethod,
                              child: Text(paymentMethod.name),
                            ),
                          )
                          .toList(),
                      initialValue: paymentMethodEx,
                      onChanged: (value) {
                        setState(() {
                          paymentMethodEx = value!;
                        });
                      },
                    ),

                    TextFormField(
                      controller: _noteControllerEx,
                      decoration: InputDecoration(
                        hintText: "Description",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 20,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _amountControllerEx,
                      decoration: InputDecoration(
                        hintText: "Amount",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 20,
                        ),
                      ),
                    ),
                    // date  time picker
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showDatePicker(
                                  context: context,
                                  firstDate: DateTime(2020),
                                  lastDate: DateTime(2030),
                                  initialDate: DateTime.now(),
                                ).then((value) {
                                  if (value != null) {
                                    setState(() {
                                      _selectedDate = value;
                                    });
                                  }
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: kMainColor,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.calendar_month, color: kWhite),
                                      SizedBox(width: 10),
                                      Text(
                                        "Select Date",
                                        style: TextStyle(
                                          color: kWhite,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              DateFormat.yMMMMEEEEd().format(_selectedDate),
                              style: TextStyle(
                                color: kGrey,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ).then((value) {
                                  if (value != null) {
                                    setState(() {
                                      _selectedTime = DateTime(
                                        _selectedDate.year,
                                        _selectedDate.month,
                                        _selectedDate.day,
                                        value.hour,
                                        value.minute,
                                      );
                                    });
                                  }
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: kYellow,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.punch_clock, color: kWhite),
                                      SizedBox(width: 10),
                                      Text(
                                        "Select Time",
                                        style: TextStyle(
                                          color: kWhite,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              DateFormat.jm().format(_selectedTime),
                              style: TextStyle(
                                color: kGrey,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Divider(color: kLightGrey, thickness: 5),

                    GestureDetector(
                      onTap: () async {
                        List<Expense> loadedExpenses = await ExpenseService()
                            .loadExpenses();

                        Expense expense = Expense(
                          id: loadedExpenses.length + 1,
                          amount: _amountControllerEx.text.isEmpty
                              ? 0
                              : double.parse(_amountControllerEx.text),
                          category: expenseCategory,
                          paymentMethod: paymentMethodEx,
                          date: _selectedDate,
                          time: _selectedTime,
                          description: _noteControllerEx.text,
                        );
                        widget.addExpense(expense);

                        _amountControllerEx.clear();
                        _noteControllerEx.clear();
                      },
                      child: CustomButton(
                        buttonName: "Add Expense",
                        buttonColor: kRed,
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
