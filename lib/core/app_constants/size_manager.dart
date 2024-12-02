import 'package:flutter/material.dart';

class SizeManager {
  static double tablet = 650.0;
  static double desktop = 1200.0;

  static width(context) => MediaQuery.sizeOf(context).width;

  static height(context) => MediaQuery.sizeOf(context).height;
}
