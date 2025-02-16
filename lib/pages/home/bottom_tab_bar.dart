import 'package:assistant/pages/business/my.dart';
import 'package:assistant/pages/business/talk.dart';
import 'package:assistant/pages/business/home.dart';
import 'package:flutter/material.dart';

class BottomTabBar extends StatefulWidget {
  const BottomTabBar({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _BottomTabBarState();
  }
}

class _BottomTabBarState extends State<BottomTabBar> {
  int _selectedIndex = 0;

  // 定义每个 tab 对应的页面
  static const List<Widget> _pages = <Widget>[
    HomePage(),
    Talk(),
    MyPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // 显示当前选中的页面
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber, // 选中项的高亮颜色
        // splashColor: Colors.transparent, // 禁用水波纹效果
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone_in_talk),
            label: 'talk',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'my',
          ),
        ],
      ),
    );
  }
}