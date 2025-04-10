import 'package:flutter/material.dart';

class StarsWidget extends StatelessWidget {
  final Color colorLast;
  const StarsWidget({
    required this.colorLast,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star, color: Colors.orange.shade300, size: 16),
        SizedBox(width: 5),
        Icon(Icons.star, color: Colors.orange.shade300, size: 16),
        SizedBox(width: 5),
        Icon(Icons.star, color: Colors.orange.shade300, size: 16),
        SizedBox(width: 5),
        Icon(Icons.star, color: Colors.orange.shade300, size: 16),
        SizedBox(width: 5),
        Icon(Icons.star, color: colorLast, size: 16),
      ],
    );
  }
}