import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine_app/constant/color_const.dart';
import 'package:medicine_app/constant/styles_const.dart';
import 'package:medicine_app/controller/profile_controller/profile_controller.dart';
import 'package:medicine_app/view/screen/customer/all_medicine_screen.dart';
import 'package:medicine_app/view/screen/customer/all_pharmacies_screen.dart';
import 'package:medicine_app/view/screen/customer/medicine_detail_screen.dart';
import 'package:medicine_app/view/screen/customer/seller_detial_screen.dart';
import '../../../controller/customer_main_home_screen_controller/customer_main_controller.dart';

class CustomerMainHomeScreen extends StatefulWidget {
  const CustomerMainHomeScreen({super.key});

  @override
  State<CustomerMainHomeScreen> createState() => _CustomerMainHomeScreenState();
}

class _CustomerMainHomeScreenState extends State<CustomerMainHomeScreen> {
  CustomerMainController customerMainController =
      Get.put(CustomerMainController());

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: screenHeight * 0.2,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xff1D2A4D),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.04),
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        userImage(context),
                        logoutConformation(context)
                      ],
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          userName(),
                          Text(
                            "Welcome To Medicine App",
                            style: mediumTextWhite,
                          ),
                          SizedBox(height: screenHeight * 0.01),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            SizedBox(height: screenHeight * 0.01),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Medicine",
                    style: largePrimaryBoldText,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => AllMedicineScreen());
                    },
                    child: Text(
                      "See All",
                      style: mediumPrimaryBoldText,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: screenWidth * 0.95,
              height: screenHeight * 0.25,
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.02),
                child: getAllMedicine(context),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Top Seller", style: largePrimaryBoldText),
                  InkWell(
                    onTap: () {
                      Get.to(() => AllPharmaciesScreen());
                    },
                    child: Text(
                      "See All",
                      style: mediumPrimaryBoldText,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: getAllPharmacies(context)),
          ],
        ),
      ),
    );
  }
}

// logout conformation in main screen

Widget logoutConformation(BuildContext context) {
  ProfileController profileController = Get.put(ProfileController());
  final screenWidth = MediaQuery.of(context).size.width;

  return InkWell(
    onTap: () {
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
    },
    child: Icon(
      Icons.logout_rounded,
      size: screenWidth * 0.08,
      color: kWhite,
    ),
  );
}

// getting  current user image form firebase

Widget userImage(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;

  ProfileController controller = Get.put(ProfileController());
  return StreamBuilder(
      stream: controller.getUserDataStream(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircleAvatar(
            radius: screenWidth * 0.06,
            backgroundImage: const AssetImage("assets/images/profile.png"),
          );
        }
        var userData = snapshot.data?.data();
        if (userData == null || userData['picture'] == null) {
          return CircleAvatar(
            radius: screenWidth * 0.06,
            backgroundImage: const AssetImage("assets/images/profile.png"),
          );
        } else {
          return CircleAvatar(
            radius: screenWidth * 0.06,
            backgroundImage: NetworkImage(userData!['picture']),
          );
        }
      });
}

//getting current user name form firebase

Widget userName() {
  ProfileController controller = Get.put(ProfileController());
  return StreamBuilder(
      stream: controller.getUserDataStream(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text(
            "Hi! loading...",
            style: largeTextWhiteBold,
          );
        }
        var userData = snapshot.data?.data();
        if (userData == null || userData['name'] == null) {
          return Text(
            "Hi! loading...",
            style: largeTextWhiteBold,
          );
        } else {
          return Text(
            "Hi! ${userData['name']}",
            style: largeTextWhiteBold,
          );
        }
      });
}

//getting all medicine form firebase
Widget getAllMedicine(BuildContext context) {
  CustomerMainController controller = Get.put(CustomerMainController());
  final screenHeight = MediaQuery.of(context).size.height;
  final screenWidth = MediaQuery.of(context).size.width;

  return StreamBuilder(
    stream: controller.getMedicineDataStream(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(
          child: CircularProgressIndicator(color: Colors.orange),
        );
      }

      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
        return Text(
          "No Medicine added yet..",
          style: largeTextWhiteBold,
        );
      } else {
        var medicineData = snapshot.data!.docs;

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: screenWidth * 0.02,
            mainAxisSpacing: screenHeight * 0.02,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: medicineData.length,
          itemBuilder: (context, index) {
            final medicine = medicineData[index].data() as Map<String, dynamic>;

            return InkWell(
              onTap: () {
                Get.to(() => MedicineDetailScreen(
                      productImage: medicine['productImage'],
                      productName: medicine['productName'],
                      productFormula: medicine['productFormula'],
                      productDetails: medicine['productDetails'],
                      productIngredients: medicine['productIngredient'],
                      productDosage: medicine['productDosage'],
                      productPrecaution: medicine['productPrecaution'],
                      productSideEffects: medicine['productSideEffects'],
                      productUsage: medicine['productUsage'],
                      contact: medicine['contactNo'],
                    ));
              },
              child: Container(
                width: screenWidth * 0.4,
                decoration: BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.network(
                          medicine["productImage"] ?? '',
                          height: screenHeight * 0.1,
                          width: screenWidth * 0.2,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.error, color: Colors.red);
                          },
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Text(
                        medicine["productName"] ?? 'No Name',
                        style: smallTextBlack,
                      ),
                      Text(
                        '${medicine["productPrice"]} PKR',
                        style: mediumTextBlackBold,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }
    },
  );
}

// getting all pharmacies form form firebase
Widget getAllPharmacies(BuildContext context) {
  CustomerMainController controller = Get.put(CustomerMainController());
  final screenHeight = MediaQuery.of(context).size.height;
  final screenWidth = MediaQuery.of(context).size.width;
  return StreamBuilder(
    stream: controller.getPharmaciesDataStream(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(
          child: CircularProgressIndicator(color: Colors.orange),
        );
      }

      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
        return Text(
          "No Pharmacies added yet..",
          style: largeTextWhiteBold,
        );
      } else {
        var pharmaciesData = snapshot.data!.docs;

        return ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
          scrollDirection: Axis.vertical,
          itemCount: pharmaciesData.length,
          itemBuilder: (context, index) {
            final seller = pharmaciesData[index].data() as Map<String, dynamic>;
            return Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
              child: InkWell(
                onTap: () {
                  Get.to(
                    () => SellerDetailScreen(
                      image: seller['pharmacyImage'],
                      pharmacyName: seller['pharmacyName'],
                      pharmacyAddress: seller['address'],
                      pharmacyContact: seller['phoneNo'],
                      pharmacyId: seller['pharmacyId'],
                    ),
                  );
                },
                child: Row(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.1,
                      width: screenWidth * 0.15,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          seller["pharmacyImage"]!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(seller["pharmacyName"]!,
                              style: mediumPrimaryBoldText),
                          SizedBox(height: screenHeight * 0.005),
                          Text(seller["address"]!, style: smallTextGray,),
                          Icon(Icons.star,
                              color: Colors.amber, size: screenWidth * 0.04),
                          Text('4.9', style: smallPrimaryBoldText),
                        ],
                      ),
                    ),

                    /*Column(
                      children: [
                        Icon(Icons.star,
                            color: Colors.amber, size: screenWidth * 0.04),
                        Text('4.9', style: smallPrimaryBoldText),
                      ],
                    ),*/
                  ],
                ),
              ),
            );
          },
        );
      }
    },
  );
}
