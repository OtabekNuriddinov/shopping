import 'package:flutter/material.dart';
import 'package:shoppin/core/components/payment_textfield.dart';
import 'package:shoppin/core/theme/colors.dart';
import 'package:shoppin/core/theme/strings.dart';
import 'package:shoppin/core/utils/app_snackbar.dart';
import 'package:shoppin/screen/checkout.dart';

import '../core/components/card_widget.dart';
import '../core/components/my_elevated_button.dart';
import '../core/theme/themes.dart';

class PaymentMethod extends StatefulWidget {
  final String country;
  final String city;
  final String postcode;
  final String street;
  const PaymentMethod({
    required this.country,
    required this.city,
    required this.postcode,
    required this.street,
    super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {

  late TextEditingController nameController;
  late TextEditingController cardController;
  late TextEditingController dateController;
  late TextEditingController cvcController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    cardController = TextEditingController();
    dateController = TextEditingController();
    cvcController = TextEditingController();
  }

  final List<String> images = [
    "assets/images/paypal_logo.png",
    "assets/images/master_card_logo.png",
    "assets/images/visa_logo.png",
  ];

  int currentIndex = 0;
  bool circle = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Payment Method",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment(0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 70,
                      width: 130,
                      child: CardWidget(
                        index: 0,
                          currentIndex: currentIndex,
                          onPressed: (){
                            setState(() {
                              currentIndex = 0;
                            });
                          },
                          image: "assets/images/paypal_logo.png",
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                        height: 70,
                        width: 130,
                      child: CardWidget(
                          image: "assets/images/master_card_logo.png",
                          index: 1,
                          currentIndex: currentIndex,
                          onPressed: (){
                            setState(() {
                              currentIndex = 1;
                            });
                          },
                      )
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      height: 70,
                      width: 130,
                      child: CardWidget(
                          image: "assets/images/visa_logo.png",
                          index: 2,
                          currentIndex: currentIndex,
                          onPressed: (){
                            setState(() {
                              currentIndex = 2;
                            });
                          },
                      )
                    )
                  ],
                ),
              ),
              SizedBox(height: 30),
              PaymentTextFields(
                  controller: nameController,
                  text: "Name",
              ),
              SizedBox(height: 30),
              PaymentTextFields(
                  controller: cardController,
                  text: "Card number",
              ),
              SizedBox(height: 30),
              PaymentTextFields(
                controller: dateController,
                text: "Expiry Date",
              ),
              SizedBox(height: 30),
              PaymentTextFields(
                controller: cvcController,
                text: "CVC",
              ),
              SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        circle = !circle;
                      });
                    },
                    child: SizedBox(
                      height: 14,
                      width: 14,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: circle?Theme.of(context).colorScheme.primary:Themes.grey
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text("Set as your default payment method", style: TextStyle(
                    fontSize: 15,
                  ),)
                ],
              ),
              SizedBox(height: 30),
              SizedBox(
                height: 60,
                width: double.maxFinite,
                child: MyElevatedButton(
                  text: "Next",
                  onTapped: (){
                    final country = widget.country;
                    final city = widget.city;
                    final postcode = widget.postcode;
                    final street = widget.street;
                    final name = nameController.text;
                    final card = cardController.text;
                    final date = dateController.text;
                    final cvc = cvcController.text;
                    if(name.isEmpty || card.isEmpty || date.isEmpty || cvc.isEmpty){
                      AppSnackbar.msg(context, AppStrings.barcha);
                    }
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context)=> Checkout(
                            country: country,
                            city: city,
                            postcode: postcode,
                            street: street,
                            name: name,
                            cardNum: card,
                            date: date,
                            cvc: cvc,
                          image: images[currentIndex],
                        )
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


