import 'package:flutter/material.dart';

class PopularTextButton extends StatelessWidget {
  const PopularTextButton({super.key, required this.text, required this.onTap});

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Colors.black26),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onTap,
      child: Text(text, style: TextStyle(color: Colors.blueGrey)),
    );
  }
}
