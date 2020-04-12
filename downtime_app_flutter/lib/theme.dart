import 'package:flutter/material.dart';

// TextStyle listTitleDefaultTextStyle = TextStyle(color: Colors.white70, fontSize: 20.0, fontWeight: FontWeight.w600);
// TextStyle listTitleSelectedTextStyle = TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w600);

//futuristic design
TextStyle listTitleDefaultTextStyle = TextStyle(color: textTitleFuturistic, fontSize: 20.0, fontWeight: FontWeight.w600);
TextStyle listTitleSelectedTextStyle = TextStyle(color: HexColor("#0bc70e"), fontSize: 20.0, fontWeight: FontWeight.w600);


Color selectedColor = Color(0xFF4AC8EA);
Color drawerBackgroundColor = Color(0xFF272D34);

Color textTitleFuturistic = HexColor("#00fefe");
Color backGroundColorFuturistic = HexColor("#011023");

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

