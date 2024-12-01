import 'package:flutter/material.dart';

class Device {
  static bool isWeb(context) {
    if (MediaQuery.of(context).size.shortestSide < 600) {
      return false;
    }
    return true;
  }
}
