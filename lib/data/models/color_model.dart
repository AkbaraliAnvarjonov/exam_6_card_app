import 'package:flutter/material.dart';

class ColorModels {
  int colorA;
  int colorB;
  ColorModels({required this.colorA, required this.colorB});

  static List<ColorModels> colors = [
    ColorModels(colorA: 0xff5646a3, colorB: 0xff44336),
    ColorModels(colorA: 0xff2196f3, colorB: 0xff4caf50),
    ColorModels(colorA: 0xff4caf50, colorB: 0xffffeb3b),
    ColorModels(colorA: 0xff633da5, colorB: 0xffdf2b4b),
  ];
}
