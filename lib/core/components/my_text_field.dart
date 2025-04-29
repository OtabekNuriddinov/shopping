import 'package:flutter/material.dart';
import 'package:shoppin/core/theme/themes.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const MyTextField(
      {super.key, required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(
        color: Theme.of(context).colorScheme.onSecondary
      ),
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Themes.grey),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.onSecondary
        )
      ),
    );
  }
}
