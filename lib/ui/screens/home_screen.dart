import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:the_daily_globe/ui/screens/business_screen.dart';
import 'package:the_daily_globe/ui/screens/entertainment_screen.dart';
import 'package:the_daily_globe/ui/screens/health_screen.dart';
import 'package:the_daily_globe/ui/screens/politics_screen.dart';
import 'package:the_daily_globe/ui/screens/sports_screen.dart';
import 'package:the_daily_globe/ui/screens/travels_screen.dart';
import 'package:the_daily_globe/ui/screens/weather_screen.dart';
import 'package:the_daily_globe/ui/widgets/dg_app_bar.dart';
import 'package:the_daily_globe/ui/widgets/dg_navigation_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  final String name = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _tabBar = [
    'Sports',
    'Politics',
    'Business',
    'Weather',
    'Travel',
    'Health',
    'Entertainment',
  ];
  final List<Widget> _screen = [
    SportsScreen(),
    PoliticsScreen(),
    BusinessScreen(),
    WeatherScreen(),
    TravelsScreen(),
    HealthScreen(),
    EntertainmentScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabBar.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: SvgPicture.asset('assets/images/Logo.svg', height: 20, width: 36),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.account_circle_outlined))],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: TabBar(
              controller: _tabController,
              dividerHeight: 0,
              labelColor: Colors.blueGrey,
              unselectedLabelColor: Colors.grey,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              indicatorColor: Colors.blueGrey,
              tabs: _tabBar.map((String name) => Tab(child: Text(name))).toList(),
            ),
          ),
          Expanded(
            child: TabBarView(controller: _tabController, children: _screen),
          ),
        ],
      ),
      drawer: DGNavigationDrawer(),
    );
  }
}
