import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class DGAppBar extends StatelessWidget implements PreferredSizeWidget{
  const DGAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: SvgPicture.asset('assets/images/Logo.svg', height: 20, width: 36),
      centerTitle: true,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
