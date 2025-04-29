import 'package:flutter/material.dart';
import '../theme/colors.dart';

sealed class AppSnackbar {
  static void msg(BuildContext context, String message, {Color color = Colors.black}) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
          backgroundColor: color,
        ),
      );
  }
}