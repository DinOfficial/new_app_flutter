import 'package:flutter/material.dart';

class PopularTextButton extends StatelessWidget {
  const PopularTextButton({
    super.key, required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Colors.black26),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: () {},
      child: Text(text, style: TextStyle(color: Colors.blueGrey)),
    );
  }
}