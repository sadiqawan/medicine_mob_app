import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine_app/view/screen/customer/seller_detial_screen.dart';

import '../../../constant/styles_const.dart';
import '../../../controller/customer_main_home_screen_controller/customer_main_controller.dart';

class AllPharmaciesScreen extends StatefulWidget {
  const AllPharmaciesScreen({super.key});

  @override
  State<AllPharmaciesScreen> createState() => _AllPharmaciesScreenState();
}

class _AllPharmaciesScreenState extends State<AllPharmaciesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Pharmacies',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: getAllPharmacies(context),
    );
  }
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(seller["pharmacyName"]!,
                            style: mediumPrimaryBoldText),
                        SizedBox(height: screenHeight * 0.005),
                        Text(seller["address"]!, style: smallTextGray),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        Icon(Icons.star,
                            color: Colors.amber, size: screenWidth * 0.04),
                        Text('4.9', style: smallPrimaryBoldText),
                      ],
                    ),
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
