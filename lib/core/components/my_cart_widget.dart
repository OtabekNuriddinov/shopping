
import 'package:flutter/material.dart';

class MyCartWidget extends StatelessWidget {
  final String image;
  final Color color;
  final String name;
  final void Function() increment;
  final void Function() decrement;
  final int quantity;
  final double price;

  const MyCartWidget({
    super.key,
    required this.image,
    required this.color,
    required this.name,
    required this.increment,
    required this.decrement,
    required this.quantity,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
                image: AssetImage(image),
            ),
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        SizedBox(width: 8),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: decrement,
                      icon: Icon(Icons.delete_outline_sharp),
                    ),
                    SizedBox(width: 30),
                    Text(
                      quantity.toString(),
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(width: 30),
                    IconButton(
                      onPressed: increment,
                      icon: Icon(Icons.add_box_outlined),
                    ),
                    SizedBox(width: 30),
                    Text(
                      "\$${(price * quantity)}",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
