import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  final String name = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
    TabBar(tabs: [
      Tab(
        child: Text('Weather'),
      ),
      Tab(
        child: Text('Sports'),
      ),
      Tab(
        child: Text('Travel'),
      ),
      Tab(
        child: Text('Politics'),
      ),
      Tab(
        child: Text('Analysis'),
      ),Tab(
        child: Text('Business'),
      ),Tab(
        child: Text('Entertainment'),
      ),
    ]
    )
    );
  }
}
