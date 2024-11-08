import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine_app/constant/color_const.dart';
import 'package:medicine_app/view/screen/auth/login/login_screen.dart';
import 'package:medicine_app/view/screen/onboarding/screen_one.dart';
import 'package:medicine_app/view/screen/onboarding/screen_two.dart';
import 'package:medicine_app/view/screen/onboarding/screen_three.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

final PageController pageController = PageController();

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double padding = screenSize.width * 0.05;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: pageController,
              children: const [
                ScreenOne(),
                ScreenTwo(),
                ScreenThree(),
              ],
            ),
            Positioned(
              bottom: padding,
              left: padding,
              right: padding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(() => const LoginScreen());
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        color: kLighyGrayColor,
                        fontSize: screenSize.width * 0.04,
                      ),
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: pageController,
                    count: 3,
                    effect: WormEffect(
                      dotColor: kInActiveDotColor,
                      activeDotColor: kActiveDotColor,
                      dotHeight: screenSize.height * 0.02,
                      dotWidth: screenSize.height * 0.02,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (pageController.page != null && pageController.page! < 2) {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      } else {
                        Get.to(() => const LoginScreen());
                      }
                    },
                    child: Text(
                      "Next",
                      style: TextStyle(
                        color: kPinkColor,
                        fontSize: screenSize.width * 0.04,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
