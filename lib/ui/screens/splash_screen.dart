import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_daily_globe/ui/screens/main_bottom_nav_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  final String name = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double opacityLevel = 0.0;

  void _fadeIn() {
    setState(() {
      opacityLevel = 1.0;
    });
  }
  void _moveNextPage(){
    Future.delayed(Duration(seconds: 3), (){
      Navigator.pushReplacementNamed(context, MainBottomNavBar().name);
    });
  }
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 100), () {
      _fadeIn();
    });
    _moveNextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff001F28),
      body: Center(
        // child:SvgPicture.asset('assets/images/Logo.svg', height: 300,),
        child: AnimatedOpacity(
          duration: Duration(seconds: 2),
          curve: Curves.easeIn,
          opacity: opacityLevel,
          child: SvgPicture.asset(
            'assets/images/Logo.svg',
            width: 250,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
