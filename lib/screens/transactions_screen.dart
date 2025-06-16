import 'package:expenz/models/expence_model.dart';
import 'package:expenz/models/income_model.dart';
import 'package:expenz/utils/colors.dart';
import 'package:expenz/utils/constants.dart';
import 'package:expenz/widgets/expence_card.dart';
import 'package:expenz/widgets/income_card.dart';
import 'package:flutter/material.dart';

class TransactionsScreen extends StatefulWidget {
  final List<Expense> expensesList;
  final void Function(Expense) onDismissedExpenses;

  final List<Income> incomeList;
  final void Function(Income) onDismissedIncome;

  const TransactionsScreen({
    super.key,
    required this.expensesList,
    required this.onDismissedExpenses,
    required this.incomeList,
    required this.onDismissedIncome,
  });

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(kDefalutPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "See your financial report",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: kMainColor,
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              const Text(
                "Expenses",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: kBlack,
                ),
              ),

              // Show all the expenses
              const SizedBox(
                height: 20,
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
                child: SingleChildScrollView(
                  // Wrap with SingleChildScrollView to make the content scrollable
                  child: Column(
                    // Wrap with Column to ensure proper layout
                    children: [
                      widget.expensesList.isEmpty
                          ? const Text(
                              "No expenses added yet, add some expenses to see here",
                              style: TextStyle(
                                fontSize: 16,
                                color: kGrey,
                              ),
                            )
                          : ListView.builder(
                              shrinkWrap:
                                  true, // Set shrinkWrap to true to allow the ListView to adapt to its content size
                              scrollDirection: Axis.vertical,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: widget.expensesList.length,
                              itemBuilder: (context, index) {
                                final expense = widget.expensesList[index];
                                return Dismissible(
                                  key: ValueKey(expense),
                                  direction: DismissDirection.startToEnd,
                                  onDismissed: (direction) {
                                    setState(() {
                                      widget.onDismissedExpenses(expense);
                                    });
                                  },
                                  child: ExpenceCard(
                                    title: expense.title,
                                    date: expense.date,
                                    amount: expense.amount,
                                    category: expense.category,
                                    description: expense.description,
                                    createdAt: expense.time,
                                  ),
                                );
                              },
                            ),
                    ],
                  ),
                ),
              ),

              const Text(
                "Income",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: kBlack,
                ),
              ),

              // Show all the expenses
              const SizedBox(
                height: 20,
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      widget.incomeList.isEmpty
                          ? const Text(
                              "No incomes added yet, add some incomes to see here",
                              style: TextStyle(
                                fontSize: 16,
                                color: kGrey,
                              ),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: widget.incomeList.length,
                              itemBuilder: (context, index) {
                                final income = widget.incomeList[index];
                                return Dismissible(
                                  key: ValueKey(income),
                                  direction: DismissDirection.startToEnd,
                                  onDismissed: (direction) {
                                    setState(() {
                                      widget.onDismissedIncome(income);
                                    });
                                  },
                                  child: IncomeCard(
                                    title: income.title,
                                    date: income.date,
                                    amount: income.amount,
                                    category: income.category,
                                    description: income.description,
                                    createdAt: income.time,
                                  ),
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
      ),
    );
  }
}
