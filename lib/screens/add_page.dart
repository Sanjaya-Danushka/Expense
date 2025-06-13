import 'package:flutter/material.dart';
import 'package:projectzero/constants/colors.dart';
import 'package:projectzero/constants/constants.dart';
import 'package:projectzero/models/expense_model.dart';
import 'package:projectzero/models/income_model.dart';

class AddNewScreen extends StatefulWidget {
  const AddNewScreen({super.key});

  @override
  State<AddNewScreen> createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<AddNewScreen> {
  //state for the selected tab
  int selectedTab = 0;
  ExpenseCategory expenseCategory = ExpenseCategory.food;
  IncomeCategory incomeCategory = IncomeCategory.salary;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: selectedTab == 0 ? kRed : kGreen,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(kDefaultPadding),
                  child: Container(
                    //expense and income menu
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: kWhite,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedTab = 0;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: selectedTab == 0 ? kRed : kWhite,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 60,
                                vertical: 10,
                              ),
                              child: Text(
                                'Expense',
                                style: TextStyle(
                                  color: selectedTab == 0 ? kWhite : kGray,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedTab = 1;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: selectedTab == 1 ? kGreen : kWhite,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 60,
                                vertical: 10,
                              ),
                              child: Text(
                                'Income',
                                style: TextStyle(
                                  color: selectedTab == 1 ? kWhite : kGray,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //amount feild
                Padding(
                  padding: EdgeInsets.all(kDefaultPadding),
                  child: Container(
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.1,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        //title
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: kDefaultPadding,
                          ),
                          child: Text(
                            'How much?',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                              color: kLightGray.withAlpha(80),
                            ),
                          ),
                        ),
                        TextField(
                          style: TextStyle(
                            color: kWhite,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '0',
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
                //user data form
                Container(
                  height: MediaQuery.of(context).size.height * 0.52,
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.3,
                  ),
                  decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),

                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Form(
                      child: Column(
                        children: [
                          //category selector
                          DropdownButtonFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: kDefaultPadding,
                                horizontal: 20,
                              ),
                              hintText: 'Select Category',
                              hintStyle: TextStyle(
                                color: kGray,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            items: selectedTab == 0
                                ? ExpenseCategory.values.map((category) {
                                    return DropdownMenuItem(
                                      value: category,
                                      child: Text(category.name),
                                    );
                                  }).toList()
                                : IncomeCategory.values.map((category) {
                                    return DropdownMenuItem(
                                      value:category,
                                      child: Text(category.name),
                                    );
                                  }).toList(),
                            value: selectedTab == 0 ? expenseCategory : incomeCategory,
                            onChanged: (value) {
                              setState(() {
                                selectedTab == 0
                                    ? expenseCategory = value as ExpenseCategory
                                    : incomeCategory = value as IncomeCategory;
                              });
                            },
                          ),
                          SizedBox(height: kDefaultPadding),
                          //title
                          TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: kDefaultPadding,
                                horizontal: 20,
                              ),
                              hintText: 'Title',
                              hintStyle: TextStyle(
                                color: kGray,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(height: kDefaultPadding),
                          //description
                          TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: kDefaultPadding,
                                horizontal: 20,
                              ),
                              hintText: 'Description',
                              hintStyle: TextStyle(
                                color: kGray,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(height: kDefaultPadding),
                          //description
                          TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: kDefaultPadding,
                                horizontal: 20,
                              ),
                              hintText: 'Amount',
                              hintStyle: TextStyle(
                                color: kGray,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
