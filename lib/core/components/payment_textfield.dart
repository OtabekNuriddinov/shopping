import 'package:flutter/material.dart';

import '../theme/colors.dart';

class PaymentTextFields extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  const PaymentTextFields({
    required this.controller,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(bottom: 20),
        label: Text(
          text,
          style: TextStyle(color: Colors.grey),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.darkBlue, width: 2),
        ),
      ),
    );
  }
}