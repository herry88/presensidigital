import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:presensi/screens/profile.dart';

import 'about.dart';
import 'homepage.dart';

class TabbarPage extends StatefulWidget {
  const TabbarPage({Key? key}) : super(key: key);

  @override
  State<TabbarPage> createState() => _TabbarPageState();
}

class _TabbarPageState extends State<TabbarPage> {
  int _index = 0;
  late PageController _pageController;

  List _title = ['Home', 'About', 'Profile'];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _title[_index],
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          children: [
            HomePage(),
            AboutPage(),
            ProfilePage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        selectedIndex: _index,
        onItemSelected: (index) => setState(() {
          _index = index;
          _pageController.jumpToPage(index);
        }),
        items: [
          BottomNavyBarItem(
            icon: const Icon(Icons.home),
            title: _title[_index],
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.person),
            title: _title[_index],
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.person),
            title: _title[_index],
          ),
        ],
      ),
    );
  }
}
