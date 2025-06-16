import 'dart:convert';

import 'package:expenz/models/income_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IncomeServices {
  // Define the key for storing incomes in shared preferences
  static const String _incomeKey = 'income';

  // Save the income to shared preferences
  Future<void> saveIncome(Income income, BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String>? existingIncomes = prefs.getStringList(_incomeKey);

      // Convert the existing incomes to a list of Income objects
      List<Income> existingIncomeObject = [];
      if (existingIncomes != null) {
        existingIncomeObject = existingIncomes
            .map((e) => Income.fromJson(json.decode(e)))
            .toList();
      }

      // Add the new income to the list
      existingIncomeObject.add(income);

      // Convert the list of Income objects back to a list of strings
      List<String> updatedIncome =
          existingIncomeObject.map((e) => json.encode(e.toJson())).toList();

      // Save the updated list of incomes to shared preferences
      await prefs.setStringList(_incomeKey, updatedIncome);

      //show snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Income added successfully'),
          duration: Duration(seconds: 2),
        ),
      );
    } catch (e) {
      print(e.toString());
    }
  }

  //Load the income from shared preferences
  Future<List<Income>> loadIncomes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? existingIncomes = prefs.getStringList(_incomeKey);

    // Convert the existing incomes to a list of income objects
    List<Income> loadedIncomes = [];
    if (existingIncomes != null) {
      loadedIncomes =
          existingIncomes.map((e) => Income.fromJson(json.decode(e))).toList();
    }

    // Return the list of loaded incomes
    return loadedIncomes;
  }

  // Function to delete an income
  Future<void> deleteIncome(int id, BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String>? existingIncomes = prefs.getStringList(_incomeKey);

      // Convert the existing incomes to a list of Income objects
      List<Income> existingIncomeObjects = [];
      if (existingIncomes != null) {
        existingIncomeObjects = existingIncomes
            .map((e) => Income.fromJson(json.decode(e)))
            .toList();
      }

      // Remove the income with the given id from the list
      existingIncomeObjects.removeWhere((element) => element.id == id);

      // Convert the list of Income objects back to a list of strings
      List<String> updatedIncomes =
          existingIncomeObjects.map((e) => json.encode(e.toJson())).toList();

      // Save the updated list of incomes to shared preferences
      await prefs.setStringList(_incomeKey, updatedIncomes);

      //show snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Income deleted successfully'),
          duration: Duration(seconds: 2),
        ),
      );
    } catch (e) {
      print(e.toString());
    }
  }

  // Function to delete all incomes
  Future<void> deleteAllIncomes(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      // Clear all incomes from shared preferences
      await prefs.remove(_incomeKey);

      //show snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('All incomes deleted successfully'),
          duration: Duration(seconds: 2),
        ),
      );
    } catch (e) {
      print(e.toString());
    }
  }
}
