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
                border: Border.all(),
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
                border: Border.all(),
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
                border: Border.all(),
              ),
            ],
          )
        : Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
            decoration: BoxDecoration(
              color: clickedValue == 0
                  ? kGreen
                  : clickedValue == 1
                  ? kRed
                  : kBlue,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        decoration: BoxDecoration(
                          color: kWhite,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            ButtonTab(
                              label: 'Income',
                              color: clickedValue == 0
                                  ? kGreen
                                  : kGreen.withValues(alpha: 0.2),
                              titleColor: clickedValue != 0 ? kBlack : kWhite,
                              onTap: () {
                                setState(() {
                                  if (clickedValue != 0) {
                                    clickedValue = 0;
                                  }
                                });
                              },
                              border: clickedValue != 0
                                  ? Border.all()
                                  : Border.all(width: 2),
                            ),
                            ButtonTab(
                              label: 'Expense',
                              color: clickedValue == 1
                                  ? kRed
                                  : kRed.withValues(alpha: 0.2),
                              titleColor: clickedValue != 1 ? kBlack : kWhite,
                              onTap: () {
                                setState(() {
                                  if (clickedValue != 1) {
                                    clickedValue = 1;
                                  }
                                });
                              },
                              border: clickedValue != 1
                                  ? Border.all()
                                  : Border.all(width: 2),
                            ),
                            ButtonTab(
                              label: 'Transfer',
                              color: clickedValue == 2
                                  ? kBlue
                                  : kBlue.withValues(alpha: 0.2),
                              titleColor: clickedValue != 2 ? kBlack : kWhite,
                              onTap: () {
                                setState(() {
                                  if (clickedValue != 2) {
                                    clickedValue = 2;
                                  }
                                });
                              },
                              border: clickedValue != 2
                                  ? Border.all()
                                  : Border.all(width: 2),
                            ),
                          ],
                        ),
                      ),
                      TxData.txViews[clickedValue],
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
