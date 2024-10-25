import 'package:flutter/material.dart';
import 'package:medicine_app/constant/styles_const.dart';

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({super.key});

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
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
                'assets/images/screen_two_bg.png',
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
                  "View Medicine Online \nand Contact Pharmacy",
                  style: largePrimaryText,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Positioned(
              left: screenSize.width * 0.1,
              bottom: screenSize.height * 0.20,
              right: screenSize.width * 0.1,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Easily Access Medications and Connect with Your Local Pharmacy for Assistance",
                  style: mediumPrimaryText,
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
