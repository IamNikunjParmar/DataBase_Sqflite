import 'package:bloc_demo_company/DetailsPage/details_Page_view.dart';
import 'package:bloc_demo_company/homePage/home_page_view.dart';
import 'package:bloc_demo_company/utils/my_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: myRoutes,
      initialRoute: DetailsPageView.routeName,
    );
  }
}
