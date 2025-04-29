import 'package:flutter/material.dart';
import 'package:shoppin/core/components/my_elevated_button.dart';
import 'package:shoppin/core/theme/strings.dart';
import 'package:shoppin/screen/new_password_screen.dart';
import '../core/theme/themes.dart';
import '/core/theme/colors.dart';

class ToEmailAcc extends StatefulWidget {
  final String email;
  const ToEmailAcc({required this.email, super.key});

  @override
  State<ToEmailAcc> createState() => _ToEmailAccState();
}

class _ToEmailAccState extends State<ToEmailAcc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        leading: BackButton(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_circle_down_outlined),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.delete_outline_sharp)),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.message_outlined),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
          SizedBox(width: 10)
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    AppStrings.recover,
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.inbox_outlined,
                    color: Theme.of(context).colorScheme.secondary
                  ),
                  SizedBox(width: 8),
                  Container(
                    width: 40,
                    height: 24,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Themes.grey),
                    child: Center(
                      child: Text(
                        AppStrings.inbox,
                        style: TextStyle(color: Theme.of(context).colorScheme.onSecondary, fontSize: 12),
                      ),
                    ),
                  ),
                  Spacer(),
                  Material(
                    color: Theme.of(context).colorScheme.onPrimary,
                    child: InkWell(
                      onTap: () {},
                      child: Icon(Icons.star_border),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    child: Text(
                      "S",
                      style: TextStyle(color: Theme.of(context).colorScheme.onPrimary,),
                    ),
                  ),
                  SizedBox(width: 14),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        AppStrings.shopin,
                        style: TextStyle(fontSize: 16),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("to me"),
                          Material(
                            color: AppColors.white,
                            child: InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4),
                                child: Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  size: 16,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [Text("17:66")],
                  ),
                  Spacer(),
                  Material(
                    color: AppColors.white,
                    child: InkWell(
                        onTap: () {},
                        child: Icon(Icons.arrow_circle_left_outlined)),
                  ),
                  SizedBox(width: 8),
                  Material(
                    color: AppColors.white,
                    child: InkWell(
                      onTap: () {},
                      child: Icon(Icons.more_horiz),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Text(
                AppStrings.reset,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                AppStrings.hi,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                AppStrings.weHave,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                AppStrings.click,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                AppStrings.thisLink,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 36),
              SizedBox(
                height: 60,
                width: 260,
                child: MyElevatedButton(
                  text: AppStrings.passRes,
                  onTapped: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewPasswordScreen(
                          email: widget.email,
                        ),
                      ),
                    );
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
