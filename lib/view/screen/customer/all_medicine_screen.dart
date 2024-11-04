import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine_app/constant/color_const.dart';
import 'package:medicine_app/constant/styles_const.dart';
import 'package:medicine_app/view/components/buy_now_custom_btn.dart';
import 'package:medicine_app/view/screen/customer/medicine_detail_screen.dart';

class AllMedicineScreen extends StatefulWidget {
  const AllMedicineScreen({super.key});

  @override
  State<AllMedicineScreen> createState() => _AllMedicineScreenState();
}

final List<Map<String, String>> medicineList = [
  {
    "name": "Panadol 600mg",
    "price": "120 PKR",
    "imagePath": "assets/images/medicine1.png"
  },
  {
    "name": "Brufen 400mg",
    "price": "80 PKR",
    "imagePath": "assets/images/medicine2.png"
  },
  {
    "name": "Nuberol 400mg",
    "price": "200 PKR",
    "imagePath": "assets/images/medicine3.png"
  },
  {
    "name": "Provas 400mg",
    "price": "600 PKR",
    "imagePath": "assets/images/medicine4.png"
  },
  {
    "name": "Panadol 600mg",
    "price": "120 PKR",
    "imagePath": "assets/images/medicine1.png"
  },
  {
    "name": "Brufen 400mg",
    "price": "80 PKR",
    "imagePath": "assets/images/medicine2.png"
  },
  {
    "name": "Nuberol 400mg",
    "price": "200 PKR",
    "imagePath": "assets/images/medicine3.png"
  },
  {
    "name": "Provas 400mg",
    "price": "600 PKR",
    "imagePath": "assets/images/medicine4.png"
  },
];

class _AllMedicineScreenState extends State<AllMedicineScreen> {
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
              SizedBox(height: 10),
              Expanded( 
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, 
                    crossAxisSpacing: screenWidth * 0.02,
                    mainAxisSpacing: screenHeight * 0.02,
                    childAspectRatio: (screenWidth * 0.45) / (screenHeight * 0.30), 
                  ),
                  itemCount: medicineList.length,
                  itemBuilder: (context, index) {
                    final medicine = medicineList[index];
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
                              child: Image.asset(
                                medicine["imagePath"]!,
                                height: screenHeight * 0.1,
                                width: screenWidth * 0.2,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            Text(medicine["name"]!, style: smallTextBlack),
                            Text(medicine["price"]!, style: mediumTextBlackBold),
                            Spacer(),
                            InkWell(
                              onTap: () => Get.to(() => const MedicineDetailScreen()),
                              child: BuyNowCustomBtn(myText: "More Info"),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
