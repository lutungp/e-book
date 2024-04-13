import 'package:e_book/themes.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class RecentBook extends StatelessWidget {
  const RecentBook({
    super.key,
    required this.image,
    required this.title,
  });

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: borderColorRecentBook),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Row(
        children: [
          Image.asset(
            image,
            width: 90,
          ),
          SizedBox(
            width: 18,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: semiBoldText14.copyWith(color: blackColor2),
              ),
              CircularPercentIndicator(
                reverse: true,
                radius: 25,
                lineWidth: 6,
                animation: true,
                percent: 0.5,
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: greenColor,
              ),
              Text(
                '50% Completed',
                style: mediumText12.copyWith(
                  color: greyColorRecentBook,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
