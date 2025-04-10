import 'package:flutter/material.dart';
import 'package:shoppin/models/cart_model.dart';

class CartService {

  final List<CartModel> _cartItems = [];

  List<CartModel> get cartItems => _cartItems;

  void initCartItems() {
    _cartItems.add(
        CartModel(
            image: "assets/images/bag.png",
            color: Colors.lightBlueAccent,
            name: "Rains Backpack Pacific",
            quantity: 1,
            onDelete: () => removeItem("Rains Backpack Pacific"),
            onIncrement: () => incrementQuantity("Rains Backpack Pacific"),
            onDecrement: () => decrementQuantity("Rains Backpack Pacific"),
            price: 25.00
        )
    );

    _cartItems.add(
        CartModel(
            image: "assets/images/table_lamp.png",
            color: Colors.orange.shade100,
            name: "Camber Table Lamp",
            quantity: 1,
            onDelete: () => removeItem("Camber Table Lamp"),
            onIncrement: () => incrementQuantity("Camber Table Lamp"),
            onDecrement: () => decrementQuantity("Camber Table Lamp"),
            price: 120
        )
    );

    _cartItems.add(
        CartModel(
            image: "assets/images/orange_chair.png",
            color: Colors.blue.shade100,
            name: "Orange Chair",
            quantity: 1,
            onDelete: () => removeItem("Orange Chair"),
            onIncrement: () => incrementQuantity("Orange Chair"),
            onDecrement: () => decrementQuantity("Orange Chair"),
            price: 879.0
        )
    );
  }

  String get totalPrice {
    double total = 0;
    for (var item in _cartItems) {
      total += item.price * item.quantity;
    }
    return '\$${total.toStringAsFixed(2)}';
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
    final index = _cartItems.indexWhere((element) => element.name == name);
    if (index >= 0) {
      final item = _cartItems[index];
      final updatedItem = CartModel(
        image: item.image,
        color: item.color,
        name: item.name,
        quantity: item.quantity + 1,
        onDelete: item.onDelete,
        onIncrement: item.onIncrement,
        onDecrement: item.onDecrement,
        price: item.price,
      );
      _cartItems[index] = updatedItem;
    }
  }

  void decrementQuantity(String name) {
    final index = _cartItems.indexWhere((element) => element.name == name);
    if (index >= 0 && _cartItems[index].quantity > 1) {
      final item = _cartItems[index];
      final updatedItem = CartModel(
        image: item.image,
        color: item.color,
        name: item.name,
        quantity: item.quantity - 1,
        onDelete: item.onDelete,
        onIncrement: item.onIncrement,
        onDecrement: item.onDecrement,
        price: item.price,
      );
      _cartItems[index] = updatedItem;
    }
  }

  void removeItem(String name) {
    _cartItems.removeWhere((element) => element.name == name);
  }

  void clearCart() {
    _cartItems.clear();
  }
}