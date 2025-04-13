import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';

class MyRichText extends StatelessWidget {
  final String request;
  final String mainText;
  final void Function() onPressed;
  const MyRichText({
    required this.request,
    required this.mainText,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0, 0),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: request,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          TextSpan(
            text: mainText,
            style: TextStyle(
                color: AppColors.darkBlue,
                fontSize: 18,
                fontWeight: FontWeight.bold),
            recognizer: TapGestureRecognizer()..onTap = onPressed,
          )
        ]),
      ),
    );
  }
}
