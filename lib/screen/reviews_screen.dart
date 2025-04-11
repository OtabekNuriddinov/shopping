import 'package:flutter/material.dart';
import '/core/theme/colors.dart';
import '/core/theme/strings.dart';

import '../core/components/reviews_widget.dart';
import '../core/components/stars_widget.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
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
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.032),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Reviews(45)",
                style: TextStyle(color: Colors.black, fontSize: width * 0.06),
              ),
              SizedBox(height: height * 0.042),
              ReviewsWidget(
                  image: "assets/images/jessie.jpg",
                  name: AppStrings.jessieName,
                  lastStar: Colors.orange.shade300,
                  leftOn: "Review left on Jan 06, 2020",
                  perspective: AppStrings.jessie,
                  review: AppStrings.jessieRew,
              ),
              SizedBox(height: height * 0.014),
              ReviewsWidget(
                  image: "assets/images/larry.jpg",
                  name: AppStrings.larryName,
                  lastStar: Colors.orange.shade300,
                  leftOn: "Review left on Dec 14, 2019",
                  perspective: AppStrings.larry,
                  review: AppStrings.jessieRew ,
              ),
              SizedBox(height: height * 0.014),
              ReviewsWidget(
                image: "assets/images/bradley.jpg",
                name: AppStrings.bradleyName,
                lastStar: Colors.grey.shade300,
                leftOn: "Review left on Dec 11, 2019",
                perspective: AppStrings.bradley,
                review: AppStrings.bradleyRew ,
              ),
              SizedBox(height: height * 0.014),
              ReviewsWidget(
                image: "assets/images/jackson.jpg",
                name: AppStrings.jacksonName,
                lastStar: Colors.orange.shade300,
                leftOn: "Review left on Dec 12, 2019",
                perspective: AppStrings.jackson,
                review: AppStrings.jacksonRew ,
              ),
            ],
          ),
        ),
      )

    );
  }
}

