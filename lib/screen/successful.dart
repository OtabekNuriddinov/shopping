import 'package:flutter/material.dart';
import 'package:shoppin/core/components/my_elevated_button.dart';
import 'package:shoppin/core/theme/colors.dart';
import 'package:shoppin/core/theme/strings.dart';
import 'package:shoppin/screen/sign_in_screen.dart';

class Successful extends StatefulWidget {
  const Successful({super.key});

  @override
  State<Successful> createState() => _SuccessfulState();
}

class _SuccessfulState extends State<Successful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.orange,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppStrings.newPass,
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkBlue),
            ),
            SizedBox(height: 8),
            Text(
              textAlign: TextAlign.center,
                "You successfully reset your password.\nPlease user your password to sign in.",
              style: TextStyle(fontSize: 16, color: AppColors.darkBlue),
            ),
            SizedBox(height: 20),
            MyElevatedButton(
                text: AppStrings.signIn,
                onTapped: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen(),),);
                }
            )
          ],
        ),
      ),
    );
  }
}
