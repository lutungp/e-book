import 'package:e_book/models/book.dart';
import 'package:e_book/screens/home/components/recent_book.dart';
import 'package:e_book/screens/home/components/trending_book.dart';
import 'package:e_book/themes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const nameRoute = '/hiomePage';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _categories = [
    'All Books',
    'Comic',
    'Novel',
    'Manga',
    'Fairy Tail'
  ];

  int _isSelected = 0;

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

    Widget categories(int index) {
      return InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {
          setState(() {
            _isSelected = index;
          });
        },
        child: Container(
          margin: EdgeInsets.only(
            top: 30,
            right: 12,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: _isSelected == index ? greenColor : transparentColor,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            _categories[index],
            style: semiBoldText14.copyWith(
              color: _isSelected == index ? whiteColor : greyColor,
            ),
          ),
        ),
      );
    }

    Widget listCategories() {
      return SingleChildScrollView(
        padding: EdgeInsets.only(left: 30),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: _categories
              .asMap()
              .entries
              .map((MapEntry map) => categories(map.key))
              .toList(),
        ),
      );
    }

    Widget trendingBook() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: bookLists
              .asMap()
              .entries
              .map((MapEntry map) => TrendingBook(
                    info: bookLists[map.key],
                  ))
              .toList(),
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
          listCategories(),
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
              top: 30,
            ),
            child: Text(
              'Trending Book',
              style: semiBoldText16.copyWith(color: blackColor),
            ),
          ),
          trendingBook(),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
