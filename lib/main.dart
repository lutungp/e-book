import 'package:e_book/screens/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'E-book App',
        debugShowCheckedModeBanner: false,
        home: BottomNavBar());
  }
}
