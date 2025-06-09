import 'package:flutter/material.dart';
import 'package:projectzero/constants/colors.dart';
import 'package:projectzero/data/onboarding_data.dart';
import 'package:projectzero/screens/onbarding/front_page.dart';
import 'package:projectzero/screens/onbarding/shard_onnboarding_screens.dart';
import 'package:projectzero/screens/user_datascreen.dart';
import 'package:projectzero/widgets/custome_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreens extends StatefulWidget {
  const OnboardingScreens({super.key});

  @override
  State<OnboardingScreens> createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  final PageController _pageController = PageController();
  bool showDetailsPage = false;

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
                  controller: _pageController,
                  children: [
                    FrontPage(),
                    OnboardingScreen(
                      title: OnboardingData.onboardingList[0].title,
                      description: OnboardingData.onboardingList[0].description,
                      image: OnboardingData.onboardingList[0].image,
                    ),
                    OnboardingScreen(
                      title: OnboardingData.onboardingList[1].title,
                      description: OnboardingData.onboardingList[1].description,
                      image: OnboardingData.onboardingList[1].image,
                    ),
                    OnboardingScreen(
                      title: OnboardingData.onboardingList[2].title,
                      description: OnboardingData.onboardingList[2].description,
                      image: OnboardingData.onboardingList[2].image,
                    ),
                  ],
                ),
                //page indicator
                Container(
                  alignment: Alignment(0, 0.75),
                  margin: const EdgeInsets.only(bottom: 50),
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: 4,
                    effect: WormEffect(
                      activeDotColor: kMainColor,
                      dotColor: kLightGray,
                    ),
                  ),
                ),
                //navigation button
                Positioned(
                  bottom: 30,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: !showDetailsPage
                        ? GestureDetector(
                            onTap: () {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                              if (_pageController.page == 3) {
                                showDetailsPage = true;
                              }
                            },
                            child: CustomButton(
                              text: 'Next',
                              color: kMainColor,
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const UserDatascreen(),
                                ),
                              );
                            },
                            child: CustomButton(
                              text: 'Done',
                              color: kMainColor,
                            ),
                          ),
                  ),
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
