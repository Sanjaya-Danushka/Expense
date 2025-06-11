import 'package:flutter/material.dart';
import 'package:projectzero/constants/colors.dart';
import 'package:projectzero/constants/constants.dart';
import 'package:projectzero/widgets/income_expense_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //for store username
  String name = '';
  @override
  void initState() {
    super.initState();
    //get user name
    getUserData();
  }

  //get user name
  Future<void> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('name');
    if (name != null) {
      setState(() {
        this.name = name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //app bar
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  color: kMainColor.withAlpha(50),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: kMainColor,
                              border: Border.all(color: kMainColor, width: 3),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                'assets/images/user.jpg',
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Text(
                            'Welcome $name',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 20),
                          IconButton(
                            icon: Icon(
                              Icons.notifications,
                              color: kMainColor,
                              size: 28,
                            ),
                            onPressed: () {
                              //notification
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      //income expense card
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IncomeExpenseCard(
                            title: 'Income',
                            amount: 1000,
                            icon: 'assets/images/income.png',
                            color: kGreen,
                          ),
                          IncomeExpenseCard(
                            title: 'Expense',
                            amount: 1000,
                            icon: 'assets/images/expense.png',
                            color: kRed,
                          ),
                        ],
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
