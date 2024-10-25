import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicine_app/constant/color_const.dart';

// Function to generate text styles
TextStyle generateTextStyle(double fontSize, Color color, {FontWeight fontWeight = FontWeight.normal, FontStyle fontStyle = FontStyle.normal}) {
  return GoogleFonts.overpass(
    textStyle: TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
    ),
  );
}

// Primary TextStyles with Primary Color
var smallPrimaryText = generateTextStyle(14, kPrimaryColor);
var smallPrimaryBoldText = generateTextStyle(14, kPrimaryColor, fontWeight: FontWeight.bold);
var smallPrimaryItalicText = generateTextStyle(14, kPrimaryColor, fontStyle: FontStyle.italic);
var smallPrimaryBoldItalicText = generateTextStyle(14, kPrimaryColor, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic);

var mediumPrimaryText = generateTextStyle(16, kPrimaryColor);
var mediumPrimaryBoldText = generateTextStyle(16, kPrimaryColor, fontWeight: FontWeight.bold);
var mediumPrimaryItalicText = generateTextStyle(16, kPrimaryColor, fontStyle: FontStyle.italic);
var mediumPrimaryBoldItalicText = generateTextStyle(16, kPrimaryColor, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic);

var largePrimaryText = generateTextStyle(24, kPrimaryColor);
var largePrimaryBoldText = generateTextStyle(24, kPrimaryColor, fontWeight: FontWeight.bold);
var largePrimaryItalicText = generateTextStyle(24, kPrimaryColor, fontStyle: FontStyle.italic);
var largePrimaryBoldItalicText = generateTextStyle(24, kPrimaryColor, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic);

var extraLargePrimaryText = generateTextStyle(28, kPrimaryColor);
var extraLargePrimaryBoldText = generateTextStyle(28, kPrimaryColor, fontWeight: FontWeight.bold);
var extraLargePrimaryItalicText = generateTextStyle(28, kPrimaryColor, fontStyle: FontStyle.italic);
var extraLargePrimaryBoldItalicText = generateTextStyle(28, kPrimaryColor, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic);

// Large Text Variants (fontSize: 24)
var largeTextBlack = generateTextStyle(24, Colors.black);
var largeTextBlackBold = generateTextStyle(24, Colors.black, fontWeight: FontWeight.bold);
var largeTextBlackItalic = generateTextStyle(24, Colors.black, fontStyle: FontStyle.italic);

var largeTextWhite = generateTextStyle(24, Colors.white);
var largeTextWhiteBold = generateTextStyle(24, Colors.white, fontWeight: FontWeight.bold);
var largeTextWhiteItalic = generateTextStyle(24, Colors.white, fontStyle: FontStyle.italic);

var largeTextGray = generateTextStyle(24, Colors.grey);
var largeTextGrayBold = generateTextStyle(24, Colors.grey, fontWeight: FontWeight.bold);
var largeTextGrayItalic = generateTextStyle(24, Colors.grey, fontStyle: FontStyle.italic);

var largeTextRed = generateTextStyle(24, Colors.red);
var largeTextRedBold = generateTextStyle(24, Colors.red, fontWeight: FontWeight.bold);
var largeTextRedItalic = generateTextStyle(24, Colors.red, fontStyle: FontStyle.italic);

var largeTextGreen = generateTextStyle(24, Colors.green);
var largeTextGreenBold = generateTextStyle(24, Colors.green, fontWeight: FontWeight.bold);
var largeTextGreenItalic = generateTextStyle(24, Colors.green, fontStyle: FontStyle.italic);

var largeTextYellow = generateTextStyle(24, Colors.yellow);
var largeTextYellowBold = generateTextStyle(24, Colors.yellow, fontWeight: FontWeight.bold);
var largeTextYellowItalic = generateTextStyle(24, Colors.yellow, fontStyle: FontStyle.italic);

var largeTextPurple = generateTextStyle(24, Colors.purple);
var largeTextPurpleBold = generateTextStyle(24, Colors.purple, fontWeight: FontWeight.bold);
var largeTextPurpleItalic = generateTextStyle(24, Colors.purple, fontStyle: FontStyle.italic);

var largeTextOrange = generateTextStyle(24, Colors.orange);
var largeTextOrangeBold = generateTextStyle(24, Colors.orange, fontWeight: FontWeight.bold);
var largeTextOrangeItalic = generateTextStyle(24, Colors.orange, fontStyle: FontStyle.italic);

var largeTextBlue = generateTextStyle(24, Colors.blue);
var largeTextBlueBold = generateTextStyle(24, Colors.blue, fontWeight: FontWeight.bold);
var largeTextBlueItalic = generateTextStyle(24, Colors.blue, fontStyle: FontStyle.italic);

