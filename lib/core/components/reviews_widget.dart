import 'package:flutter/material.dart';
import '/core/components/stars_widget.dart';

class ReviewsWidget extends StatelessWidget {
  final String image;
  final String name;
  final Color lastStar;
  final String leftOn;
  final String perspective;
  final String review;
  const ReviewsWidget({
    required this.image,
    required this.name,
    required this.lastStar,
    required this.leftOn,
    required this.perspective,
    required this.review,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(image),
              ),
              SizedBox(width: 8),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  StarsWidget(colorLast: lastStar),
                ],
              ),
              SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  leftOn,
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              )
            ],
          ),
          SizedBox(height: 16),
          Text(
            perspective,
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 5),
          Text(
            review,
            style: TextStyle(color: Colors.grey, fontSize: 13),
          ),
          SizedBox(height: 5),
          Divider()
        ],
      );

  }
}
