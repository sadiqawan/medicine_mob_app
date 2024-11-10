import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../view/screen/auth/login/login_screen.dart';

class ProfileController extends GetxController {
  File? image;
  String imageUrl = '';

  // Stream to get user data
  Stream<DocumentSnapshot<Map<String, dynamic>>> getUserDataStream() {
    String uId = FirebaseAuth.instance.currentUser!.uid;
    return FirebaseFirestore.instance.collection('users').doc(uId).snapshots();
  }

  // Function to pick an image from the source and upload it
  Future<void> pickImageFrom(ImageSource source) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: source);
      if (pickedFile != null) {
        final image = File(pickedFile.path);
        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          final storageRef =
              FirebaseStorage.instance.ref().child('${user.uid}.jpg');
          await storageRef.putFile(image);
          final imageUrl = await storageRef.getDownloadURL();
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .update({'picture': imageUrl});

          Get.snackbar("Success", "Image updated successfully",
              snackPosition: SnackPosition.TOP, backgroundColor: Colors.green);
        } else {
          Get.snackbar('Error', 'User is not authenticated',
              snackPosition: SnackPosition.TOP, backgroundColor: Colors.red);
        }
      }
    } on FirebaseException catch (e) {
      if (e.code == 'unauthorized') {
        Get.snackbar('Error', 'You are not authorized to perform this action',
            snackPosition: SnackPosition.TOP, backgroundColor: Colors.red);
      } else {
        Get.snackbar('Error', 'Error: ${e.message}',
            snackPosition: SnackPosition.TOP, backgroundColor: Colors.red);
      }
      print("Firebase Exception: $e");
    } catch (e) {
      Get.snackbar('Error', 'Error: $e',
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.red);
      print("Error picking image: $e");
    }
  }

  Future<void> logout() async {
    try {
      final auth = FirebaseAuth.instance;
      await auth.signOut();
      final SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setBool('is_login', false);
      Get.offAll(const LoginScreen());
      Get.snackbar(
        "Success",
        'Successfully logout!',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green.withOpacity(.3),
      );
    } catch (e) {
      Get.snackbar(
        "Failed",
        'Failed!${e.toString()}',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red.withOpacity(.3),
      );
    }
  }

  // pharmacy work here
  File? pharmacyImageFile;
   // Store the selected image file

  // Method to pick an image from the specified source
  Future<File?> pickImageFromSource(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      pharmacyImageFile = File(pickedFile.path);
      return pharmacyImageFile;
    }
    return null;
  }

  Future<void> registerPharmacyWithImage(
      String pharmacyName, String phoneNo, String address,
      ) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      Get.snackbar('Error', 'User is not authenticated',
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.red);
      return;
    }

    try {
      // Step 1: Update the pharmacy name in the user's collection
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .update({'pharmacy': pharmacyName});

      // Step 2: Register the pharmacy in the public collection
      final pharmacyData = {
        'pharmacyName': pharmacyName,
        'phoneNo': phoneNo,
        'address': address,
        'pharmacyImage': null,
      };

      // Step 3: If an image source is provided, pick and upload the image
      if (pharmacyImageFile != null) {
        final storageRef = FirebaseStorage.instance.ref().child('$userId.jpg');
        await storageRef.putFile(pharmacyImageFile!);
        final imageUrl = await storageRef.getDownloadURL();
        pharmacyData['pharmacyImage'] = imageUrl;
      }
      Get.snackbar("Success", "Pharmacy has been registered successfully",
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.green);
      Get.back();

      // Step 4: Save pharmacy data in Firestore
      await FirebaseFirestore.instance
          .collection('pharmacies')
          .doc(userId)
          .set(pharmacyData);

      Get.snackbar("Success", "Pharmacy has been registered successfully",
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.green);
      Get.back();
    } on FirebaseException catch (e) {
      if (e.code == 'unauthorized') {
        Get.snackbar('Error', 'You are not authorized to perform this action',
            snackPosition: SnackPosition.TOP, backgroundColor: Colors.red);
      } else {
        Get.snackbar('Error', 'Error: ${e.message}',
            snackPosition: SnackPosition.TOP, backgroundColor: Colors.red);
      }
      print("Firebase Exception: $e");
    } catch (e) {
      Get.snackbar('Error', 'Error: $e',
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.red);
      print("Error registering pharmacy: $e");
    }
  }


  /* // Function to pick an image from the source and upload it
  Future<void> pickImageFromForPharmacy(ImageSource source) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: source);
      if (pickedFile != null) {
        final image = File(pickedFile.path);
        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          final storageRef =
              FirebaseStorage.instance.ref().child('${user.uid}.jpg');
          await storageRef.putFile(image);
          final imageUrl = await storageRef.getDownloadURL();
          await FirebaseFirestore.instance
              .collection('pharmacy')
              .doc(user.uid)
              .update({'pharmacyImage': imageUrl});

          Get.snackbar("Success", "Image updated successfully",
              snackPosition: SnackPosition.TOP, backgroundColor: Colors.green);
        } else {
          Get.snackbar('Error', 'User is not authenticated',
              snackPosition: SnackPosition.TOP, backgroundColor: Colors.red);
        }
      }
    } on FirebaseException catch (e) {
      if (e.code == 'unauthorized') {
        Get.snackbar('Error', 'You are not authorized to perform this action',
            snackPosition: SnackPosition.TOP, backgroundColor: Colors.red);
      } else {
        Get.snackbar('Error', 'Error: ${e.message}',
            snackPosition: SnackPosition.TOP, backgroundColor: Colors.red);
      }
      print("Firebase Exception: $e");
    } catch (e) {
      Get.snackbar('Error', 'Error: $e',
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.red);
      print("Error picking image: $e");
    }
  }

// registration of pharmacy
  Future<void> registerPharmacy(
      String pharmacyName, String phoneNo, String address) async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    try {
      // adding the name of the pharmacy to current user collection
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .update({'pharmacy': pharmacyName});
      // for public collection
      await FirebaseFirestore.instance
          .collection('pharmacies')
          .doc(userId)
          .set({
        'pharmacyName': pharmacyName,
        'phoneNo': phoneNo,
        'address': address,
        'pharmacyImage': null
      });
      Get.snackbar("Success", "Pharmacy has been registered successfully",
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.green);
      Get.back();
    } catch (e) {
      print(e.toString());
      Get.snackbar('Error', 'Error: ${e.toString()}',
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.red);
    }
  }*/

  // Medicine adding to pharmacy of current user.

  Future<void> medicineRegistration() async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection('user')
        .doc(userId)
        .collection('pharmacyMed')
        .doc()
        .set({});
  }
}
