import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine_app/view/screen/auth/login/login_screen.dart';
import 'package:medicine_app/view/screen/navigation/navigation_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkIfAlreadyLogggedIn();
  }

  checkIfAlreadyLogggedIn() async {
    var pref = await SharedPreferences.getInstance();
    var v = pref.get("is_login");
    if (v == true && v != null) {
      Timer(
        const Duration(seconds: 3),
        () => Get.offAll(NavigationScreen()),
      );
    } else {
      Timer(const Duration(seconds: 3), () => Get.offAll(const LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SizedBox(
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
