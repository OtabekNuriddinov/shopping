import 'package:flutter/material.dart';

class CartModel {
  final String image;
  final Color color;
  final String name;
  final int quantity;
  final void Function() onDelete;
  final void Function() onIncrement;
  final void Function() onDecrement;
  final double price; // Changed from double to String

  CartModel({
    required this.image,
    required this.color,
    required this.name,
    required this.quantity,
    required this.onDelete,
    required this.onIncrement,
    required this.onDecrement,
    required this.price,
  });

  double get totalPrice => price * quantity;
}