import 'package:flutter/material.dart';
import '/screen/home_screen.dart';
class Shopin extends StatelessWidget {
  const Shopin({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen()
    );
  }
}
