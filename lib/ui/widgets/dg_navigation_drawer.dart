import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DGNavigationDrawer extends StatelessWidget {
  const DGNavigationDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
        backgroundColor: Color(0xff001F28),
        children: [
          Container(
            height: 80,
            padding: const EdgeInsets.all(16.0), // Padding inside the container
            alignment: Alignment.centerLeft, // This aligns the child (image) to the left
            child: SvgPicture.asset(
              'assets/images/Logo.svg',
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              width: 170,
            ),
          ),
          Divider(thickness: .4, color: Colors.grey.shade800),
          ListTile(
            title: Text('SECTIONS', style: TextStyle(color: Colors.green.withOpacity(.7), fontSize: 20)),
          ),
          ListTile(
            title: Text('Top Stories', style: TextStyle(color: Colors.white.withOpacity(.7), fontSize: 20)),
          ),
          ListTile(
            hoverColor: Colors.green.withOpacity(.4) ,
            title: Text('Top Stories', style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
        ]
    );
  }
}