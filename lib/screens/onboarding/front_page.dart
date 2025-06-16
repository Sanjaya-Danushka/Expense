import 'package:expenz/utils/colors.dart';
import 'package:flutter/material.dart';

class FrontPage extends StatelessWidget {
  const FrontPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/logo.png",
            width: 100,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Text(
              "Expenz",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: kMainColor,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
