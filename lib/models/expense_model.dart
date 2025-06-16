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

  Expense({
    required this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
    required this.time,
    required this.description,
  });

  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
      id: json['id'],
      title: json['title'],
      amount: json['amount'],
      category: ExpenseCategory.values.firstWhere(
        (e) => e.name == json['category'],
      ),
      date: DateTime.parse(json['date']),
      time: DateTime.parse(json['time']),
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'category': category.name,
      'date': date.toIso8601String(),
      'time': time.toIso8601String(),
      'description': description,
    };
  }
}
