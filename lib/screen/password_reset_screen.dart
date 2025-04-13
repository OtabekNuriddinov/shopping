import 'package:flutter/material.dart';
import 'package:shoppin/core/components/my_elevated_button.dart';
import 'package:shoppin/core/components/my_text_field.dart';
import 'package:shoppin/core/theme/colors.dart';
import 'package:shoppin/core/theme/strings.dart';
import 'package:shoppin/core/utils/app_snackbar.dart';
import 'package:shoppin/screen/instructions_screen.dart';
import 'package:shoppin/servis/user_service.dart';

class PasswordResetScreen extends StatefulWidget {
  const PasswordResetScreen({super.key});

  @override
  State<PasswordResetScreen> createState() => _PasswordResetScreenState();
}

class _PasswordResetScreenState extends State<PasswordResetScreen> {
  late double screenWidth;
  late double screenHeight;
  late TextEditingController emailController;
  late UserService userService;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
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
      appBar: AppBar(
        backgroundColor: AppColors.orange,
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
              Text(
                AppStrings.passRes,
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkBlue),
              ),
              SizedBox(height: 5),
              Text(
                textAlign: TextAlign.center,
                AppStrings.enter,
                style: TextStyle(fontSize: 18, color: AppColors.darkBlue),
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.only(left: 50, right: 50),
                child: MyTextField(
                  controller: emailController,
                  hintText: AppStrings.email,
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.only(left: 50, right: 50),
                child: SizedBox(
                  height: 60,
                  width: double.maxFinite,
                  child: MyElevatedButton(
                    text: AppStrings.send,
                    onTapped: () {
                      String email = emailController.text;
                      if (email.isEmpty) {
                        AppSnackbar.msg(
                            context, "Iltimos maydonni to'ldiring!");
                        return;
                      }
                      bool checker = userService.emailChecker(email);
                      if (checker) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InstructionsScreen(email: email),
                          ),
                        );
                      }
                      else{
                        AppSnackbar.msg(context, 'Bunday Email mavjud emas!');
                        return;
                      }
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
