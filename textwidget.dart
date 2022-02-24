import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final double size;
  final Color color;
  String text;
  AppText(
      {this.color = Colors.white30, required this.text, required this.size});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: size, color: color),
    );
  }
}
