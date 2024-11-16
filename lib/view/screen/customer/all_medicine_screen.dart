import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine_app/constant/color_const.dart';
import 'package:medicine_app/constant/styles_const.dart';
import 'package:medicine_app/view/components/buy_now_custom_btn.dart';
import 'package:medicine_app/view/screen/customer/medicine_detail_screen.dart';

import '../../../controller/customer_main_home_screen_controller/customer_main_controller.dart';

class AllMedicineScreen extends StatefulWidget {
  const AllMedicineScreen({super.key});

  @override
  State<AllMedicineScreen> createState() => _AllMedicineScreenState();
}


class _AllMedicineScreenState extends State<AllMedicineScreen> {
  final TextEditingController _searchController = TextEditingController();
  final CustomerMainController controller = Get.put(CustomerMainController());
  final RxString searchQuery = ''.obs;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      searchQuery.value = _searchController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search Medicine...',
                  prefixIcon: Icon(Icons.search, size: screenWidth * 0.06),
                  filled: true,
                  fillColor: const Color(0xFFF2F2F2),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.02,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Obx(() => getAllMedicine(context, searchQuery.value)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Getting all medicine from Firebase with search functionality
Widget getAllMedicine(BuildContext context, String searchQuery) {
  final CustomerMainController controller = Get.find();
  final screenHeight = MediaQuery.of(context).size.height;
  final screenWidth = MediaQuery.of(context).size.width;

  return StreamBuilder<QuerySnapshot>(
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
        var medicineData = snapshot.data!.docs.where((medicine) {
          final productName = (medicine['productName'] ?? '').toString().toLowerCase();
          return productName.contains(searchQuery.toLowerCase());
        }).toList();

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: screenWidth * 0.02,
            mainAxisSpacing: screenHeight * 0.02,
            childAspectRatio: (screenWidth * 0.45) / (screenHeight * 0.30),
          ),
          itemCount: medicineData.length,
          itemBuilder: (context, index) {
            final medicine = medicineData[index];
            return Container(
              height: screenHeight * 0.25,
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
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Text(medicine["productName"] ?? 'No Name', style: smallTextBlack),
                    Text('${medicine["productPrice"]} PKR', style: mediumTextBlackBold),
                    const Spacer(),
                    BuyNowCustomBtn(myText: "More Info", onTap: () {
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
                    }),
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
