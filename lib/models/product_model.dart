import 'package:flutter/material.dart';

class Product {
  final String image;
  final double price;
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

  Product copyWith({
    String? image,
    Color? color,
    String? name,
    String? category,
    double? price,
  }) {
    return Product(
      image: image ?? this.image,
      color: color ?? this.color,
      name: name ?? this.name,
      category: category ?? this.category,
      price: price ?? this.price,
    );
  }

  @override
  String toString() {
    return 'Product{image: $image, price: $price, name: $name, color: $color, category: $category}';
  }
}
