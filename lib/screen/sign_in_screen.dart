import 'package:flutter/material.dart';
import 'package:shoppin/core/components/my_elevated_button.dart';
import 'package:shoppin/core/components/my_rich_text.dart';
import 'package:shoppin/core/theme/colors.dart';
import 'package:shoppin/core/theme/icons.dart';
import 'package:shoppin/core/theme/strings.dart';
import 'package:shoppin/core/utils/app_snackbar.dart';
import 'package:shoppin/screen/password_reset_screen.dart';
import 'package:shoppin/screen/products_screen.dart';
import 'package:shoppin/screen/sign_up_screen.dart';
import 'package:shoppin/servis/app_service.dart';
import 'package:shoppin/servis/user_service.dart';

import '../core/components/bottom_sheet_container.dart';
import '../core/components/my_text_field.dart';
import '../models/user_model.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late double screenWidth;
  late double screenHeight;

  late UserService userService;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    userService = UserService();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.orange,
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: screenHeight * 0.1,
                left: screenWidth * 0.1,
                right: screenWidth * 0.1,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.signIn,
                    style: TextStyle(
                      fontSize: screenWidth * 0.068,
                      color: AppColors.darkBlue,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.028),
                  MyTextField(
                    controller: emailController,
                    hintText: AppStrings.email,
                  ),
                  SizedBox(height: screenHeight * 0.028),
                  MyTextField(
                    controller: passwordController,
                    hintText: AppStrings.password,
                  ),
                  SizedBox(height: screenHeight * 0.042),
                  SizedBox(
                    height: 70,
                    width: double.maxFinite,
                    child: MyElevatedButton(
                      text: AppStrings.signIn,
                      onTapped: () {
                        String email = emailController.text.trim();
                        String password = passwordController.text.trim();

                        if (email.isEmpty || password.isEmpty) {
                          AppSnackbar.msg(
                              context, "Email va parolni to'ldiring!");
                          return;
                        }
                        User? exUser = userService.finding(
                          email,
                          password,
                        );
                        if (exUser != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductsScreen(),
                            ),
                          );
                        } else {
                          AppSnackbar.msg(context,
                              "Foydalanuvchi topilmadi! Sign Up ni bosing!");
                        }
                      },
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.028),
                  SizedBox(
                    height: screenHeight * 0.1,
                    width: double.maxFinite,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: BorderSide(color: AppColors.darkBlue, width: 2),
                      ),
                      onPressed: () {
                        _showModalBottomSheet(context);
                      },
                      child: Text(
                        AppStrings.withFacebook,
                        style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.bold,
                            color: AppColors.darkBlue),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.028),
                  MyRichText(
                    request: AppStrings.dontHaveAcc,
                    mainText: AppStrings.signUp,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: screenHeight * 0.18),
                ],
              ),
            ),
            Positioned(
              bottom: screenHeight * 0.04,
              right: screenWidth * 0.08,
              child: Material(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.orange,
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PasswordResetScreen(),
                      ),
                    );
                  },
                  child: Text(
                    AppStrings.forgot,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.036,
                        color: AppColors.darkBlue),
                  ),
                ),
              ),
            )
          ],
        ));
  }

  Future<dynamic> _showModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return BottomSheetContainer();
        });
  }
}
