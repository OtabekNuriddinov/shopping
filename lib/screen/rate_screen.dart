import 'package:flutter/material.dart';
import 'package:shoppin/core/components/my_elevated_button.dart';
import 'package:shoppin/core/theme/colors.dart';
import 'package:shoppin/screen/reviews_screen.dart';
import 'package:shoppin/screen/your_cart.dart';

class RateScreen extends StatefulWidget {
  final String name;
  final String image;
  final String price;
  final String category;
  final Color color;
  const RateScreen(
      {required this.name,
      required this.image,
      required this.price,
      required this.category,
      required this.color,
      super.key});

  @override
  State<RateScreen> createState() => _RateScreenState();
}

class _RateScreenState extends State<RateScreen> {
  late double width;
  late double height;

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
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
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
                widget.name,
                style: TextStyle(
                  color: Colors.black,
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
                      image: AssetImage(widget.image),
                    )),
              ),
              Positioned(
                left: width * 0.72,
                bottom: height * 0.38,
                child: Container(
                  width: width * 0.2,
                  height: height * 0.071,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      widget.price,
                      style:
                          TextStyle(color: AppColors.deepPurple, fontSize: 16),
                    ),
                  ),
                ),
              )
            ]),
            SizedBox(height: 16),
            Align(
              alignment: Alignment(0, 0),
              child: Text(
                widget.category,
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: Colors.orange.shade300),
                  SizedBox(width: 5),
                  Icon(Icons.star, color: Colors.orange.shade300),
                  SizedBox(width: 5),
                  Icon(Icons.star, color: Colors.orange.shade300),
                  SizedBox(width: 5),
                  Icon(Icons.star, color: Colors.orange.shade300),
                  SizedBox(width: 5),
                  Icon(Icons.star, color: Colors.grey.shade300),
                  SizedBox(width: 5),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReviewsScreen()));
                    },
                    child: Text(
                      "124 reviews",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.lightBlue,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.lightBlue),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => YourCart(),
                        ),
                      );
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
        backgroundColor: AppColors.white,
        items: [
          BottomNavigationBarItem(
              icon: currentIndex == 0
                  ? Icon(Icons.home, color: Colors.grey)
                  : Icon(
                      Icons.home_outlined,
                      color: Colors.grey,
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
