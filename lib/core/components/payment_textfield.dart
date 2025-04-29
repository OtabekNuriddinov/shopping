import 'package:flutter/material.dart';
import 'package:shoppin/core/theme/themes.dart';

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
          style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.onSecondary),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2),
        ),
      ),
    );
  }
}