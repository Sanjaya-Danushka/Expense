import 'package:flutter/material.dart';
import 'package:projectzero/screens/onbarding/front_page.dart';

class OnboardingScreens extends StatefulWidget {
  const OnboardingScreens({super.key});

  @override
  State<OnboardingScreens> createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              children: [
                //onbarding screes
                PageView(
                  children: [
                    FrontPage(),
                    Container(color: Colors.red),
                    Container(color: Colors.green),
                    Container(color: Colors.blue),
                    Container(color: Colors.yellow),
                  ],
                ),
              ],
            ),
          ),

          //bottom
        ],
      ),
    );
  }
}
