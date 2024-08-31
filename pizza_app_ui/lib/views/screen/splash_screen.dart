import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizza_app_ui/utils/image_utils.dart';
import 'package:pizza_app_ui/utils/my_routes_utils.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreenPage> {
  changePage() {
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        Navigator.of(context).pushReplacementNamed(MyRoutes.firstScreen);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    changePage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(
            child: Image(
              image: AssetImage(ImagePath.splashLogoImage),
            ),
          ),
          Image(
            image: AssetImage(ImagePath.splashBgImage),
            //fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
