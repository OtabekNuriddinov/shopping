import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shoppin/screen/sign_in_screen.dart';
import '/core/theme/strings.dart';
import '../core/components/my_elevated_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late double width;

  late double height;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: height * 0.1, horizontal: width * 0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                AppStrings.shopin,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: width * 0.16,
                    letterSpacing: 10,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: height * 0.05),
              Text(
                AppStrings.amazing,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: width * 0.072,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3),
              ),
              SizedBox(height: 10),
              Text(
                AppStrings.experience,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.primary
                ),
              ),
              SizedBox(height: height * 0.22),
              SizedBox(
                height: height * 0.1,
                width: double.maxFinite,
                child: MyElevatedButton(
                  text: AppStrings.explore,
                  onTapped: () {
                    context.go('/sign-in');
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
