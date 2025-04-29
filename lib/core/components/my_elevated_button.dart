import 'package:flutter/material.dart';

import '../theme/colors.dart';

class MyElevatedButton extends StatelessWidget {
  final String text;
  final void Function() onTapped;
  const MyElevatedButton({
    required this.text,
    required this.onTapped,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onTapped,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }
}
