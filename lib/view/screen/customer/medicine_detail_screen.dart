import 'package:flutter/material.dart';
import 'package:medicine_app/constant/color_const.dart';
import 'package:medicine_app/constant/const_string_text.dart';
import 'package:medicine_app/constant/styles_const.dart';
import 'package:medicine_app/view/components/buy_now_custom_btn.dart';
import 'package:url_launcher/url_launcher.dart';

class MedicineDetailScreen extends StatefulWidget {
  final String productImage;
  final String productName;
  final String productFormula;
  final String productDetails;
  final String productIngredients;
  final String productDosage;
  final String productPrecaution;
  final String productSideEffects;
  final String productUsage;
  final String contact;

  const MedicineDetailScreen({
    super.key,
    required this.productImage,
    required this.productName,
    required this.productFormula,
    required this.productDetails,
    required this.productIngredients,
    required this.productDosage,
    required this.productPrecaution,
    required this.productSideEffects,
    required this.productUsage,
    required this.contact,
  });

  @override
  State<MedicineDetailScreen> createState() => _MedicineDetailScreenState();
}

class _MedicineDetailScreenState extends State<MedicineDetailScreen> {
  void makePhoneCall(String phoneNumber) async {
    final Uri url = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

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
                Text(widget.productName, style: largePrimaryBoldText),
                const SizedBox(height: 5),
                Text(widget.productFormula, style: smallTextGray),
                const SizedBox(height: 10),
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: 166,
                  child: Image.network(widget.productImage),
                ),
                const SizedBox(height: 16),
                Text('Product Details', style: mediumPrimaryBoldText),
                const SizedBox(height: 8),
                Text(widget.productDetails, style: smallTextGray),
                const SizedBox(height: 16),
                Text('Product Ingredients', style: mediumPrimaryBoldText),
                const SizedBox(height: 8),
                Text(widget.productIngredients, style: smallTextGray),
                const Divider(),
                const SizedBox(height: 16),
                Text("Information", style: mediumPrimaryBoldText),
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
                          child: Text(widget.productDosage, style: smallTextGray),
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
                          child: Text(widget.productPrecaution, style: smallTextGray),
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
                          child: Text(widget.productSideEffects, style: smallTextGray),
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
                          child: Text(widget.productUsage, style: smallTextGray),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: kWhite,
          child: InkWell(
            onTap: () {},
            child: Container(
              height: 60,
              color: Colors.transparent,
              child: Center(
                child: BuyNowCustomBtn(
                  myText: "Buy Now",
                  onTap: () {
                    makePhoneCall(widget.contact);
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
