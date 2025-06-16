import 'package:flutter/material.dart';

enum IncomeCategory { freelance, salary, sales, passive }

//category images
final Map<IncomeCategory, String> incomeCategoryImages = {
  IncomeCategory.freelance: "assets/images/freelance.png",
  IncomeCategory.salary: "assets/images/salary.png",
  IncomeCategory.sales: "assets/images/restaurant.png",
  IncomeCategory.passive: "assets/images/health.png",
};

//category calors
final Map<IncomeCategory, Color> incomeCategoryColors = {
  IncomeCategory.freelance: Colors.blue,
  IncomeCategory.salary: Colors.green,
  IncomeCategory.sales: Colors.red,
  IncomeCategory.passive: Colors.purple,
};

class Income {
  final int id;
  final String title;
  final double amount;
  final IncomeCategory category;
  final DateTime date;
  final DateTime time;
  final String description;

  Income({
    required this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
    required this.time,
    required this.description,
  });

  factory Income.fromJson(Map<String, dynamic> json) {
    return Income(
      id: json['id'],
      title: json['title'],
      amount: json['amount'],
      category: IncomeCategory.values.firstWhere(
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
