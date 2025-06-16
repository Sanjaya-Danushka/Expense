import 'package:expenz/models/expence_model.dart';
import 'package:expenz/models/income_model.dart';
import 'package:expenz/screens/add_new.dart';
import 'package:expenz/screens/budget_screen.dart';
import 'package:expenz/screens/home_screen.dart';
import 'package:expenz/screens/profile_screen.dart';
import 'package:expenz/screens/transactions_screen.dart';
import 'package:expenz/services/expence_services.dart';
import 'package:expenz/services/income_services.dart';
import 'package:expenz/utils/colors.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // Define the list of incomes
  List<Expense> expensesList = [];
  List<Income> incomesList = [];

  //category total expenses
  Map<ExpenseCategory, double> calculateExpensesCategories() {
    Map<ExpenseCategory, double> categoryTotals = {
      ExpenseCategory.food: 0,
      ExpenseCategory.transport: 0,
      ExpenseCategory.shopping: 0,
      ExpenseCategory.health: 0,
      ExpenseCategory.subscription: 0,
    };

    for (Expense expense in expensesList) {
      categoryTotals[expense.category] =
          categoryTotals[expense.category]! + expense.amount;
    }

    //print the food category total
    // print(categoryTotals[ExpenseCategory.health].runtimeType);

    return categoryTotals;
  }

  //category total income
  Map<IncomeCategory, double> calculateIncomeCategories() {
    Map<IncomeCategory, double> categoryTotals = {
      IncomeCategory.salary: 0,
      IncomeCategory.freelance: 0,
      IncomeCategory.passive: 0,
      IncomeCategory.sales: 0,
    };

    for (Income income in incomesList) {
      categoryTotals[income.category] =
          categoryTotals[income.category]! + income.amount;
    }

    //print the food category total
    // print(categoryTotals[IncomeCategory.salary].runtimeType);

    return categoryTotals;
  }

  @override
  void initState() {
    super.initState();
    // Fetch all the expenses when the widget is first initialized
    setState(() {
      fetchExpenses();
      fetchIncomes();
    });
  }

  // Function to fetch expenses
  void fetchExpenses() async {
    // Load expenses from shared preferences
    List<Expense> loadedExpenses = await ExpenceService().loadExpenses();

    // Update expensesList with the fetched expenses
    setState(() {
      expensesList = loadedExpenses;
    });
  }

  // Function to add a new expense
  void addNewExpense(Expense newExpense) {
    // Save the new expense to shared preferences
    ExpenceService().saveExpense(newExpense, context);

    // Update the list of expenses
    setState(() {
      expensesList.add(newExpense);
    });
  }

  // Function to delete an expense
  void deleteExpense(Expense expense) {
    // Delete the expense from shared preferences
    ExpenceService().deleteExpense(expense.id, context);

    // Update the list of expenses
    setState(() {
      expensesList.remove(expense);
    });
  }

  //fetch incomes
  void fetchIncomes() async {
    // Load incomes from shared preferences
    List<Income> loadedIncomes = await IncomeServices().loadIncomes();

    // Update incomesList with the fetched incomes
    setState(() {
      incomesList = loadedIncomes;
    });
  }

  //Function to add new income
  void addNewIncome(Income newIncome) {
    // Save the new income to shared preferences
    IncomeServices().saveIncome(newIncome, context);

    // Update the list of incomes
    setState(() {
      incomesList.add(newIncome);
    });
  }

  // Function to delete an income
  void deleteIncome(Income income) {
    // Delete the income from shared preferences
    IncomeServices().deleteIncome(income.id, context);

    // Update the list of incomes
    setState(() {
      incomesList.remove(income);
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomeScreen(
        expensesList: expensesList,
      ),
      TransactionsScreen(
        expensesList: expensesList,
        onDismissedExpenses: deleteExpense,
        incomeList: incomesList,
        onDismissedIncome: deleteIncome,
      ),
      AddNewScreen(
        addExpense: addNewExpense,
        addIcome: addNewIncome,
      ),
      BudgetScreen(
        expenseCategoryTotals: calculateExpensesCategories(),
        incomeCategoryTotals: calculateIncomeCategories(),
      ),
      const ProfileScreen(),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: kWhite,
        selectedItemColor: kMainColor,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        items: [
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Home",
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.list_rounded,
            ),
            label: "Transactions",
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: kMainColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.add,
                color: kWhite,
                size: 30,
              ),
            ),
            label: "",
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.rocket,
            ),
            label: "Budget",
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: "Profile",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: pages[_selectedIndex],
    );
  }
}
