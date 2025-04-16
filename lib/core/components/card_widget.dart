import 'package:flutter/material.dart';

import '../theme/colors.dart';

class CardWidget extends StatelessWidget {
  final String image;
  final void Function() onPressed;
  final int index;
  final int currentIndex;
  const CardWidget({
    required this.image,
    required this.onPressed,
    required this.index,
    required this.currentIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onPressed,
          child: Card(
            elevation: 10,
            color: index==currentIndex?AppColors.darkBlue:Colors.white,
            child: SizedBox(
              height: 60,
              width: 100,
              child: ClipRect(
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  fit: BoxFit.fill,
                  image,
                ),
              ),
            ),
          )
      ),
    );
  }
}