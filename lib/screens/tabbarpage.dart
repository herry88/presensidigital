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
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _index,
          onTap: (index) {
            _pageController.jumpToPage(index);
            setState(() {
              _index = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              tooltip: _title[_index],
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.info),
              tooltip: _title[_index],
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.person),
              tooltip: _title[_index],
            ),
          ],
        ));
  }
}
