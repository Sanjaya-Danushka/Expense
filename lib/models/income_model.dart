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

  Income(
    this.id,
    this.title,
    this.amount,
    this.category,
    this.date,
    this.time,
    this.description,
  );
}
