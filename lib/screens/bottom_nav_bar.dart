import 'package:e_book/screens/cart/cart_page.dart';
import 'package:e_book/screens/home/home_page.dart';
import 'package:e_book/screens/save/save_page.dart';
import 'package:e_book/screens/user/user_page.dart';
import 'package:e_book/themes.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  final _screens = [
    HomePage(),
    SavePage(),
    CartPage(),
    UserPage(),
  ];
  @override
  Widget build(BuildContext context) {
    Widget customBottomNav() {
      return BottomNavigationBar(
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (i) {
            setState(() {
              _selectedIndex = i;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Image.asset(
                    'assets/icons/icon-home.png',
                    width: 20,
                    color: _selectedIndex == 0 ? greenColor : greyColor,
                  ),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Image.asset(
                    'assets/icons/icon-save.png',
                    width: 14,
                    color: _selectedIndex == 1 ? greenColor : greyColor,
                  ),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Image.asset(
                    'assets/icons/icon-cart.png',
                    width: 20,
                    color: _selectedIndex == 2 ? greenColor : greyColor,
                  ),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Image.asset(
                    'assets/icons/icon-user.png',
                    width: 18,
                    color: _selectedIndex == 3 ? greenColor : greyColor,
                  ),
                ),
                label: '')
          ]);
    }

    return Scaffold(
      bottomNavigationBar: customBottomNav(),
      body: Stack(
        children: _screens
            .asMap()
            .map((i, screen) => MapEntry(
                i,
                Offstage(
                  offstage: _selectedIndex != i,
                  child: screen,
                )))
            .values
            .toList(),
      ),
    );
  }
}
