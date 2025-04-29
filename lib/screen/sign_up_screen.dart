import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shoppin/core/components/my_elevated_button.dart';
import 'package:shoppin/core/components/my_text_field.dart';
import 'package:shoppin/core/theme/strings.dart';
import 'package:shoppin/core/utils/app_snackbar.dart';
import 'package:shoppin/models/user_model.dart';
import 'package:shoppin/screen/congrats_screen.dart';
import 'package:shoppin/servis/user_service.dart';

import '../core/components/my_rich_text.dart';
import '../core/theme/colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmationController;
  late double screenWidth;
  late double screenHeight;

  late UserService userService;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmationController = TextEditingController();
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
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Padding(
        padding: EdgeInsets.only(
          top: screenHeight * 0.1,
          left: screenWidth * 0.1,
          right: screenWidth * 0.1,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.signUp,
              style: TextStyle(
                fontSize: screenWidth * 0.068,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(height: screenHeight * 0.028),
            MyTextField(
              controller: nameController,
              hintText: AppStrings.name,
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
            SizedBox(height: screenHeight * 0.028),
            MyTextField(
              controller: confirmationController,
              hintText: AppStrings.confirm,
            ),
            SizedBox(height: screenWidth * 0.042),
            SizedBox(
              height: screenHeight * 0.1,
              width: double.maxFinite,
              child: MyElevatedButton(
                text: AppStrings.signUp,
                onTapped: () {
                  String name = nameController.text;
                  String email = emailController.text;
                  String password = passwordController.text;
                  String confirmPass = confirmationController.text;

                  if (name.isEmpty ||
                      email.isEmpty ||
                      password.isEmpty ||
                      confirmPass.isEmpty) {
                    AppSnackbar.msg(
                        context, "Iltimos hamma maydonlarni to'ldirin!");
                    return;
                  }
                  if (password != confirmPass) {
                    AppSnackbar.msg(
                        context, "Parolingizni qayta yozishda xato bor!");
                    return;
                  }
                  User newUser = User(
                    id: userService.usersList.length + 1,
                    name: name,
                    email: email,
                    password: password,
                  );
                  bool check = userService.addUser(newUser);
                  if (check) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Congrats(),
                      ),
                    );
                  }
                  else{
                    AppSnackbar.msg(context, "Bu email bilan user mavjud!");
                    return;
                  }
                },
              ),
            ),
            SizedBox(height: screenWidth * 0.028),
            MyRichText(
              request: AppStrings.already,
              mainText: AppStrings.signIn,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
