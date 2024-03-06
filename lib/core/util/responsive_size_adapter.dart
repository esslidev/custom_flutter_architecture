import 'package:flutter/material.dart';

class ResponsiveSizeAdapter {
  final BuildContext context;

  ResponsiveSizeAdapter(this.context);

  double size(double baseSize) {
    double screenWidth = MediaQuery.of(context).size.width;
    const double referenceScreenWidth = 720.0;
    double screenWidthRatio = screenWidth / referenceScreenWidth;
    return baseSize * screenWidthRatio;
  }

  EdgeInsets padding(double basePadding) {
    double responsivePadding = size(basePadding);
    return EdgeInsets.all(responsivePadding);
  }
}
