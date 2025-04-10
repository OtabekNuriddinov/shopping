import 'package:flutter/material.dart';
import '/core/theme/strings.dart';
import '/core/utils/alert_dialog.dart';
import '/screen/empty_cart.dart';
import '/servis/app_service.dart';

import '../core/components/my_cart_widget.dart';
import '../core/theme/colors.dart';

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
    cartService.initCartItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
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
                          Navigator.pop(context);
                        },
                        pressRight: () {
                          setState(() {
                            cartService.clearCart();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EmptyCart(),
                              ),
                            );
                          });
                        });
                  },
                  icon: Icon(
                    Icons.delete_outline_sharp,
                    color: Colors.black,
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
                                  Navigator.pop(context);
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
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.darkBlue,
                  minimumSize: Size(double.infinity, 80),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Check Out",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      cartService.totalPrice,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
