import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const Color kAppBarColor = Color(0xFFF1F1F1);
const Color kAppBackgroundColor = Color(0xFFF1F1F1);
const Color kCardColor = Color(0xFFF7F7F7);
const Color kTextColor = Color(0xFF464646);
const Color kAccentColor_blue = Color(0xFF50BED3);
const Color kAccentColor_red = Color(0xFFFF785E);
const Color kAccentColor_green = Color(0xFF69CA87);
const Color kShadowColor = Color(0xFFECECEC);

const TextStyle textStyle_dark = TextStyle(
  color: kTextColor,
);

const TextStyle tabletextStyle_dark = TextStyle(
  color: kTextColor,
  fontSize: 12.0,
);

const TextStyle cardHeading_textStyle =
    TextStyle(fontWeight: FontWeight.w800, fontSize: 26.0, color: kTextColor);

const TextStyle cardsubHeading_textStyle = TextStyle(
  fontWeight: FontWeight.w700,
  color: kTextColor,
  fontSize: 20.0,
);

const TextStyle cardData_textStyle = TextStyle(
  color: kTextColor,
);

const TextStyle kstateCard_textStyle = TextStyle(color: kTextColor);

//Table View Styling
const TextStyle kTextViewHeading = TextStyle(
  fontSize: 14.0,
  fontWeight: FontWeight.bold,
);

const TextStyle kTextViewData = TextStyle(
  fontSize: 12.0,
);

class Essentials {
  static String toReadableInt(String number) {
    if (number == null) {
      return '';
    } else if (number.length <= 3) {
      return number;
    } else {
      String formattedString = '';
      if (number.length % 2 == 0) {
        formattedString = '${number[0]},';
        for (int i = 1; i < number.length - 4; i = i + 2) {
          formattedString = '$formattedString${number[i]}${number[i + 1]},';
        }
      } else {
        for (int i = 0; i < number.length - 4; i = i + 2) {
          formattedString = '$formattedString${number[i]}${number[i + 1]},';
        }
      }
      formattedString =
          '$formattedString${number.substring(number.length - 3, number.length)}';
      return formattedString;
    }
  }
}
