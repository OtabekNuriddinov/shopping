import 'package:flutter/material.dart';
import 'package:shoppin/core/components/my_elevated_button.dart';
import 'package:shoppin/core/theme/colors.dart';
import 'package:shoppin/core/theme/strings.dart';
import 'package:shoppin/core/utils/app_snackbar.dart';
import 'package:shoppin/screen/payment_method.dart';

import '../core/components/payment_textfield.dart';

class ShippingAddress extends StatefulWidget {
  const ShippingAddress({super.key});

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  late TextEditingController countryController;
  late TextEditingController cityController;
  late TextEditingController postcodeController;
  late TextEditingController streetController;

  @override
  void initState() {
    super.initState();
    countryController = TextEditingController();
    cityController = TextEditingController();
    postcodeController = TextEditingController();
    streetController = TextEditingController();
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Shipping Address",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Divider(),
              SizedBox(height: 10),
              TextField(
                controller: countryController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 20),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.keyboard_arrow_down),
                  ),
                  label: Text(
                    "Country",
                    style: TextStyle(color: Colors.grey),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.darkBlue, width: 2),
                  ),
                ),
              ),
              SizedBox(height: 30),
              PaymentTextFields(
                  controller: cityController, text: "Town / City"),
              SizedBox(height: 30),
              PaymentTextFields(
                  controller: postcodeController, text: "Postcode"),
              SizedBox(height: 30),
              PaymentTextFields(controller: streetController, text: "Street"),
              SizedBox(height: 20),
              Text(
                AppStrings.willBe,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 60),
              SizedBox(
                height: 60,
                width: double.maxFinite,
                child: MyElevatedButton(
                  text: "Next",
                  onTapped: () {
                    final country = countryController.text;
                    final city = cityController.text;
                    final postcode = postcodeController.text;
                    final street = streetController.text;
                    if(country.isEmpty || city.isEmpty || postcode.isEmpty || street.isEmpty){
                      AppSnackbar.msg(context, AppStrings.barcha);
                      return;
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentMethod(
                          country: country,
                          city: city,
                          postcode: postcode,
                          street: street,
                        ),
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
