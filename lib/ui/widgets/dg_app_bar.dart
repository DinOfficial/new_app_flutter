import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:the_daily_globe/ui/widgets/dg_navigation_drawer.dart';

class DGAppBar extends StatelessWidget implements PreferredSizeWidget{
  const DGAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: SvgPicture.asset('assets/images/Logo.svg', height: 20, width: 36),
      centerTitle: true,
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.account_circle_outlined))],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
