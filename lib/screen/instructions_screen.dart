import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shoppin/core/theme/colors.dart';
import 'package:shoppin/core/theme/icons.dart';
import 'package:shoppin/core/theme/strings.dart';
import 'package:shoppin/screen/to_email_acc.dart';

import '../core/components/my_elevated_button.dart';

class InstructionsScreen extends StatefulWidget {
  final String? email;
  const InstructionsScreen({this.email, super.key});

  @override
  State<InstructionsScreen> createState() => _InstructionsScreenState();
}

class _InstructionsScreenState extends State<InstructionsScreen> {
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
    final extra = GoRouter.of(context).state.extra;
    if (extra is! Map<String, dynamic>) {
      return Scaffold(
        body: Center(child: Text("Invalid data")),
      );
    }
    final email = extra['email'];
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/s_logo.jpg"),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                AppStrings.instructions,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Theme.of(context).colorScheme.primary),
              ),
              SizedBox(height: 10),
              Text(
                textAlign: TextAlign.center,
                AppStrings.check,
                style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.1, right: screenWidth * 0.1),
                child: SizedBox(
                  height: 60,
                  width: double.maxFinite,
                  child: MyElevatedButton(
                    text: AppStrings.goTo,
                    onTapped: () {
                      context.goNamed('toEmail',
                        extra: {
                         'email': email
                        }
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
