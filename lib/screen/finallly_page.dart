import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shoppin/core/components/my_elevated_button.dart';
import 'package:shoppin/core/theme/colors.dart';
import 'package:shoppin/core/theme/strings.dart';
import 'package:shoppin/screen/products_screen.dart';

class FinallyPage extends StatefulWidget {
  const FinallyPage({super.key});

  @override
  State<FinallyPage> createState() => _FinallyPageState();
}

class _FinallyPageState extends State<FinallyPage> {
  late double screenWidth;
  late double screenHeight;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppStrings.congrats,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: screenWidth * 0.1,
              ),
            ),
            Text(
              textAlign: TextAlign.center,
              AppStrings.yourOrder,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: screenWidth * 0.04,
              ),
            ),
            SizedBox(height: screenHeight * 0.28),
            SizedBox(
              height: screenHeight * 0.1,
              width: screenWidth * 0.76,
              child: MyElevatedButton(
                  text: AppStrings.continueShop,
                  onTapped: () {
                    context.go('/products');
                  }),
            )
          ],
        ),
      ),
    );
  }
}
