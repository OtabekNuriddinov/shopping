import 'package:flutter/material.dart';

import '../../models/product_model.dart';

sealed class Products{

  static List<Product> productsList = [
    Product(image: "assets/images/orange_chair.png", price: 879.00, color: Colors.blue.shade100, category: "Furniture", name: "Orange Chair"),
    Product(image: "assets/images/bike.png", price: 2800.00, color: Colors.orange.shade100, category: "Sports", name: "Blue Bike"),
    Product(image: "assets/images/termos.png", price: 5.00, color: Colors.yellow.shade200, category: "Sports", name: "Black Termos"),
    Product(image: "assets/images/bag.png", price: 25.00, color: Colors.lightBlueAccent, category: "Clothing", name: "Grey Bag"),
  ];


}