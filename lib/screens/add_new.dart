import 'package:expenz/models/expence_model.dart';
import 'package:expenz/models/income_model.dart';
import 'package:expenz/services/expence_services.dart';
import 'package:expenz/services/income_services.dart';
import 'package:expenz/utils/colors.dart';
import 'package:expenz/utils/constants.dart';
import 'package:expenz/widgets/custum_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddNewScreen extends StatefulWidget {
  final Function(Expense) addExpense;
  final Function(Income) addIcome;
  const AddNewScreen({
    super.key,
    required this.addExpense,
    required this.addIcome,
  });

  @override
  State<AddNewScreen> createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<AddNewScreen> {
  int _selected = 0;

  ExpenseCategory _expenceCategory = ExpenseCategory.health;
  IncomeCategory _incomeCategory = IncomeCategory.salary;
  DateTime _selectedDate = DateTime.now();
  DateTime _selectedTime = DateTime.now();

  //text controllers
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

 //dispose controllers when the widget is disposed to avoid memory leaks
  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _selected == 0 ? kRed : kGreen,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: kDefalutPadding),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                //selector
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefalutPadding),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: kWhite,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _selected = 0;
                              //clear text fields
                              _titleController.clear();
                              _amountController.clear();
                              _descriptionController.clear();
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: _selected == 1 ? kWhite : kRed,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 60),
                              child: Text(
                                "Expense",
                                style: TextStyle(
                                  color: _selected == 0 ? kWhite : kBlack,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _selected = 1;

                              //clear text fields
                              _titleController.clear();
                              _amountController.clear();
                              _descriptionController.clear();
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: _selected == 0 ? kWhite : kGreen,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 60,
                              ),
                              child: Text(
                                "Income",
                                style: TextStyle(
                                  color: _selected == 1 ? kWhite : kBlack,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefalutPadding),
                  child: Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "How Much?",
                          style: TextStyle(
                            color: kLightGrey.withOpacity(0.8),
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const TextField(
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

                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.3),
                  padding: const EdgeInsets.all(kDefalutPadding),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: kWhite,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //category selector from dropdown

                      Form(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            //category selector from dropdown

                            DropdownButtonFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15,
                                  horizontal: 20,
                                ),
                              ),
                              value: _selected == 0
                                  ? _expenceCategory
                                  : _incomeCategory,
                              icon: const Icon(
                                Icons.arrow_drop_down_circle_outlined,
                              ),
                              items: _selected == 0
                                  ? ExpenseCategory.values.map((category) {
                                      return DropdownMenuItem(
                                        value: category,
                                        child: Text(category.name),
                                      );
                                    }).toList()
                                  : IncomeCategory.values.map((category) {
                                      return DropdownMenuItem(
                                        value: category,
                                        child: Text(category.name),
                                      );
                                    }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _selected == 0
                                      ? _expenceCategory =
                                          value as ExpenseCategory
                                      : _incomeCategory =
                                          value as IncomeCategory;

                                  // print(_selected == 0
                                  //     ? _expenceCategory.name
                                  //     : _incomeCategory.name);
                                });
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            //title field

                            TextFormField(
                              controller: _titleController,
                              decoration: InputDecoration(
                                hintText: "Title",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15,
                                  horizontal: 20,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            //description field

                            TextFormField(
                              controller: _descriptionController,
                              decoration: InputDecoration(
                                hintText: "Description",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15,
                                  horizontal: 20,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),

                            //amount field

                            TextFormField(
                              controller: _amountController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: "Amount",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15,
                                  horizontal: 20,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            //Date picker

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2025),
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
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 10),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.calendar_month_outlined,
                                            color: kWhite,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
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

                                //show selected date
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  DateFormat.yMMMd().format(_selectedDate),
                                  style: const TextStyle(
                                    color: kGrey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(
                              height: 10,
                            ),
                            //Date picker

                            Row(
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
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 10),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.calendar_month_outlined,
                                            color: kWhite,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
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

                                //show selected date
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  DateFormat.jm().format(_selectedTime),
                                  style: const TextStyle(
                                    color: kGrey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Divider(
                              color: kLightGrey,
                              thickness: 5,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () async {
                                if (_selected == 0) {
                                  //create new expense
                                  List<Expense> loadedExpenses =
                                      await ExpenceService().loadExpenses();
                                  Expense expense = Expense(
                                    id: loadedExpenses.length +
                                        1, // Calculate ID based on loaded expenses
                                    title: _titleController.text,
                                    amount: _amountController.text.isEmpty
                                        ? 0
                                        : double.parse(_amountController.text),
                                    category: _expenceCategory,
                                    date: _selectedDate,
                                    time: _selectedTime,
                                    description: _descriptionController.text,
                                  );

                                  //add expense to the list

                                  widget.addExpense(expense);

                                  //clear text fields
                                  _titleController.clear();
                                  _amountController.clear();
                                  _descriptionController.clear();
                                } else {
                                  // Assuming a method to load income
                                  List<Income> loadedIncome =
                                      await IncomeServices().loadIncomes();
                                  Income income = Income(
                                    id: loadedIncome.length +
                                        1, // Calculate ID based on loaded income
                                    title: _titleController.text,
                                    amount: _amountController.text.isEmpty
                                        ? 0
                                        : double.parse(_amountController.text),
                                    category: _incomeCategory,
                                    date: _selectedDate,
                                    time: _selectedTime,
                                    description: _descriptionController.text,
                                  );

                                  //add income to the list
                                  widget.addIcome(income);

                                  //clear text fields
                                  _titleController.clear();
                                  _amountController.clear();
                                  _descriptionController.clear();
                                }
                              },
                              child: CustumButton(
                                buttonName: "Add",
                                buttonColor: _selected == 0 ? kRed : kGreen,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
