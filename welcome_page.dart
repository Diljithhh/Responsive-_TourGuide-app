// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/buttons/defaultButtons.dart';
import 'package:new_project/widgets/ApplargeTextstyle.dart';
import 'package:new_project/widgets/textwidget.dart';
import 'package:new_project/cubit/appcubit_cubit.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = ['welcompage1.jpg', 'welcomepage22.jpg', 'welcomepage3.jpg'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: images.length,
      itemBuilder: ((context, index) => Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/" + images[index]),
                  fit: BoxFit.cover),
            ),
            child: Container(
              margin: EdgeInsets.only(top: 150, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ApplargeText(text: 'TRIP'),
                      AppText(
                        text: 'flying in the sky ',
                        size: 20,
                        color: Colors.white54,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        height: 60,
                        width: 100,
                        child: AppText(
                          color: Colors.white,
                          text:
                              'scrambled it to make a type specime remaining  e a type specime re a type specime r',
                          size: 12,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<AppcubitCubit>(context).getDataa();
                        },
                        child: Container(width: 200, child: DefaultButtons()),
                      ),
                    ],
                  ),
                  Column(
                    children: List.generate(
                        3,
                        (indexdots) => Container(
                              margin: EdgeInsets.only(bottom: 2),
                              height: index == indexdots ? 25 : 8,
                              width: 8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: index == indexdots
                                      ? Colors.white
                                      : Colors.white60),
                            )),
                  )
                ],
              ),
            ),
          )),
    ));
  }
}
