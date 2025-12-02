import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DGAppBar extends StatelessWidget implements PreferredSize{
  const DGAppBar({
    super.key,
  });

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
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>const Size.fromHeight(kToolbarHeight);
}