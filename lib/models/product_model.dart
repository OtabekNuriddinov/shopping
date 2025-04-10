import 'package:flutter/material.dart';

class Product {
  final String image;
  final String price;
  final String name;
  final Color color;
  final String category;

  Product({
    required this.image,
    required this.price,
    required this.name,
    required this.color,
    required this.category,
  });
}
