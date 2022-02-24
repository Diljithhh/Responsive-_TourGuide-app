import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/cubit/appcubit_cubit.dart';
import 'package:new_project/pages/nav_pages/Home_Page.dart';
import 'package:new_project/pages/nav_pages/details_page.dart';
import 'package:new_project/pages/nav_pages/main_page.dart';
import 'package:new_project/pages/welcome_page.dart';

class CubitAppLOgics extends StatefulWidget {
  @override
  _CubitAppLOgicsState createState() => _CubitAppLOgicsState();
}

class _CubitAppLOgicsState extends State<CubitAppLOgics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          BlocBuilder<AppcubitCubit, AppcubitState>(builder: (context, state) {
        if (state is WelcomeState) {
          return WelcomePage();
        }
        if (state is LoadedState) {
          return MainPage();
        }
        if (state is DetailsState) {
          return DetailsPage();
        }
        if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
