import 'package:e_book/screens/home/components/recent_book.dart';
import 'package:e_book/themes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/profile-pic.png'),
                ),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Column(
              children: [
                Text(
                  'Hello Sarah,',
                  style: semiBoldText16,
                ),
                Text(
                  'Good Morning',
                  style: regulerText14.copyWith(color: greyColor),
                )
              ],
            ),
            Spacer(),
            Image.asset(
              'assets/icons/icon-menu.png',
              width: 18,
            )
          ],
        ),
      );
    }

    Widget searhField() {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: TextField(
            decoration: InputDecoration(
                hintText: 'Find Your Favorite Book',
                hintStyle: mediumText12.copyWith(color: greyColor),
                fillColor: greyColorSearchField,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                isCollapsed: true,
                contentPadding: EdgeInsets.all(18),
                suffixIcon: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: greenColor,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Icon(
                      Icons.search_rounded,
                      color: whiteColor,
                    ),
                  ),
                ))),
      );
    }

    Widget recentbook() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            RecentBook(
              image: 'assets/images/recent-book-1.png',
              title: 'The Magic',
            ),
            SizedBox(
              width: 20,
            ),
            RecentBook(
              image: 'assets/images/recent-book-2.png',
              title: 'The Magic',
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 30,
            ),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                SizedBox(
                  height: 30,
                ),
                searhField(),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Recent Book',
                    style: semiBoldText16.copyWith(color: blackColor),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                recentbook(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
