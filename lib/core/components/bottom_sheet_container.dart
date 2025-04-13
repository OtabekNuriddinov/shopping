import 'package:flutter/material.dart';
import 'package:shoppin/screen/products_screen.dart';

import '../theme/colors.dart';
import '../theme/icons.dart';
import '../theme/strings.dart';
import 'my_elevated_button.dart';

class BottomSheetContainer extends StatelessWidget {
  const BottomSheetContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 680,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Material(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.lock,
                      color: Colors.black,
                      size: 16,
                    ),
                    Text(
                      "facebook.com",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                SizedBox(width: 50)
              ],
            ),
          ),
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.blue.shade800,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcons.facebook,
                Row(
                  children: [
                    Text(
                      "Log in with Facebook",
                      style: TextStyle(fontSize: 16, color: AppColors.white),
                    )
                  ],
                ),
                SizedBox(width: 50)
              ],
            ),
          ),
          SizedBox(height: 30),
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/s_logo.jpg"))),
          ),
          SizedBox(height: 30),
          Text(
            textAlign: TextAlign.center,
            AppStrings.wilReceive,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          SizedBox(height: 100),
          SizedBox(
            height: 60,
            width: 300,
            child: MyElevatedButton(
              text: "Continue",
              onTapped: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductsScreen(),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 30),
          Material(
            child: InkWell(
              onTap: () {},
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.lock, color: Colors.grey),
                Text("Shopin will not post on your behalf on Facebook")
              ],
            ),
          )
        ],
      ),
    );
  }
}
