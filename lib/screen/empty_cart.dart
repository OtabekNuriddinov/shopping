import 'package:flutter/material.dart';
import 'package:shoppin/core/components/my_elevated_button.dart';
import 'package:shoppin/core/theme/colors.dart';
import 'package:shoppin/screen/products_screen.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.shopping_cart_outlined, color: Colors.black),
              SizedBox(height: 20),
              Text(
                "Your cart is empty",
                style: TextStyle(color: Colors.black, fontSize: 30),
              ),
              SizedBox(height: 10),
              Text(
                "Looking for ideas",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                height: 60,
                width: double.infinity,
                child: MyElevatedButton(
                  text: "Explore New Products",
                  onTapped: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductsScreen(),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
