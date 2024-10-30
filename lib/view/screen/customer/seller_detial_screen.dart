import 'package:flutter/material.dart';
import 'package:medicine_app/constant/color_const.dart';
import 'package:medicine_app/constant/const_string_text.dart';
import 'package:medicine_app/constant/styles_const.dart';

class SellerDetailsScreen extends StatefulWidget {
  const SellerDetailsScreen({super.key});

  @override
  State<SellerDetailsScreen> createState() => _SellerDetailsScreenState();
}

class _SellerDetailsScreenState extends State<SellerDetailsScreen> {
  // Sample data for the seller details
  final String sellerName = "ABC Pharmacy";
  final String sellerAddress = "123 Main St, Minneapolis, MN";
  final String sellerPhone = "(123) 456-7890";
  final String sellerRating = "4.5";
  final String sellerDescription = "ABC Pharmacy offers a wide range of medications and health products.";
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kWhite,
        appBar: AppBar(
          backgroundColor: kWhite,
          title: Text(sellerName, style: mediumPrimaryBoldText), // Display seller name in the app bar
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Seller Details", style: largePrimaryBoldText),
                SizedBox(height: 16),
                Text("Name: $sellerName", style: smallTextGray),
                SizedBox(height: 10),
                Text("Address: $sellerAddress", style: smallTextGray),
                SizedBox(height: 10),
                Text("Phone: $sellerPhone", style: smallTextGray),
                SizedBox(height: 10),
                Text("Rating: $sellerRating", style: smallTextGray),
                SizedBox(height: 16),
                Text("Description", style: mediumPrimaryBoldText),
                SizedBox(height: 8),
                Text(sellerDescription, style: smallTextGray),
                SizedBox(height: 16),
                Text("Products Offered", style: mediumPrimaryBoldText), // Title for products section
                SizedBox(height: 8),
                // You can create a list of products here; for now, we'll just add a placeholder
                Table(
                  border: TableBorder.all(
                    color: Colors.grey,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                  children: [
                    TableRow(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Product 1", style: smallTextGray),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Product 1 Details", style: smallTextGray),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Product 2", style: smallTextGray),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Product 2 Details", style: smallTextGray),
                        ),
                      ],
                    ),
                    // Add more products as needed
                  ],
                ),
                SizedBox(height: 20), // Add some space after the table
              ],
            ),
          ),
        ),
      ),
    );
  }
}
