import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('book now'),
        Container(
          width: 200,
          height: 60,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/button-one.png'))),
        ),
      ],
    );
  }
}
