import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shoppin/screen/shipping_address.dart';
import '../core/components/check_out_button.dart';
import '/core/theme/strings.dart';
import '/core/utils/alert_dialog.dart';
import '/screen/empty_cart_screen.dart';
import '/servis/app_service.dart';

import '../core/components/my_cart_widget.dart';

class YourCart extends StatefulWidget {
  const YourCart({super.key});

  @override
  State<YourCart> createState() => _YourCartState();
}

class _YourCartState extends State<YourCart> {
  late CartService cartService;

  @override
  void initState() {
    super.initState();
    cartService = CartService();
  }

  @override
  Widget build(BuildContext context) {
    final extra = GoRouter.of(context).state.extra;
    if (extra is! Map<String, dynamic>) {
      return Scaffold(
        body: Center(
          child: Text("Invalid data"),
        ),
      );
    }
    final name = extra['name'];
    final image = extra['image'];
    final price = extra['price'];
    final category = extra['category'];
    final color = extra['color'];
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        leading: BackButton(
          onPressed: () {
            context.goNamed('rate', extra: {
              'name': name,
              'image': image,
              'price': price,
              'category': category,
              'color': color
            });
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  AppStrings.yourCart,
                  style: TextStyle(fontSize: 30),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    AppDialog.showMyDialog(
                        context: context,
                        mainText: "Empty Cart",
                        text:
                            "Are you sure you want to delete all\nitems in your cart",
                        leftButText: "Cancel",
                        rightButText: "Empty Cart",
                        pressLeft: () {
                          context.pop();
                        },
                        pressRight: () {
                          setState(() {
                            cartService.clearCart();
                            context.goNamed('empty');
                          });
                        });
                  },
                  icon: Icon(
                    Icons.delete_outline_sharp,
                    color: Theme.of(context).colorScheme.onSecondary
                  ),
                ),
              ],
            ),
            Text("${cartService.cartItems.length} items"),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 10),
            // Add Expanded here to give the ListView a bounded height
            Expanded(
              child: ListView.builder(
                itemCount: cartService.cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartService.cartItems[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: MyCartWidget(
                        image: item.image,
                        color: item.color,
                        name: item.name,
                        increment: (){
                          setState(() {
                            cartService.incrementQuantity(item.name);
                          });
                        },
                        decrement: (){
                          if(item.quantity==1){
                            AppDialog.showMyDialog(
                                context: context,
                                mainText: "Delete ${item.name}",
                                text: "Are you sure you want to delete '${item.name}' from your cart?",
                                leftButText: "Cancel",
                                rightButText: "Delete",
                                pressLeft: (){
                                  context.pop();
                                },
                                pressRight: (){
                                  setState(() {
                                    cartService.removeItem(item.name);
                                  });
                                  Navigator.pop(context);
                                },
                            );
                          }
                          else{
                            setState(() {
                              cartService.decrementQuantity(item.name);
                            });
                          }
                        },
                        quantity: item.quantity,
                        price: item.price,
                    )

                  );
                },
              ),
            ),
            // Add checkout button here if needed
            Padding(
              padding: const EdgeInsets.only(bottom: 80),
              child: CheckOutButton(
                  cartService: cartService,
                  text: "Check Out",
                onPressed: (){
                    context.goNamed('shipping', extra: {
                      'name': name,
                      'image': image,
                      'price': price,
                      'category': category,
                      'color': color,
                    });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

