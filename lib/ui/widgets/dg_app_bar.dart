import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DmAppBar extends StatelessWidget {
  const DmAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: SvgPicture.asset('assets/images/Logo.svg', height: 20, width: 36),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.account_circle_outlined))],
      ),
    );
  }
}
