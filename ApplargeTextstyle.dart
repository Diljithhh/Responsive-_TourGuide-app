import 'package:flutter/material.dart';

class ApplargeText extends StatelessWidget {
  final double size;
  final Color color;
  String text;
  ApplargeText(
      {required this.text, this.size = 30, this.color = Colors.black26});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontSize: size, color: color, fontWeight: FontWeight.bold),
    );
  }
}
