import 'package:flutter/material.dart';
import 'package:projectzero/screens/onboarding_screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense',
      theme: ThemeData(fontFamily: 'Inter', primarySwatch: Colors.blue),
      home: const OnboardingScreens(),
    );
  }
}
