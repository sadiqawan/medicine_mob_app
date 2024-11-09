import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../view/screen/auth/login/login_screen.dart';
import '../../view/screen/navigation/navigation_screen.dart';

class LoginController extends GetxController {
  final  emailController = TextEditingController();
  final  passwordController = TextEditingController();
  final  forgetController = TextEditingController();
  var isLoading = false.obs;

  // Method to validate email and password input
  bool isValidLoginInputs() {
    if (emailController.text.trim().isEmpty || !GetUtils.isEmail(emailController.text.trim())) {
      Get.snackbar(
        'Invalid Input',
        'Please enter a valid email',
        backgroundColor: Colors.red.withOpacity(0.3),
      );
      return false;
    }
    if (passwordController.text.trim().isEmpty || passwordController.text.trim().length < 6) {
      Get.snackbar(
        'Invalid Input',
        'Password should be at least 6 characters',
        backgroundColor: Colors.red.withOpacity(0.3),
      );
      return false;
    }
    return true;
  }

  // Login
  Future<void> login() async {
    if (!isValidLoginInputs()) return;

    try {
      isLoading.value = true;
      FirebaseAuth auth = FirebaseAuth.instance;
      await auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      Get.snackbar(
        "Success",
        "Successfully logged in",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green.withOpacity(.3),
      );
      final SharedPreferences pref = await SharedPreferences.getInstance();

      await pref.setBool('is_login', true);

      Get.offAll(() =>  NavigationScreen());
    } catch (e) {
      Get.snackbar(
        'Login Failed',
        'Error: ${e.toString()}',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red.withOpacity(.3),
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Method to validate email input for password reset
  bool isValidForgetInput() {
    if (forgetController.text.trim().isEmpty || !GetUtils.isEmail(forgetController.text.trim())) {
      Get.snackbar(
        'Invalid Input',
        'Please enter a valid email',
        backgroundColor: Colors.red.withOpacity(0.3),
      );
      return false;
    }
    return true;
  }

  // Reset password
  Future<void> sendPasswordResetEmail() async {
    if (!isValidForgetInput()) return;

    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      isLoading.value = true;
      await auth.sendPasswordResetEmail(email: forgetController.text.trim());

      Get.snackbar(
        "Success",
        'Password reset email sent to ${forgetController.text.trim()}',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green.withOpacity(.3),
      );

      Get.offAll(() => const LoginScreen());
    } catch (e) {
      Get.snackbar(
        "Failed",
        'Failed to send password reset email',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red.withOpacity(.3),
      );
    } finally {
      isLoading.value = false;
    }
  }
}