import 'package:flutter/material.dart';
import 'package:medicine_app/constant/styles_const.dart';

class ScreenThree extends StatefulWidget {
  const ScreenThree({super.key});

  @override
  State<ScreenThree> createState() => _ScreenThreeState();
}

class _ScreenThreeState extends State<ScreenThree> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                'assets/images/screen_three_bg.png',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: screenSize.height * 0.3,
              left: screenSize.width * 0.1,
              right: screenSize.width * 0.1,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Managing Medication Schedule",
                  style: largeText.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Positioned(
              left: screenSize.width * 0.1,
              bottom: screenSize.height * 0.23,
              right: screenSize.width * 0.1,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Simplifying Your Treatment Plan with Personalized Reminders and Tracking",
                  style: mediumText,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
