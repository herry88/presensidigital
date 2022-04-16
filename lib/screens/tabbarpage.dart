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
      bottomNavigationBar: bottomBar(),
    );
  }

  //bottomWidget
  Widget bottomBar() {
    return BottomNavyBar(
      selectedIndex: _index,
      onItemSelected: (_index) {
        setState(() {
          _index = _index;
        });
        _pageController.jumpToPage(_index);
      },
      items: [
        BottomNavyBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
          activeColor: Colors.amber,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.info),
          title: Text('Info'),
          activeColor: Colors.amber,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.person),
          title: Text('Person'),
          activeColor: Colors.amber,
        ),
      ],
    );
  }
}
