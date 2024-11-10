import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/screen/auth/login/login_screen.dart';

class SignUpController extends GetxController {
  var userType = 'Customer'.obs; // Observable variable for user type
  var isLoading = false.obs;

  void setUserType(String type) {
    userType.value = type;
  }
  // Method to validate user input
  bool isValidInputs(TextEditingController nameController , TextEditingController emailController,TextEditingController passwordController) {
    if (nameController.text.trim().isEmpty) {
      Get.snackbar(
        'Invalid Input',
        'Please enter your name',
        backgroundColor: Colors.red.withOpacity(0.3),
      );
      return false;
    }
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

  // Method for user registration
  Future<void> signup(TextEditingController emailController,TextEditingController passwordController ,TextEditingController nameController,) async {
    try {
      isLoading.value = true;

      // Create a new user with Firebase Authentication
      FirebaseAuth auth = FirebaseAuth.instance;
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Store user data in Firestore
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      await firebaseFirestore.collection('users').doc(userCredential.user!.uid).set({
        'time': DateTime.now(),
        'name': nameController.text.trim(),
        'email': emailController.text.trim(),
        'picture': null,
        'pharmacy': null,
      });

      Get.snackbar(
        "Success",
        "Successfully signed up!",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green.withOpacity(0.3),
      );
      Get.offAll(() => const LoginScreen());
    } catch (error) {
      Get.snackbar(
        'Error',
        error.toString(),
        backgroundColor: Colors.red.withOpacity(0.3),
      );
    } finally {
      isLoading.value = false;
    }
  }
}
