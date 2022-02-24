// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:new_project/pages/nav_pages/Home_Page.dart';
import 'package:new_project/pages/nav_pages/bar_item_page.dart';
import 'package:new_project/pages/nav_pages/my_page.dart';
import 'package:new_project/pages/nav_pages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [HomePage(), SearchPage(), BarItemPage(), MyPage()];

  int selectedIndex = 0;

  void on_tap(int tap) {
    setState(() {
      selectedIndex = tap;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.grey.withOpacity(0.5),
          onTap: on_tap,
          currentIndex: selectedIndex,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.apps), label: 'apps'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
            BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'bar'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile')
          ],
          showSelectedLabels: false,
          unselectedItemColor: Colors.grey.withOpacity(0.8),
          elevation: 0,
          selectedItemColor: Colors.black),
    );
  }
}
