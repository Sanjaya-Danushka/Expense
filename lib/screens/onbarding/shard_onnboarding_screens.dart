import 'package:flutter/material.dart';
import 'package:projectzero/constants/colors.dart';
import 'package:projectzero/constants/constants.dart';

class OnboardingScreen extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const OnboardingScreen({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //image
          Image.asset(image, width: 300, fit: BoxFit.cover),
          //title
          SizedBox(height: 20),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w500,
              color: kMainColor,
            ),
          ),
          //description
          SizedBox(height: 20),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: kGray),
          ),
        ],
      ),
    );
  }
}
