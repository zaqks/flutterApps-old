import 'package:flutter/material.dart';

Color hexConv(String hexClr) {
  final hexCode = hexClr.replaceAll("#", "");
  return Color(int.parse("FF$hexCode", radix: 16));
}

Color bgClr1 = hexConv("080808");
Color bgClr2 = hexConv("101010");
Color bgClr3 = hexConv("181818");

Color secondaryClr1 = Color.fromARGB(19, 255, 255, 255);

Color secondaryClr2 = hexConv("500B28");
Color secondaryClr3 = hexConv("E21C34");
Color secondaryClr4 = hexConv("28272C");
Color secondaryClr5 = hexConv("FF0000");

Color textClr1 = hexConv("F1F1F3");
