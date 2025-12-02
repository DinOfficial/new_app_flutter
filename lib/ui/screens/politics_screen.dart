import 'package:flutter/material.dart';

class PoliticsScreen extends StatefulWidget {
  const PoliticsScreen({super.key});

  @override
  State<PoliticsScreen> createState() => _PoliticsScreenState();
}

class _PoliticsScreenState extends State<PoliticsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('PoliticsScreen'),
      ),
    );
  }
}
