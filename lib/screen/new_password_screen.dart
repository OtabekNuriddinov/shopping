import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shoppin/core/components/my_elevated_button.dart';
import 'package:shoppin/core/components/my_text_field.dart';
import 'package:shoppin/core/theme/colors.dart';
import 'package:shoppin/core/theme/strings.dart';
import 'package:shoppin/core/utils/app_snackbar.dart';
import 'package:shoppin/screen/successful.dart';
import 'package:shoppin/servis/user_service.dart';

class NewPasswordScreen extends StatefulWidget {
  final String? email;
  const NewPasswordScreen({this.email, super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  late TextEditingController newPassController;
  late TextEditingController newPassConfirmController;
  late UserService userService;

  @override
  void initState() {
    super.initState();
    newPassController = TextEditingController();
    newPassConfirmController = TextEditingController();
    userService = UserService();
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
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.newPass,
                style: TextStyle(
                  fontSize: 40,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              SizedBox(height: 20),
              MyTextField(
                controller: newPassController,
                hintText: AppStrings.newPass,
              ),
              SizedBox(height: 20),
              MyTextField(
                controller: newPassConfirmController,
                hintText: AppStrings.confirmPassword,
              ),
              SizedBox(height: 40),
              SizedBox(
                height: 60,
                width: double.maxFinite,
                child: MyElevatedButton(
                  text: AppStrings.save,
                  onTapped: () {
                    String newPass = newPassController.text;
                    String confirmPass = newPassConfirmController.text;
                    if (newPass.isEmpty || confirmPass.isEmpty) {
                      AppSnackbar.msg(
                          context, "Iltimos maydonlarni to'ldiring!");
                      return;
                    }
                    if (newPass != confirmPass) {
                      AppSnackbar.msg(
                          context, "Parolni tasdiqlashda Xatolik bor!");
                      return;
                    }
                    userService.passwordReset(email ?? "", newPass);
                    context.goNamed('successful');
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
