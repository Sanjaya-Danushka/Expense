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
        // ignore: use_build_context_synchronously
        context,
      ).showSnackBar(SnackBar(content: Text('User data saved successfully')));
    } catch (e) {
      ScaffoldMessenger.of(
        // ignore: use_build_context_synchronously
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to save user data')));
    }
  }

  //get user data from shared preferences
  static Future<bool> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? name = prefs.getString('name');
    return name != null;
  }
  //get user name and email
  static Future<Map<String, String>> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? name = prefs.getString('name');
    String? email = prefs.getString('email');
    return {'name': name!, 'email': email!};
  }

}
