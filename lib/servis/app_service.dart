import 'package:flutter/material.dart';

import '../models/cart_model.dart';

class CartService {
  CartService._();
  static final CartService _singleton = CartService._();
  factory CartService() => _singleton;

  final List<CartModel> _cartItems = [];
  List<CartModel> get cartItems => _cartItems;

  void initCartItems() {
    _cartItems.add(
        CartModel(
          image: "assets/images/bag.png",
          color: Colors.lightBlueAccent,
          name: "Rains Backpack Pacific",
          quantity: 1,
          price: 25.00,
        )
    );
    _cartItems.add(
        CartModel(
          image: "assets/images/table_lamp.png",
          color: Colors.orange.shade100,
          name: "Camber Table Lamp",
          quantity: 1,
          price: 120,
        )
    );
    _cartItems.add(
        CartModel(
          image: "assets/images/orange_chair.png",
          color: Colors.blue.shade100,
          name: "Orange Chair",
          quantity: 1,
          price: 879.0,
        )
    );
  }

  String get totalPrice {
    double total = 0;
    for (var item in _cartItems) {
      total += item.quantity * item.price;
    }
    return "\$${total.toStringAsFixed(2)}";
  }

  void addItem(CartModel item) {
    final existingIndex = _cartItems.indexWhere((element) => element.name == item.name);
    if (existingIndex >= 0) {
      incrementQuantity(item.name);
    } else {
      _cartItems.add(item);
    }
  }

  void incrementQuantity(String name) {
    final index = _cartItems.indexWhere((item) => item.name == name);
    if (index >= 0) {
      final item = _cartItems[index];
      _cartItems[index] = item.copyWith(quantity: item.quantity + 1);
    }
  }

  void decrementQuantity(String name) {
    final index = _cartItems.indexWhere((item) => item.name == name);
    if (index >= 0 && _cartItems[index].quantity > 1) {
      final item = _cartItems[index];
      _cartItems[index] = item.copyWith(quantity: item.quantity - 1);
    }
  }

  void removeItem(String name) {
    _cartItems.removeWhere((item) => name == item.name);
  }

  void clearCart() {
    _cartItems.clear();
  }
}