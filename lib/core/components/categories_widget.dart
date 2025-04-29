import 'package:flutter/material.dart';
import 'package:shoppin/core/theme/themes.dart';

class CategoriesWidget extends StatelessWidget {
  final String text;
  final double width;
  final void Function() onTapped;
  final int index;
  final int selectedIndex;
  const CategoriesWidget({
    required this.text,
    required this.width,
    required this.index,
    required this.selectedIndex,
    required this.onTapped,
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onTapped,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        Container(
          color: selectedIndex == index?Theme.of(context).colorScheme.secondary:Themes.grey,
          width: width,
          height: 2,
        )
      ],
    );
  }
}
