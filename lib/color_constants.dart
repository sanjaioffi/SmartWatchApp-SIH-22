// ignore_for_file: unused_element

import 'package:flutter/material.dart';


class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

Color kprimaryGreenColor = HexColor('#089438');
Color ksecondaryTextColor = HexColor('#9C9C9C');
Color kprimaryTextColor = HexColor('#434343');
Color kbuttonTextColor = HexColor('#FFFFFF');
Color ktextfieldBorderColor = HexColor('#B2B2B2');
Color kBackgroundColor = HexColor('B2B2B2');
Color kIconColor = HexColor('B2B2B2');
Color kTimeColor = HexColor('#595959');

