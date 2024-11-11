import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medicine_app/controller/profile_controller/profile_controller.dart';

import '../../../constant/styles_const.dart';
import '../../components/buy_now_custom_btn.dart';

class AddPharmacyScreen extends StatefulWidget {
  const AddPharmacyScreen({super.key});

  @override
  State<AddPharmacyScreen> createState() => _AddPharmacyScreenState();
}

class _AddPharmacyScreenState extends State<AddPharmacyScreen> {
  final ProfileController controller = Get.put(ProfileController());
  final TextEditingController pharmaNameController = TextEditingController();
  final TextEditingController contactNoController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  void dispose() {
    pharmaNameController.dispose();
    contactNoController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: controller.getUserDataStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.orange),
              );
            }

            // Check if data exists and `pharmacy` is null
            var userData = snapshot.data?.data();
            if (userData == null || userData['pharmacy'] == null) {
              // Show the registration column if `pharmacy` is null
              return Column(
                children: [
                  Center(
                    child: Text(
                      'Register your pharmacy',
                      style: largePrimaryText,
                    ),
                  ),
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.orange,
                        radius: screenHeight * 0.06,
                        child: controller.pharmacyImageFile == null
                            ? const Icon(
                          Icons.local_pharmacy_outlined,
                          size: 30,
                        )
                            : Image.file(
                          controller.pharmacyImageFile!,
                          fit: BoxFit.cover, // Optional: fills the circle
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                          onTap: () {
                            Get.bottomSheet(
                              backgroundColor: Colors.orange,
                              SizedBox(
                                height: 200,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Update Your Pic',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () async {
                                              // Pick image from camera
                                              final pickedFile = await controller.pickImageFromSource(ImageSource.camera);
                                              if (pickedFile != null) {
                                                controller.pharmacyImageFile = pickedFile;
                                              }
                                              Get.back();
                                            },
                                            child: const Icon(Icons.camera),
                                          ),
                                          ElevatedButton(
                                            onPressed: () async {
                                              // Pick image from gallery
                                              final pickedFile = await controller.pickImageFromSource(ImageSource.gallery);
                                              if (pickedFile != null) {
                                                controller.pharmacyImageFile = pickedFile;
                                              }
                                              Get.back();
                                            },
                                            child: const Icon(Icons.photo_camera_back),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          child: CircleAvatar(
                            radius: screenHeight * 0.02,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.edit,
                              color: Colors.orange,
                              size: screenHeight * 0.02,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: pharmaNameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                      ),
                      hintText: "Enter Pharmacy Name",
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: contactNoController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                      ),
                      hintText: "Enter your contact",
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: addressController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                      ),
                      hintText: "Enter Pharmacy Address",
                    ),
                  ),
                  const Spacer(),
                  BuyNowCustomBtn(
                    myText: 'Register Now',
                    onTap: () {
                      try {
                        print('click');
                        controller.registerPharmacyWithImage(
                          pharmaNameController.text.trim(),
                          contactNoController.text.trim(),
                          addressController.text.trim(),
                        );
                      } catch (e) {
                        print(e.toString());
                      }
                    },
                  ),
                ],
              );
            } else {
              // Show the thank you message if `pharmacy` is not null
              return Center(
                child: Text(
                  'Thank you! Your pharmacy has already been registered.',
                  style: smallPrimaryBoldItalicText,
                ),
              );
            }
          },
        ),

      ),
    );
  }
}
