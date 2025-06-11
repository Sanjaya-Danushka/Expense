import 'package:flutter/material.dart';
import 'package:projectzero/screens/main_screen.dart';
import 'package:projectzero/screens/onboarding_screens.dart';

class Wrapper extends StatefulWidget {
  final bool showMainscreen;
  const Wrapper({super.key, required this.showMainscreen});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return widget.showMainscreen
        ? const MainScreen()
        : const OnboardingScreens();
  }
}
