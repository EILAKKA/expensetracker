import 'package:expenstracker/constants/colors.dart';
import 'package:expenstracker/data/tx_data.dart';
import 'package:expenstracker/widgets/button_tab.dart';
import 'package:flutter/material.dart';

// ✅ import lists
class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({super.key});
  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  bool isClicked = true;
  int clickedValue = 0;
  @override
  Widget build(BuildContext context) {
    return isClicked
        ? Column(
            children: [
              ButtonTab(
                label: 'Transfer',
                color: kBlue,
                onTap: () {
                  setState(() {
                    if (isClicked) {
                      isClicked = !isClicked;
                    }
                    if (clickedValue != 2) {
                      clickedValue = 2;
                    }
                  });
                },
              ),
              ButtonTab(
                label: 'Expense',
                color: kRed,
                onTap: () {
                  setState(() {
                    if (isClicked) {
                      isClicked = !isClicked;
                    }
                    if (clickedValue != 1) {
                      clickedValue = 1;
                    }
                  });
                },
              ),
              ButtonTab(
                label: 'Income',
                color: kGreen,
                onTap: () {
                  setState(() {
                    if (isClicked) {
                      isClicked = !isClicked;
                    }
                    if (clickedValue != 0) {
                      clickedValue = 0;
                    }
                  });
                },
              ),
            ],
          )
        : Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: clickedValue == 0
                  ? kGreen
                  : clickedValue == 1
                  ? kRed
                  : kBlue,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    ButtonTab(
                      label: 'Income',
                      color: kGreen,
                      onTap: () {
                        setState(() {
                          if (clickedValue != 0) {
                            clickedValue = 0;
                          }
                        });
                      },
                    ),
                    ButtonTab(
                      label: 'Expense',
                      color: kRed,
                      onTap: () {
                        setState(() {
                          if (clickedValue != 1) {
                            clickedValue = 1;
                          }
                        });
                      },
                    ),
                    ButtonTab(
                      label: 'Transfer',
                      color: kBlue,
                      onTap: () {
                        setState(() {
                          if (clickedValue != 2) {
                            clickedValue = 2;
                          }
                        });
                      },
                    ),
                  ],
                ),
                TxData.txViews[clickedValue],
              ],
            ),
          );
  }
}
