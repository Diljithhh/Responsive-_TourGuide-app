// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/constants/appcolors.dart';
import 'package:new_project/cubit/appcubit_cubit.dart';
import 'package:new_project/widgets/ApplargeTextstyle.dart';
import 'package:new_project/widgets/CircleTabIndicator.dart';
import 'package:new_project/widgets/textwidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var imagges = {
    "balloning.png": "balloning",
    "hiking.png": "hiking",
    "kayaking.png": "kayaking",
    "snorkling.png": "snorkling"
  };

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(body: BlocBuilder<AppcubitCubit, AppcubitState>(
      builder: (context, state) {
        if (state is LoadedState) {
          var info = state.places;

          return Container(
            padding: const EdgeInsets.only(left: 20, top: 70),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.menu),
                    Expanded(child: Container()),
                    IconButton(onPressed: () {}, icon: Icon(Icons.search))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: ApplargeText(
                    text: 'Discover',
                    color: Colors.black,
                  ),
                  padding: EdgeInsets.only(left: 10),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                      indicator:
                          CircleTabIndicator(color: Colors.black26, radius: 5),
                      labelPadding: EdgeInsets.only(left: 20, right: 20),
                      isScrollable: true,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      controller: _tabController,
                      tabs: [
                        Tab(
                          text: 'item 1',
                        ),
                        Tab(text: 'item 2'),
                        Tab(
                          text: 'item 3',
                        ),
                      ]),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 200,
                    width: double.maxFinite,
                    child: TabBarView(controller: _tabController, children: [
                      ListView.builder(
                        itemCount: info.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            BlocProvider.of<AppcubitCubit>(context)
                                .detailPage(info[index]);
                          },
                          child: Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              height: 300,
                              width: 180,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'assets/images/mountain.jpeg')),
                              )),
                        ),
                      ),
                      Text('hurai'),
                      Text('ooops')
                    ])),
                SizedBox(
                  height: 20,
                ),
                Container(
                    margin: EdgeInsets.only(left: 10, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ApplargeText(
                          text: 'Explore',
                          color: Colors.black,
                          size: 22,
                        ),
                        AppText(
                          text: 'see all',
                          size: 16,
                          color: AppColors.textColor1,
                        )
                      ],
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 100,
                  width: double.maxFinite,
                  child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) => Container(
                            margin: const EdgeInsets.only(right: 20, left: 10),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                      // margin: EdgeInsets.only(right: 10),
                                      width: 60,
                                      height: 70,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage('assets/images/' +
                                                imagges.keys.elementAt(index)),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.circular(20),
                                      )),
                                  AppText(
                                    text: imagges.values.elementAt(index),
                                    size: 12,
                                    color: AppColors.textColor2,
                                  )
                                ]),
                          )),
                )
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    ));
  }
}
