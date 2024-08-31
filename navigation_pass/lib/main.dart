import 'package:flutter/material.dart';
import 'package:navigation_pass/utils/my_routes_utils.dart';
import 'package:navigation_pass/views/screens/four_page.dart';
import 'package:navigation_pass/views/screens/home_page.dart';
import 'package:navigation_pass/views/screens/second_page.dart';
import 'package:navigation_pass/views/screens/third_page.dart';

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
      initialRoute: MyRoutes.home,
      routes: {
        MyRoutes.home: (context) => const HomePage(),
        MyRoutes.secondPage: (context) => const SecondPage(),
        MyRoutes.thirdPage: (context) => const ThirdPage(),
        MyRoutes.fourPage: (context) => const FourPage(),
      },
    );
  }
}
