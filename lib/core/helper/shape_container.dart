import 'package:flutter/material.dart';

abstract class ShapeContainer {
  static grayBoxDecoration() {
    return BoxDecoration(
      color: const Color(0xFFF5F5F5),
      borderRadius: BorderRadius.circular(8.0),
    );
  }
}