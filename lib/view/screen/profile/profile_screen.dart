import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:medicine_app/constant/color_const.dart';
import 'package:medicine_app/constant/styles_const.dart';
import 'package:medicine_app/controller/profile_controller/profile_controller.dart';
import 'package:medicine_app/view/components/buy_now_custom_btn.dart';
import 'package:medicine_app/view/components/profile_custom_icons.dart';
import 'package:medicine_app/view/screen/pharmacy_and_medicine_add/add_medicine_screen.dart';
import 'package:medicine_app/view/screen/pharmacy_and_medicine_add/add_pharmacy_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    ProfileController profileController = Get.put(ProfileController());
    final format = DateFormat('MMMM dd yyyy');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: kWhite,
        backgroundColor: kPrimaryColor, // Adjust color as needed
        title: Text(
          'Profile',
          style: largeTextWhiteBold,
        ),
      ),
      body: Column(
        children: [
          StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream: profileController.getUserDataStream(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  width: double.infinity,
                  color: kPrimaryColor,
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.04),
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: screenHeight * 0.06,
                            backgroundImage:
                                const AssetImage('assets/images/profile.png'),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'Update Your Pic',
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Flexible(
                                                    child: ElevatedButton(
                                                        onPressed: () {
                                                          profileController
                                                              .pickImageFrom(
                                                                  ImageSource
                                                                      .camera);
                                                          Get.back();
                                                        },
                                                        child: const Icon(
                                                            Icons.camera))),
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                Flexible(
                                                    child: ElevatedButton(
                                                        onPressed: () {
                                                          profileController
                                                              .pickImageFrom(
                                                                  ImageSource
                                                                      .gallery);
                                                          Get.back();
                                                        },
                                                        child: const Icon(Icons
                                                            .photo_camera_back))),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ));
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
                      SizedBox(height: screenHeight * 0.02),
                      Text(
                        'Loading..',
                        style: mediumTextWhiteBold,
                      ),
                      Text(
                        'Loading..',
                        style: smallTextWhiteBold,
                      ),
                      Text(
                        'Loading..',
                        style: smallTextWhiteBold,
                      ),
                      Text(
                        'Loading..',
                        style: smallTextWhiteBold,
                      ),
                    ],
                  ),
                );
              }
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              if (!snapshot.hasData ||
                  snapshot.data == null ||
                  !snapshot.data!.exists) {
                return const Center(child: Text('No data available'));
              }
              var userData = snapshot.data!.data();
              // Convert the Firestore Timestamp to DateTime
              DateTime? time = userData?['time'] != null
                  ? (userData?['time'] as Timestamp).toDate()
                  : null;
              return Container(
                width: double.infinity,
                color: kPrimaryColor,
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.04),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                            radius: screenHeight * 0.06,
                            backgroundImage: userData!['picture'] == null
                                ? const AssetImage('assets/images/profile.png')
                                : NetworkImage(userData!['picture'])),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Update Your Pic',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Flexible(
                                                  child: ElevatedButton(
                                                      onPressed: () {
                                                        profileController
                                                            .pickImageFrom(
                                                                ImageSource
                                                                    .camera);
                                                        Get.back();
                                                      },
                                                      child: const Icon(
                                                          Icons.camera))),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              Flexible(
                                                  child: ElevatedButton(
                                                      onPressed: () {
                                                        profileController
                                                            .pickImageFrom(
                                                                ImageSource
                                                                    .gallery);
                                                        Get.back();
                                                      },
                                                      child: const Icon(Icons
                                                          .photo_camera_back))),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ));
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
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      userData!['name'] ?? 'No Name',
                      style: mediumTextWhiteBold,
                    ),
                    Text(
                      userData?['email'] ?? 'No Email',
                      style: smallTextWhiteBold,
                    ),
                    Text(
                      userData?['pharmacy'] == null ? 'User' : 'Seller',
                      style: smallTextWhiteBold,
                    ),
                    Text(
                      time != null ? format.format(time) : 'No Time',
                      style: smallTextWhiteBold,
                    ),
                  ],
                ),
              );
            },
          ),
          // List of options
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(screenWidth * 0.04),
              children: [
                becomeSeller(),
               /* ProfileCustomIcons(
                    Icons.local_pharmacy_outlined, 'Add Pharmacy', context, () {
                  Get.to(const AddPharmacyScreen());
                }),
                ProfileCustomIcons(
                    Icons.local_pharmacy_outlined, 'Add Medicine', context, () {
                  Get.to(const AddMedicineScreen());
                }),*/
                ProfileCustomIcons(Icons.settings, 'Settings', context, () {}),
                ProfileCustomIcons(Icons.help, 'Help', context, () {}),
                ProfileCustomIcons(
                    Icons.privacy_tip, 'Privacy Policy', context, () {}),
                ProfileCustomIcons(Icons.logout, 'Logout', context, () {
                  Get.dialog(
                    AlertDialog(
                      backgroundColor: Colors.black,
                      // Set the background color of the dialog
                      title: const Text(
                        'Logout Confirmation',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      content: const Text(
                        'Are you sure you want to log out?',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Get.back(),
                          child: const Text(
                            'Cancel',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            profileController.logout();
                          },
                          child: const Text(
                            'Logout',
                            style: TextStyle(color: Colors.red, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// becomeSeller btn
Widget becomeSeller() {
  ProfileController controller = Get.put(ProfileController());
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: StreamBuilder(
        stream: controller.getUserDataStream(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return BuyNowCustomBtn(myText: 'Loading..', onTap: () {});
          }
          var userData = snapshot.data?.data();
          if (userData!['pharmacy'] == null) {
            return BuyNowCustomBtn(
                myText: 'Become Seller',
                onTap: () {
                  Get.to(() => AddPharmacyScreen());
                });
          } else {
            return BuyNowCustomBtn(
                myText: 'Add Medicine to Store',
                onTap: () {
                  Get.to(() => AddMedicineScreen());
                });
          }
        }),
  );
}
