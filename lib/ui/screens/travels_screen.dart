import 'package:flutter/material.dart';

class TravelsScreen extends StatefulWidget {
  const TravelsScreen({super.key});

  @override
  State<TravelsScreen> createState() => _TravelsScreenState();
}

class _TravelsScreenState extends State<TravelsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('TravelsScreen'),
      ),
    );
  }
}
