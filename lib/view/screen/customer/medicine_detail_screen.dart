import 'package:flutter/material.dart';
import 'package:medicine_app/constant/color_const.dart';
import 'package:medicine_app/constant/const_string_text.dart';
import 'package:medicine_app/constant/styles_const.dart';

class MedicineDetailScreen extends StatefulWidget {
  const MedicineDetailScreen({super.key});

  @override
  State<MedicineDetailScreen> createState() => _MedicineDetailScreenState();
}

class _MedicineDetailScreenState extends State<MedicineDetailScreen> {
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
                Text("Brufen 400mg", style: largePrimaryBoldText),
                SizedBox(height: 5),
                Text("(Ibuprofenum)", style: smallTextGray),
                SizedBox(height: 10),
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: 166,
                  child: Image.asset("assets/images/medicine2.png"),
                ),
                SizedBox(height: 16),
                Text("Product Details", style: mediumPrimaryBoldText),
                SizedBox(height: 8),
                Text(productDetails, style: smallTextGray),
                SizedBox(height: 16),
                Text("Ingredients", style: mediumPrimaryBoldText),
                SizedBox(height: 8),
                Text(ingredient, style: smallTextGray),
                Divider(),
                SizedBox(height: 16), // Add spacing before the table
                Text("Information", style: mediumPrimaryBoldText), // Optional title for the table
                SizedBox(height: 8),
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
                          child: Text("Dosage", style: mediumPrimaryBoldText),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(dosage, style: smallTextGray),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Precaution", style: mediumPrimaryBoldText),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(precaution, style: smallTextGray),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Side Effects", style: mediumPrimaryBoldText),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(sideEffects, style: smallTextGray),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Usage", style: mediumPrimaryBoldText),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(usage, style: smallTextGray),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20), // Add some space after the table
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: kWhite,
          child: InkWell(
            onTap: (){
              //this will move the user to screen where this products with different pharmacies
            },
            child: Container(
              height: 60,
              color:Colors.transparent, 
              child: Center(
                child: Container(
                  width:334,
                  height: 45,
                  decoration: BoxDecoration(
                    color:kPinkColor,
                    borderRadius: BorderRadius.circular(100),
            
                  ),
                  child: Center(child: Text("Buy Now",style: mediumTextWhiteBold,)),
                )
              ),
            ),
          ),
        ),
      ),
    );
  }
}