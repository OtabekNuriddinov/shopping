import 'package:flutter/material.dart';

class CartModel {
  final String image;
  final Color color;
  final String name;
  final int quantity;
  final double price;

  CartModel({
    required this.image,
    required this.color,
    required this.name,
    required this.quantity,
    required this.price,
  });

  @override
  String toString() {
    return "$image, $color, $name, $quantity, $price";
  }

  CartModel copyWith({
    String? image,
    Color? color,
    String? name,
    int? quantity,
    double? price,
  }) {
    return CartModel(
      image: image ?? this.image,
      color: color ?? this.color,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
    );
  }
}