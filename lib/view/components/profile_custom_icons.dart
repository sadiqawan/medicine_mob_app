 import 'package:flutter/material.dart';
import 'package:medicine_app/constant/color_const.dart';

Widget ProfileCustomIcons(IconData icon, String title, BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: kPrimaryColor,
        radius: screenWidth * 0.05,
        child: Icon(
          icon,
          color: kWhite,
          size: screenWidth * 0.05,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: screenWidth * 0.045),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: screenWidth * 0.04),
      onTap: () {
        // Handle option tap
      },
    );
  }