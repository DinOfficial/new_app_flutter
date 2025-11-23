import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_daily_globe/ui/screens/home_screen.dart';
import 'package:the_daily_globe/ui/screens/search_screen.dart';

class MainBottomNavBar extends StatefulWidget {
  const MainBottomNavBar({super.key});

  final String name = 'main-nav-bar';

  @override
  State<MainBottomNavBar> createState() => _MainBottomNavBarState();
}

class _MainBottomNavBarState extends State<MainBottomNavBar> {
  int _currentIndex = 0;
  final List<Widget> _pages = [HomeScreen(), SearchScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: SvgPicture.asset('assets/images/Logo.svg',height: 20,width: 36,),
        centerTitle: true,
        actions: [

        ],
      ),
      drawer: Drawer() ,
      body: _pages[_currentIndex],
      bottomNavigationBar:BottomNavigationBar(
        backgroundColor: Color(0xff001F28),
        currentIndex: _currentIndex,
        onTap: (int index) {
          _currentIndex = index;
          setState(() {});
        },
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        items: <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              'assets/icons/home_24px.svg',
              color: Colors.white,
            ),
            icon: SvgPicture.asset('assets/icons/home_outline_24px.svg', color: Colors.white60,),
            label:'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              'assets/icons/search_24px.svg',
              color: Colors.white,
            ),
            icon: SvgPicture.asset('assets/icons/search_24px.svg',color: Colors.white60),
            label: 'Search',
          ),
        ],
      ),
    );
  }
}
