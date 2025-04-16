import 'package:flutter/material.dart';
import 'package:shoppin/core/components/check_out_button.dart';
import 'package:shoppin/core/theme/colors.dart';
import 'package:shoppin/screen/finallly_page.dart';
import 'package:shoppin/servis/app_service.dart';

class Checkout extends StatefulWidget {
  final String country;
  final String city;
  final String postcode;
  final String street;
  final String name;
  final String cardNum;
  final String date;
  final String cvc;
  final String image;

  const Checkout(
      {super.key,
      required this.country,
      required this.city,
      required this.postcode,
      required this.street,
      required this.name,
      required this.cardNum,
      required this.date,
      required this.cvc,
      required this.image});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  late CartService cartService;

  @override
  void initState() {
    super.initState();
    cartService = CartService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: Text(
              "Checkout",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverToBoxAdapter(child: Divider()),
          SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverToBoxAdapter(
            child: Row(
              children: [
                Text(
                  "Shipping Address",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Change",
                    style: TextStyle(color: Colors.blue),
                  ),
                )
              ],
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 5)),
          SliverToBoxAdapter(
            child: Text(
                "${widget.city}, str. ${widget.street}\n${widget.postcode} ${widget.city}, ${widget.country}"),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverToBoxAdapter(child: Divider()),
          SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverToBoxAdapter(
            child: Row(
              children: [
                Text(
                  "Payment",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Change",
                      style: TextStyle(color: Colors.blue),
                    ))
              ],
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverToBoxAdapter(
            child: Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                height: 70,
                width: 130,
                child: Card(
                  elevation: 10,
                  color: AppColors.white,
                  child: SizedBox(
                    height: 60,
                    width: 100,
                    child: ClipRect(
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(
                        fit: BoxFit.cover,
                        widget.image,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverToBoxAdapter(
              child:
                  Text(widget.cardNum, style: TextStyle(color: Colors.grey))),
          SliverToBoxAdapter(
              child: Text(widget.name, style: TextStyle(color: Colors.grey))),
          SliverToBoxAdapter(
              child: Text(widget.date, style: TextStyle(color: Colors.grey))),
          SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(child: Divider()),
          SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(
            child: Text(
              "Review Products",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),
          SliverGrid.builder(
            itemCount: cartService.cartItems.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
            itemBuilder: (context, index) {
              return Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(cartService.cartItems[index].image),
                  ),
                  color: cartService.cartItems[index].color,
                  borderRadius: BorderRadius.circular(20),
                ),
              );
            },
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverToBoxAdapter(
            child: CheckOutButton(
              cartService: cartService,
              text: "Place Order",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FinallyPage(),
                  ),
                );
              },
            ),
          )
        ]),
      ),
    );
  }
}
