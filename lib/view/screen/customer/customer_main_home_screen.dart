import 'package:flutter/material.dart';
import 'package:medicine_app/constant/color_const.dart';
import 'package:medicine_app/constant/styles_const.dart';

class CustomerMainHomeScreen extends StatefulWidget {
  const CustomerMainHomeScreen({super.key});

  @override
  State<CustomerMainHomeScreen> createState() => _CustomerMainHomeScreenState();
}

class _CustomerMainHomeScreenState extends State<CustomerMainHomeScreen> {
  // Dynamic data for medicines and sellers
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
  
  ];

  final List<Map<String, String>> sellerList = [
    {
      "name": "Modern Pharmacy Peshawar",
      "location": "University Road Peshawar",
      "rating": "4.5",
      "imagePath": "assets/images/sale_logo1.jpg"
    },
    {
      "name": "Health Plus Pharmacy",
      "location": "Mall Road Cantt",
      "rating": "4.7",
      "imagePath": "assets/images/sale_logo2.jpg"
    },
    {
      "name": "Dream for Health Pharmacy",
      "location": "Charsadda Road Peshawar",
      "rating": "4.9",
      "imagePath": "assets/images/sale_logo3.jpg"
    },
    {
      "name": "Helping You Pharmacy",
      "location": "Hayatabad Peshawar",
      "rating": "4.3",
      "imagePath": "assets/images/sale_logo4.jpg"
    },
    // Add more sellers as needed
  ];

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
              decoration: BoxDecoration(
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
                        CircleAvatar(
                          radius: screenWidth * 0.06,
                          backgroundImage: AssetImage("assets/images/profile.png"),
                        ),
                        Icon(
                          Icons.logout_rounded,
                          size: screenWidth * 0.08,
                          color: kWhite,
                        )
                      ],
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hi! Muhammad",
                            style: largeTextWhiteBold,
                          ),
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Medicine...',
                  prefixIcon: Icon(Icons.search, size: screenWidth * 0.06),
                  filled: true,
                  fillColor: Color(0xFFF2F2F2),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.02,
                  ),
                ),
              ),
            ),
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
                  Text(
                    "See All",
                    style: mediumPrimaryBoldText,
                  ),
                ],
              ),
            ),
            Container(
              width: screenWidth * 0.95,
              height: screenHeight * 0.25,
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.02),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: screenWidth * 0.02,
                    mainAxisSpacing: screenHeight * 0.02,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: medicineList.length,
                  itemBuilder: (context, index) {
                    final medicine = medicineList[index];
                    return Container(
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
                              child: Image.asset(
                                medicine["imagePath"]!,
                                height: screenHeight * 0.1,
                                width: screenWidth * 0.2,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            Text(medicine["name"]!, style: smallTextBlack),
                            Text(medicine["price"]!, style: mediumTextBlackBold),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Top Seller", style: largePrimaryBoldText),
                  Text("See All", style: mediumPrimaryBoldText),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                scrollDirection: Axis.vertical,
                itemCount: sellerList.length,
                itemBuilder: (context, index) {
                  final seller = sellerList[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                    child: Row(
                      children: [
                        Container(
                          height: screenHeight * 0.1,
                          width: screenWidth * 0.15,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              seller["imagePath"]!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.02),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(seller["name"]!, style: mediumPrimaryBoldText),
                            SizedBox(height: screenHeight * 0.005),
                            Text(seller["location"]!, style: smallTextGray),
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: screenWidth * 0.04),
                            Text(seller["rating"]!, style: smallPrimaryBoldText),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
