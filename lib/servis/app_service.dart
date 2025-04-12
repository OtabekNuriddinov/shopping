import '../models/cart_model.dart';

class CartService {

  static final CartService _instance = CartService._internal();
  factory CartService() => _instance;
  CartService._internal();

  final List<CartModel> _cartItems = [];

  List<CartModel> get cartItems => _cartItems;


  String get totalPrice {
    double total = 0;
    for (var item in _cartItems) {
      total += item.quantity * item.price;
    }
    return "\$${total.toStringAsFixed(2)}";
  }

  void addItem(CartModel item) {
    final index = _cartItems.indexWhere((e) => e.name == item.name);
    if (index != -1) {
      _cartItems[index] =
          _cartItems[index].copyWith(quantity: _cartItems[index].quantity + 1);
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