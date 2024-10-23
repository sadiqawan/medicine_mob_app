import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}
final PageController pageController = PageController();
class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Stack(
        children: [
PageView(
              controller: pageController,
              children: [
                // ScreenOne(),
                // ScreenTwo(),
                // ScreenThree(),
              ],
            ),

            Positioned(

              child: Row(
                children: [
                   Positioned(
             
              child: InkWell(
                onTap: () {
                  // Get.to(() => SignUpScreen());
                },
                child: ElevatedButton(onPressed: (){}, child: Text("Skip")),
              ),
            ),
                  InkWell(
                    onTap: () {
                      if (pageController.page! < 2) {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      } else {
                        // Get.to(() => SignUpScreen());
                      }
                    },
                    child: ElevatedButton(onPressed: (){}, child: Text("Move To Next Page")),
                  ),
                ],
              ),
            ),
        ],
      ),
    ));
  }
}