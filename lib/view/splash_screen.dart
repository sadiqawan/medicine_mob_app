import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine_app/view/screen/home/home_screen.dart';
import 'package:medicine_app/view/screen/onboarding/onboarding_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
   
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Get.to(()=>const OnboardingScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        body: Center(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
            fit: BoxFit.cover,
              'assets/images/splash.png',
            ),
          ),
        ),
      ),
    );
  }
}
