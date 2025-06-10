import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  //store user datain shared referencess
  static Future<void> saveUserData(
    String name,
    String email,
    String password,
    String confirmPassword,
    BuildContext context,
  ) async {
    //if the password matches
    try {
      if (password != confirmPassword) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Password does not match')));
        return;
      }

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('name', name);
      await prefs.setString('email', email);
      await prefs.setString('password', password);
      await prefs.setString('confirmPassword', confirmPassword);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('User data saved successfully')));
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to save user data')));
    }
  }
}
