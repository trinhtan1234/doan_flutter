import 'package:doan_flutter/acount/screen_login.dart';
import 'package:doan_flutter/diary_check/screen_diary_check.dart';
import 'package:doan_flutter/map/homepage.dart';
import 'package:flutter/material.dart';

class ScreenNavigationBottom extends StatefulWidget {
  const ScreenNavigationBottom({super.key});

  @override
  State<ScreenNavigationBottom> createState() => _ScreenNavigationBottomState();
}

class _ScreenNavigationBottomState extends State<ScreenNavigationBottom> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const ScreenMap(),
    const ScreenDiaryCheck(),
    const ScreenLogin(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Bản đồ'),
          BottomNavigationBarItem(icon: Icon(Icons.check_box), label: 'Check'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Tài khoản'),
        ],
      ),
    );
  }
}
