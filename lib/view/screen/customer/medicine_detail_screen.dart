import 'package:flutter/material.dart';
import 'package:medicine_app/constant/color_const.dart';
import 'package:medicine_app/constant/const_string_text.dart';
import 'package:medicine_app/constant/styles_const.dart';
import 'package:medicine_app/view/components/buy_now_custom_btn.dart';

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
                const SizedBox(height: 5),
                Text("(Ibuprofenum)", style: smallTextGray),
                const SizedBox(height: 10),
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: 166,
                  child: Image.asset("assets/images/medicine2.png"),
                ),
                const SizedBox(height: 16),
                Text("Product Details", style: mediumPrimaryBoldText),
                const SizedBox(height: 8),
                Text(productDetails, style: smallTextGray),
                const SizedBox(height: 16),
                Text("Ingredients", style: mediumPrimaryBoldText),
                const SizedBox(height: 8),
                Text(ingredient, style: smallTextGray),
                const Divider(),
                const SizedBox(height: 16), // Add spacing before the table
                Text("Information", style: mediumPrimaryBoldText), // Optional title for the table
                const SizedBox(height: 8),
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
                const SizedBox(height: 20), // Add some space after the table
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: kWhite,
          child: InkWell(
            onTap: (){
   },
            child: Container(
              height: 60,
              color:Colors.transparent, 
              child: Center(
                child: BuyNowCustomBtn(myText: "Buy Now")
              ),
            ),
          ),
        ),
      ),
    );
  }

}