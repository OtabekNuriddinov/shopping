import 'package:flutter/material.dart';

import '../theme/colors.dart';

sealed class AppDialog {
  static Future<dynamic> showMyDialog({
    required BuildContext context,
    required String mainText,
    required String text,
    required leftButText,
    required rightButText,
    required void Function() pressLeft,
    required void Function() pressRight,
  }) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: AppColors.white,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  mainText,
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
                SizedBox(height: 10),
                Text(
                  textAlign: TextAlign.center,
                  text,
                  style: TextStyle(fontSize: 16, letterSpacing: 1),
                )
              ],
            ),
            actions: <Widget>[
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.darkBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: pressLeft,
                      child: Text(
                        leftButText,
                        style: TextStyle(color: AppColors.white),
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: BorderSide(color: AppColors.darkBlue, width: 2),
                      ),
                      onPressed: pressRight,
                      child: Text(
                        rightButText,
                        style: TextStyle(color: AppColors.darkBlue),
                      ),
                    ),
                  ),
                ],
              )
            ],
          );
        });
  }
}
