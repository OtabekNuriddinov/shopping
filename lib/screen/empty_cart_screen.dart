import 'package:flutter/material.dart';
import '../core/theme/themes.dart';
import '/core/components/my_elevated_button.dart';
import '/core/theme/colors.dart';
import '/screen/products_screen.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.shopping_cart_outlined, color: Theme.of(context).colorScheme.onSecondary,),
              SizedBox(height: 20),
              Text(
                "Your cart is empty",
                style: TextStyle(color: Theme.of(context).colorScheme.onSecondary, fontSize: 30,),
              ),
              SizedBox(height: 10),
              Text(
                "Looking for ideas",
                style: TextStyle(
                  fontSize: 14,
                  color: Themes.grey,
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
