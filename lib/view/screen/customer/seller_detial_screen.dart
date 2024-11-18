import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:get/get.dart';
import 'package:medicine_app/constant/color_const.dart';
import 'package:medicine_app/constant/styles_const.dart';
import 'package:medicine_app/view/screen/chat/user_chatting_screen.dart';

class SellerDetailScreen extends StatefulWidget {
  final String image;
  final String pharmacyName;
  final String pharmacyAddress;
  final String pharmacyContact;
  final String pharmacyId;

  const SellerDetailScreen(
      {super.key,
      required this.image,
      required this.pharmacyName,
      required this.pharmacyAddress,
      required this.pharmacyContact, required this.pharmacyId});

  @override
  State<SellerDetailScreen> createState() => _SellerDetailScreenState();
}

class _SellerDetailScreenState extends State<SellerDetailScreen> {
  double ratingValue = 4.0; // Initial rating value

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kWhite,
        appBar: AppBar(
          backgroundColor: kWhite,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Pharmacy Name
                Text(widget.pharmacyName, style: largePrimaryBoldText),
                const SizedBox(height: 5),

                // Logo
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: 166,
                  child: Image.network(
                    widget.image,
                  ),
                ),
                const SizedBox(height: 16),

                // Seller Details
                Text("Seller Details", style: mediumPrimaryBoldText),
                const SizedBox(height: 8),
                Text("Address: ${widget.pharmacyAddress}",
                    style: smallTextGray),
                const SizedBox(height: 4),
                Text("Contact Number: ${widget.pharmacyContact}",
                    style: smallTextGray),
                const SizedBox(height: 4),
                Text("Working Hours: 9:00 to 17:00", style: smallTextGray),
                const SizedBox(height: 4),

                GestureDetector(
                  onTap: () {
                    // Navigate to Google Maps with the given location
                    // Use latitude and longitude for navigation
                  },
                  child: Text(
                    "View Live Location",
                    style: smallTextGray.copyWith(color: Colors.blue),
                  ),
                ),
                const SizedBox(height: 16),

                // Top Products Section with ListView.builder and "Buy Now" button
                Text("For any Products contact us!", style: mediumPrimaryBoldText),
                const SizedBox(height: 16),

             /*   const SizedBox(height: 8),
                SizedBox(
                  height: 200, // Adjust height as needed
                  child: ListView.builder(
                    itemCount: 5, // Replace with actual product count
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ListTile(
                          leading: Image.asset("assets/images/medicine1.png"),
                          // Replace with product image
                          title: Text("Product ${index + 1}",
                              style: smallTextGray),
                          subtitle:
                              Text("Product description", style: smallTextGray),
                          trailing: ElevatedButton(
                            onPressed: () {
                              // Add buy now functionality here
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kPrimaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              "Buy Now",
                              style: smallTextWhiteBold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),*/

                // Rating Section
                Text("Rating", style: mediumPrimaryBoldText),
                const SizedBox(height: 8),
                RatingStars(
                  value: ratingValue,
                  onValueChanged: (v) {
                    setState(() {
                      ratingValue = v;
                    });
                  },
                  starCount: 5,
                  starSize: 24,
                  maxValue: 5,
                  starSpacing: 2,
                  valueLabelVisibility: true,
                  valueLabelTextStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0,
                  ),
                  starOffColor: const Color(0xffe7e8ea),
                  starColor: Colors.yellow,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
        // Bottom Navigation with only "Chat" button
        bottomNavigationBar: BottomAppBar(
          color: kWhite,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    Get.to(() =>  UserChattingScreen(
                      pharmacyName: widget.pharmacyName,
                      receiverId: widget.pharmacyId,));
                  },
                  child: Container(
                    height: 60,
                    color: Colors.transparent,
                    child: Center(
                      child: Container(
                        width: 200,
                        height: 60,
                        decoration: BoxDecoration(
                          color: kPinkColor, // Color for Chat button
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                            child: Text("Chat", style: mediumTextWhiteBold)),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
