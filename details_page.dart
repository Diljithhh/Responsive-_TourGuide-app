// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/buttons/bottomButton.dart';
import 'package:new_project/buttons/defaultButtons.dart';
import 'package:new_project/buttons/squareButton.dart';
import 'package:new_project/constants/appcolors.dart';
import 'package:new_project/cubit/appcubit_cubit.dart';
import 'package:new_project/widgets/ApplargeTextstyle.dart';
import 'package:new_project/widgets/textwidget.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int isselected = -1;
  int starvalue = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(children: [
          Positioned(
              child: Container(
            width: double.maxFinite,
            height: 360,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/mountain.jpeg',
                    ),
                    fit: BoxFit.cover)),
          )),
          Positioned(
              top: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      BlocProvider.of<AppcubitCubit>(context).goHome();
                    },
                    icon: Icon(Icons.menu),
                    color: Colors.white,
                  ),
                ],
              )),
          Positioned(
              top: 260,
              child: Container(
                padding: EdgeInsets.only(left: 10, top: 20, right: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                height: 430,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ApplargeText(
                          text: 'Yesomi',
                          color: Colors.black.withOpacity(0.8),
                        ),
                        AppText(
                          text: '250',
                          size: 20,
                          color: AppColors.mainColor,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.location_on),
                        SizedBox(
                          width: 5,
                        ),
                        AppText(
                            text: 'USA, California',
                            color: AppColors.mainColor,
                            size: 15)
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          children: List.generate(
                              5,
                              (index) => Icon(Icons.star,
                                  color: index < starvalue
                                      ? AppColors.starColor
                                      : AppColors.textColor2)),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        AppText(
                          text: '4.0',
                          size: 12,
                          color: AppColors.mainColor,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ApplargeText(
                      text: 'people',
                      color: Colors.black.withOpacity(0.8),
                      size: 25,
                    ),
                    AppText(
                      text: 'Number of people in your group',
                      size: 15,
                      color: Colors.black26,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Wrap(
                        children: List.generate(
                            5,
                            (index) => InkWell(
                                  onTap: () {
                                    setState(() {
                                      isselected = index;
                                    });
                                  },
                                  child: SquareButton(
                                    size: 45,
                                    isIcon: false,
                                    iconn: Icons.search,
                                    text: (index + 1).toString(),
                                    textcolor: isselected == index
                                        ? Colors.white
                                        : Colors.orange,
                                    backgroundColor: isselected == index
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ))),
                    SizedBox(
                      height: 15,
                    ),
                    ApplargeText(
                      text: 'Description',
                      color: Colors.black,
                      size: 25,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AppText(
                      text:
                          'Yesomi, the famed hill station of south India, is a romantic locale where natural beauty is everywhere to visit, explore and to enjoy.',
                      size: 12,
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 5),
                          child: Center(
                              child: Icon(Icons.favorite_border_outlined)),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueAccent),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        DefaultButtons(
                          text: 'Book now',
                          width: 200,
                          isLarge: true,
                        )
                      ],
                    )
                  ],
                ),
              ))
        ]),
      ),
    );
  }
}
