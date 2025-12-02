import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_daily_globe/ui/screens/home_screen.dart';
import 'package:the_daily_globe/ui/screens/search_screen.dart';

import '../widget/dg_app_bar.dart';

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
      // App Bar
      appBar: DGAppBar(),

      // SideBar // Drawer
      drawer: NavigationDrawer(
        backgroundColor: Color(0xff001F28),
        children: [
          Container(
            height: 80,
            padding: const EdgeInsets.all(16.0), // Padding inside the container
            alignment: Alignment.centerLeft, // This aligns the child (image) to the left
            child: SvgPicture.asset(
              'assets/images/Logo.svg',
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              width: 170,
            ),
          ),
          Divider(thickness: .4, color: Colors.grey.shade800),
          ListTile(
            title: Text(
              'SECTIONS',
              style: TextStyle(color: Colors.green.withOpacity(.7), fontSize: 20),
            ),
          ),
          ListTile(
            title: Text(
              'Top Stories',
              style: TextStyle(color: Colors.white.withOpacity(.7), fontSize: 20),
            ),
          ),
          ListTile(
            hoverColor: Colors.green.withOpacity(.4),
            title: Text('Top Stories', style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
        ],
      ),

      // Main Body
      body: _pages[_currentIndex],

      // Main Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff001F28),
        currentIndex: _currentIndex,
        onTap: (int index) {
          _currentIndex = index;
          setState(() {});
        },
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset('assets/icons/home_24px.svg', color: Colors.white),
            icon: SvgPicture.asset('assets/icons/home_outline_24px.svg', color: Colors.white60),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset('assets/icons/search_24px.svg', color: Colors.white),
            icon: SvgPicture.asset('assets/icons/search_24px.svg', color: Colors.white60),
            label: 'Search',
          ),
        ],
      ),
    );
  }
}


