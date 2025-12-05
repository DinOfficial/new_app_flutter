import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:the_daily_globe/data/models/categories_model.dart';
import 'package:the_daily_globe/ui/screens/drawer_category_news_screen.dart';

class DGNavigationDrawer extends StatefulWidget {
  const DGNavigationDrawer({super.key});


  @override
  State<DGNavigationDrawer> createState() => _DGNavigationDrawerState();
}

class _DGNavigationDrawerState extends State<DGNavigationDrawer> {
  final List<String> _tabBar = [
    '🔥 Hot News',
    'Sports',
    'Politics',
    'Business',
    'Weather',
    'Travel',
    'Health',
    'Entertainment',
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xff001F28),
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: SvgPicture.asset(
                'assets/images/Logo.svg',
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
          ),
          ..._tabBar.asMap().entries.map((entry) {
            int index = entry.key;
            String title = entry.value;
            bool isSelected = _selectedIndex == index;
            return ListTile(
              selected: isSelected,
              selectedTileColor: Colors.black26,
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return DrawerCategoryNewsScreen(categoryName: entry.value);
                    },
                  ),
                );
              },
              title: Text(
                title,
                style: TextStyle(color: Colors.white.withOpacity(.7), fontSize: 20),
              ),
            );
          }),
        ],
      ),
    );
  }
}
