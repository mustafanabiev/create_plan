import 'package:flutter/material.dart';

class PricePoint {
  PricePoint({
    required this.name,
    required this.percent,
    required this.color,
  });
  final String name;
  final double percent;
  final Color color;
}

class PieData {
  static List<PricePoint> data = [
    PricePoint(name: 'Blue', percent: 20, color: Colors.blue),
    PricePoint(name: 'Red', percent: 60, color: Colors.red),
    PricePoint(name: 'Green', percent: 20, color: Colors.green),
  ];
}
