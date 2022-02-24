import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/cubit/CubitAppLogics.dart';
import 'package:new_project/cubit/appcubit_cubit.dart';
import 'package:new_project/dataService.dart';

import 'package:new_project/pages/nav_pages/details_page.dart';
import 'package:new_project/pages/nav_pages/main_page.dart';
import 'package:new_project/pages/welcome_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<AppcubitCubit>(
        create: (context) => AppcubitCubit(data: DataServices()),
        child: CubitAppLOgics(),
      ),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