var largeTextTeal = generateTextStyle(24, Colors.teal);
var largeTextTealBold = generateTextStyle(24, Colors.teal, fontWeight: FontWeight.bold);
var largeTextTealItalic = generateTextStyle(24, Colors.teal, fontStyle: FontStyle.italic);

// Extra Large Text Variants (fontSize: 28)
var extraLargeTextBlack = generateTextStyle(28, Colors.black);
var extraLargeTextBlackBold = generateTextStyle(28, Colors.black, fontWeight: FontWeight.bold);
var extraLargeTextBlackItalic = generateTextStyle(28, Colors.black, fontStyle: FontStyle.italic);

var extraLargeTextWhite = generateTextStyle(28, Colors.white);
var extraLargeTextWhiteBold = generateTextStyle(28, Colors.white, fontWeight: FontWeight.bold);
var extraLargeTextWhiteItalic = generateTextStyle(28, Colors.white, fontStyle: FontStyle.italic);

var extraLargeTextGray = generateTextStyle(28, Colors.grey);
var extraLargeTextGrayBold = generateTextStyle(28, Colors.grey, fontWeight: FontWeight.bold);
var extraLargeTextGrayItalic = generateTextStyle(28, Colors.grey, fontStyle: FontStyle.italic);

var extraLargeTextRed = generateTextStyle(28, Colors.red);
var extraLargeTextRedBold = generateTextStyle(28, Colors.red, fontWeight: FontWeight.bold);
var extraLargeTextRedItalic = generateTextStyle(28, Colors.red, fontStyle: FontStyle.italic);

var extraLargeTextGreen = generateTextStyle(28, Colors.green);
var extraLargeTextGreenBold = generateTextStyle(28, Colors.green, fontWeight: FontWeight.bold);
var extraLargeTextGreenItalic = generateTextStyle(28, Colors.green, fontStyle: FontStyle.italic);

var extraLargeTextYellow = generateTextStyle(28, Colors.yellow);
var extraLargeTextYellowBold = generateTextStyle(28, Colors.yellow, fontWeight: FontWeight.bold);
var extraLargeTextYellowItalic = generateTextStyle(28, Colors.yellow, fontStyle: FontStyle.italic);

var extraLargeTextPurple = generateTextStyle(28, Colors.purple);
var extraLargeTextPurpleBold = generateTextStyle(28, Colors.purple, fontWeight: FontWeight.bold);
var extraLargeTextPurpleItalic = generateTextStyle(28, Colors.purple, fontStyle: FontStyle.italic);

var extraLargeTextOrange = generateTextStyle(28, Colors.orange);
var extraLargeTextOrangeBold = generateTextStyle(28, Colors.orange, fontWeight: FontWeight.bold);
var extraLargeTextOrangeItalic = generateTextStyle(28, Colors.orange, fontStyle: FontStyle.italic);

var extraLargeTextBlue = generateTextStyle(28, Colors.blue);
var extraLargeTextBlueBold = generateTextStyle(28, Colors.blue, fontWeight: FontWeight.bold);
var extraLargeTextBlueItalic = generateTextStyle(28, Colors.blue, fontStyle: FontStyle.italic);

var extraLargeTextTeal = generateTextStyle(28, Colors.teal);
var extraLargeTextTealBold = generateTextStyle(28, Colors.teal, fontWeight: FontWeight.bold);
var extraLargeTextTealItalic = generateTextStyle(28, Colors.teal, fontStyle: FontStyle.italic);

// Medium Text Variants (fontSize: 16)
var mediumTextBlack = generateTextStyle(16, Colors.black);
var mediumTextBlackBold = generateTextStyle(16, Colors.black, fontWeight: FontWeight.bold);
var mediumTextBlackItalic = generateTextStyle(16, Colors.black, fontStyle: FontStyle.italic);

var mediumTextWhite = generateTextStyle(16, Colors.white);
var mediumTextWhiteBold = generateTextStyle(16, Colors.white, fontWeight: FontWeight.bold);
var mediumTextWhiteItalic = generateTextStyle(16, Colors.white, fontStyle: FontStyle.italic);

var mediumTextGray = generateTextStyle(16, Colors.grey);
var mediumTextGrayBold = generateTextStyle(16, Colors.grey, fontWeight: FontWeight.bold);
var mediumTextGrayItalic = generateTextStyle(16, Colors.grey, fontStyle: FontStyle.italic);

var mediumTextRed = generateTextStyle(16, Colors.red);
var mediumTextRedBold = generateTextStyle(16, Colors.red, fontWeight: FontWeight.bold);
var mediumTextRedItalic = generateTextStyle(16, Colors.red, fontStyle: FontStyle.italic);

