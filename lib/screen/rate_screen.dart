import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shoppin/servis/app_service.dart';
import '../core/theme/themes.dart';
import '../models/cart_model.dart';
import '/core/components/my_elevated_button.dart';
import '/core/theme/colors.dart';
import '/screen/reviews_screen.dart';
import '/screen/your_cart_screen.dart';

class RateScreen extends StatefulWidget {
  final String? name;
  final String? image;
  final double? price;
  final String? category;
  final Color? color;
  const RateScreen(
      {this.name,
      this.image,
      this.price,
      this.category,
      this.color,
      super.key});

  @override
  State<RateScreen> createState() => _RateScreenState();
}


class _RateScreenState extends State<RateScreen> {
  late double width;
  late double height;

  late CartService cartService;

  @override
  void initState() {
    cartService = CartService();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        leading: BackButton(
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                widget.name ?? "",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
                  fontSize: 40,
                ),
              ),
            ),
            SizedBox(height: height * 0.04),
            Stack(children: [
              Container(
                height: height * 0.5,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: widget.color,
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(widget.image ?? ""),
                    )),
              ),
              Positioned(
                left: width * 0.72,
                bottom: height * 0.38,
                child: Container(
                  width: width * 0.2,
                  height: height * 0.071,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "\$${widget.price}",
                      style:
                          TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 16),
                    ),
                  ),
                ),
              )
            ]),
            SizedBox(height: 16),
            Align(
              alignment: Alignment(0, 0),
              child: Text(
                widget.category ?? "",
                style: TextStyle(color: Themes.grey, fontSize: 18),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: Theme.of(context).colorScheme.secondary),
                  SizedBox(width: 5),
                  Icon(Icons.star, color: Theme.of(context).colorScheme.secondary),
                  SizedBox(width: 5),
                  Icon(Icons.star, color: Theme.of(context).colorScheme.secondary),
                  SizedBox(width: 5),
                  Icon(Icons.star, color: Theme.of(context).colorScheme.secondary),
                  SizedBox(width: 5),
                  Icon(Icons.star, color: Theme.of(context).colorScheme.secondary),
                  SizedBox(width: 5),
                  TextButton(
                    onPressed: () {
                      context.go('/products/rate/reviews');
                    },
                    child: Text(
                      "124 reviews",
                      style: TextStyle(
                          fontSize: 16,
                          color: Themes.lightBlue,
                          decoration: TextDecoration.underline,
                          decorationColor: Themes.lightBlue),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: height * 0.031),
            Align(
              alignment: Alignment(0, 0),
              child: SizedBox(
                height: height * 0.1,
                width: width * 0.68,
                child: MyElevatedButton(
                    text: "Add to Cart",
                    onTapped: () {
                      cartService.addItem(
                        CartModel(
                            image: widget.image ?? "",
                            color: widget.color ?? Colors.white,
                            name: widget.name ?? "",
                            quantity: 1,
                            price: widget.price ?? 0,
                        ),
                      );
                      print(cartService.cartItems);
                      context.go('/products/rate/your-cart', extra: {
                        'name': widget.name,
                        'image': widget.image,
                        'price': widget.price,
                        'category': widget.category,
                        'color': widget.color
                      });
                    }),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        items: [
          BottomNavigationBarItem(
              icon: currentIndex == 0
                  ? Icon(Icons.home, color: Themes.grey)
                  : Icon(
                      Icons.home_outlined,
                      color: Themes.grey,
                    ),
              label: " "),
          BottomNavigationBarItem(
              icon: currentIndex == 1
                  ? Icon(Icons.shopping_basket)
                  : Icon(Icons.shopping_basket_outlined),
              label: ""),
          BottomNavigationBarItem(
              icon: currentIndex == 2
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_border_outlined),
              label: ""),
        ],
      ),
    );
  }
}
