import 'package:flutter/material.dart';
import 'package:medicine_app/constant/styles_const.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
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
                'assets/images/screen_one_bg.png',
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
                  "Welcome to Medicine App Your Reliable Companion",
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
                  "Empowering You to Take Control of Your Health and Wellness Journey",
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
