import 'package:flutter/material.dart';
import 'package:projectzero/constants/colors.dart';

class FrontPage extends StatelessWidget {
  const FrontPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //image
        Image.asset('assets/images/logo.png', width: 100, fit: BoxFit.cover),
        //title
        SizedBox(height: 20),
        Center(
          child: Text(
            'Expense',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: kMainColor,
            ),
          ),
        ),
      ],
    );
  }
}