var mediumTextGreen = generateTextStyle(16, Colors.green);
var mediumTextGreenBold = generateTextStyle(16, Colors.green, fontWeight: FontWeight.bold);
var mediumTextGreenItalic = generateTextStyle(16, Colors.green, fontStyle: FontStyle.italic);

var mediumTextYellow = generateTextStyle(16, Colors.yellow);
var mediumTextYellowBold = generateTextStyle(16, Colors.yellow, fontWeight: FontWeight.bold);
var mediumTextYellowItalic = generateTextStyle(16, Colors.yellow, fontStyle: FontStyle.italic);

var mediumTextPurple = generateTextStyle(16, Colors.purple);
var mediumTextPurpleBold = generateTextStyle(16, Colors.purple, fontWeight: FontWeight.bold);
var mediumTextPurpleItalic = generateTextStyle(16, Colors.purple, fontStyle: FontStyle.italic);

var mediumTextOrange = generateTextStyle(16, Colors.orange);
var mediumTextOrangeBold = generateTextStyle(16, Colors.orange, fontWeight: FontWeight.bold);
var mediumTextOrangeItalic = generateTextStyle(16, Colors.orange, fontStyle: FontStyle.italic);

var mediumTextBlue = generateTextStyle(16, Colors.blue);
var mediumTextBlueBold = generateTextStyle(16, Colors.blue, fontWeight: FontWeight.bold);
var mediumTextBlueItalic = generateTextStyle(16, Colors.blue, fontStyle: FontStyle.italic);

var mediumTextTeal = generateTextStyle(16, Colors.teal);
var mediumTextTealBold = generateTextStyle(16, Colors.teal, fontWeight: FontWeight.bold);
var mediumTextTealItalic = generateTextStyle(16, Colors.teal, fontStyle: FontStyle.italic);

// Small Text Variants (fontSize: 14)
var smallTextBlack = generateTextStyle(14, Colors.black);
var smallTextBlackBold = generateTextStyle(14, Colors.black, fontWeight: FontWeight.bold);
var smallTextBlackItalic = generateTextStyle(14, Colors.black, fontStyle: FontStyle.italic);

var smallTextWhite = generateTextStyle(14, Colors.white);
var smallTextWhiteBold = generateTextStyle(14, Colors.white, fontWeight: FontWeight.bold);
var smallTextWhiteItalic = generateTextStyle(14, Colors.white, fontStyle: FontStyle.italic);

var smallTextGray = generateTextStyle(14, Colors.grey);
var smallTextGrayBold = generateTextStyle(14, Colors.grey, fontWeight: FontWeight.bold);
var smallTextGrayItalic = generateTextStyle(14, Colors.grey, fontStyle: FontStyle.italic);

var smallTextRed = generateTextStyle(14, Colors.red);
var smallTextRedBold = generateTextStyle(14, Colors.red, fontWeight: FontWeight.bold);
var smallTextRedItalic = generateTextStyle(14, Colors.red, fontStyle: FontStyle.italic);

var smallTextGreen = generateTextStyle(14, Colors.green);
var smallTextGreenBold = generateTextStyle(14, Colors.green, fontWeight: FontWeight.bold);
var smallTextGreenItalic = generateTextStyle(14, Colors.green, fontStyle: FontStyle.italic);

var smallTextYellow = generateTextStyle(14, Colors.yellow);
var smallTextYellowBold = generateTextStyle(14, Colors.yellow, fontWeight: FontWeight.bold);
var smallTextYellowItalic = generateTextStyle(14, Colors.yellow, fontStyle: FontStyle.italic);

var smallTextPurple = generateTextStyle(14, Colors.purple);
var smallTextPurpleBold = generateTextStyle(14, Colors.purple, fontWeight: FontWeight.bold);
var smallTextPurpleItalic = generateTextStyle(14, Colors.purple, fontStyle: FontStyle.italic);

var smallTextOrange = generateTextStyle(14, Colors.orange);
var smallTextOrangeBold = generateTextStyle(14, Colors.orange, fontWeight: FontWeight.bold);
var smallTextOrangeItalic = generateTextStyle(14, Colors.orange, fontStyle: FontStyle.italic);

var smallTextBlue = generateTextStyle(14, Colors.blue);
var smallTextBlueBold = generateTextStyle(14, Colors.blue, fontWeight: FontWeight.bold);
var smallTextBlueItalic = generateTextStyle(14, Colors.blue, fontStyle: FontStyle.italic);

var smallTextTeal = generateTextStyle(14, Colors.teal);
var smallTextTealBold = generateTextStyle(14, Colors.teal, fontWeight: FontWeight.bold);
var smallTextTealItalic = generateTextStyle(14, Colors.teal, fontStyle: FontStyle.italic);
