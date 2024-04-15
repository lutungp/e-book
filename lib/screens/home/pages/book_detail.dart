import 'package:e_book/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookDetail extends StatelessWidget {
  static const nameRoute = '/bookDetails';
  const BookDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final Map data = ModalRoute.of(context)?.settings.arguments as Map;
    Widget header() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        margin: EdgeInsets.only(
          top: 30,
          bottom: 50,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              child: Icon(
                Icons.chevron_left_rounded,
                size: 30,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Text(
              'Book Details',
              style: semiBoldText14.copyWith(color: blackColor),
            ),
            Icon(Icons.share_outlined)
          ],
        ),
      );
    }

    Widget bookImage() {
      return Hero(
        tag: data['imageUrl'],
        child: Container(
          height: 267,
          width: 175,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(data["imageUrl"]),
            ),
          ),
        ),
      );
    }

    Widget bottomReadNow() {
      return Container(
        height: 50,
        margin: EdgeInsets.only(top: 30),
        width: double.infinity,
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            backgroundColor: greenColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Text(
            'Read Now',
            style: semiBoldText20.copyWith(color: whiteColor),
          ),
        ),
      );
    }

    Widget infoDescription() {
      return Container(
        padding: EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 20,
        ),
        margin: EdgeInsets.only(top: 20),
        height: 60,
        decoration: BoxDecoration(
          color: greyColorInfo,
          borderRadius: BorderRadius.circular(9),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  'Rating',
                  style: mediumText10.copyWith(color: dividerColor),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  '4.8',
                  style: semiBoldText12.copyWith(color: blackColor2),
                )
              ],
            ),
            VerticalDivider(
              color: dividerColor,
              thickness: 1,
            ),
            Column(
              children: [
                Text(
                  'Number of pages',
                  style: mediumText10.copyWith(color: dividerColor),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  '140 Pages',
                  style: semiBoldText12.copyWith(color: blackColor2),
                )
              ],
            ),
            VerticalDivider(
              color: dividerColor,
              thickness: 1,
            ),
            Column(
              children: [
                Text(
                  'Languages',
                  style: mediumText10.copyWith(color: dividerColor),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'ENG',
                  style: semiBoldText12.copyWith(color: blackColor2),
                )
              ],
            ),
          ],
        ),
      );
    }

    Widget description() {
      return Container(
        margin: EdgeInsets.only(top: 50),
        padding: EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 30,
        ),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['title'],
                        style: semiBoldText20.copyWith(color: blackColor2),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        data['writers'],
                        style: semiBoldText14.copyWith(color: greyColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Free Access',
                  style: mediumText14.copyWith(color: greenColor),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Description',
              style: semiBoldText14.copyWith(color: blackColor2),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              'Enchantment, as defined by bestselling business guru Guy Kawasaki, is not about manipulating people. It transforms situations and relationships.',
              style: regulerText12.copyWith(color: greyColor),
            ),
            infoDescription(),
            bottomReadNow(),
          ],
        ),
      );
    }

    Widget saveButton() {
      return Positioned(
        top: 400,
        right: 30,
        child: Container(
          width: 50,
          padding: EdgeInsets.symmetric(vertical: 16),
          height: 50,
          decoration: BoxDecoration(
            color: greenColor,
            shape: BoxShape.circle,
          ),
          child: Image.asset('assets/icons/icon-save.png'),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  header(),
                  bookImage(),
                  description(),
                ],
              ),
              saveButton(),
            ],
          ),
        ],
      ),
    );
  }
}
