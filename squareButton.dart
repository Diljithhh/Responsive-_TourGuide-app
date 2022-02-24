import 'package:flutter/material.dart';
import 'package:new_project/constants/appcolors.dart';

class SquareButton extends StatelessWidget {
  final String? text;
  final Color? textcolor;
  final Color backgroundColor;
  bool isIcon;
  final IconData? iconn;

  double size;

  SquareButton({
    this.text,
    required this.size,
    this.textcolor,
    required this.backgroundColor,
    this.isIcon = false,
    this.iconn,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        width: size,
        height: size,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: backgroundColor,
            border: Border.all(color: AppColors.mainColor, width: 1.0)),
        child: isIcon == false
            ? Center(
                child: Text(
                text.toString(),
                style: TextStyle(
                    color: isIcon == false ? textcolor : Colors.white),
              ))
            : Icon(iconn));
  }
}
