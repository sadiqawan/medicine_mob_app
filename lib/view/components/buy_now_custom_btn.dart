import 'package:flutter/material.dart';
import 'package:medicine_app/constant/color_const.dart';
import 'package:medicine_app/constant/styles_const.dart';

class BuyNowCustomBtn extends StatelessWidget {
  final String myText;

  const BuyNowCustomBtn({required this.myText, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Container(
      width: screenWidth * 0.9, 
      height: 45, 
      decoration: BoxDecoration(
        color: kPinkColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Text(
          myText,
          style: mediumTextWhiteBold,
        ),
      ),
    );
  }
}
