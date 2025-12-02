import 'package:flutter/material.dart';
class SportsScreen extends StatefulWidget {
  const SportsScreen({super.key});


  @override
  State<SportsScreen> createState() => _SportsScreenState();
}

class _SportsScreenState extends State<SportsScreen> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('SportsScreen'),
      ),
    );
  }
}
