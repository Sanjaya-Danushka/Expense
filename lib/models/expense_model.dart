import 'package:flutter/material.dart';

enum ExpenseCategory { food, transport, health, entertainment, other }

//category images
final Map<ExpenseCategory, String> expenseCategoryImages = {
  ExpenseCategory.food: "assets/images/car.png",
  ExpenseCategory.transport: "assets/images/bag.png",
  ExpenseCategory.health: "assets/images/health.png",
  ExpenseCategory.entertainment: "assets/images/restaurant.png",
  ExpenseCategory.other: "assets/images/salary.png",
};

//category calors
final Map<ExpenseCategory, Color> expenseCategoryColors = {
  ExpenseCategory.food: Colors.red,
  ExpenseCategory.transport: Colors.blue,
  ExpenseCategory.health: Colors.green,
  ExpenseCategory.entertainment: Colors.purple,
  ExpenseCategory.other: Colors.grey,
};

class Expense {
  final int id;
  final String title;
  final double amount;
  final ExpenseCategory category;
  final DateTime date;
  final DateTime time;
  final String description;

  Expense(
    this.id,
    this.title,
    this.amount,
    this.category,
    this.date,
    this.time,
    this.description,
  );
}
