

import 'package:flutter/material.dart';

void showCustomSnakbarMessage(BuildContext context, String message, [bool isError = false]) {
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: isError ? Colors.red: Colors.green,
        content: Text(message),
      ),
  );
}