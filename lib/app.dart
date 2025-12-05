import 'package:flutter/material.dart';
import 'package:the_daily_globe/ui/screens/drawer_category_news_screen.dart';
import 'package:the_daily_globe/ui/screens/home_screen.dart';
import 'package:the_daily_globe/ui/screens/main_bottom_nav_bar.dart';
import 'package:the_daily_globe/ui/screens/news_details_screen.dart';
import 'package:the_daily_globe/ui/screens/splash_screen.dart';

class TheDailyGlobeApp extends StatefulWidget {
  const TheDailyGlobeApp({super.key});

  @override
  State<TheDailyGlobeApp> createState() => _TheDailyGlobeAppState();
}

class _TheDailyGlobeAppState extends State<TheDailyGlobeApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        SplashScreen().name: (_)=>SplashScreen(),
        HomeScreen().name: (_) => HomeScreen(),
        MainBottomNavBar().name : (_) => MainBottomNavBar(),
      },
    );
  }
}
