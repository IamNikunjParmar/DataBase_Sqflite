import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:pizza_app_ui/utils/color_utils.dart';
import 'package:pizza_app_ui/utils/my_routes_utils.dart';

// Add an alias to the carousel_slider's CarouselController
import 'package:carousel_slider/carousel_controller.dart' as slider_controller;

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final allImages = [
    Image.asset(
      'assets/images/1.png',
    ),
    Image.asset(
      'assets/images/2.png',
    ),
    Image.asset(
      'assets/images/1.png',
    ),
    Image.asset(
      'assets/images/2.png',
    ),
    Image.asset(
      'assets/images/2.png',
    ),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                child: Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: CarouselSlider(
                    items: allImages,
                    options: CarouselOptions(
                      autoPlay: true,
                      height: h * 0.42,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Center(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "Easy Ordering",
                          style: TextStyle(
                            fontSize: 26,
                            color: AppColor.titleText,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          "Reach your favorite pizza in just a few taps.",
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColor.textDisable,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        DotsIndicator(
                          dotsCount: allImages.length,
                          position: currentIndex.toInt(),
                          decorator: DotsDecorator(
                            activeColor: AppColor.dotIndicator,
                            size: const Size.square(6.0),
                            activeSize: const Size(35.0, 6.0),
                            activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: h * 0.14,
                        ),
                        SizedBox(
                          width: h * 0.43,
                          height: 48,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(AppColor.dotIndicator),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed(MyRoutes.singInScreen);
                            },
                            child: const Text(
                              "Create Account",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        SizedBox(
                          width: h * 0.43,
                          height: 48,
                          child: OutlinedButton(
                            style: ButtonStyle(
                              side: MaterialStateProperty.all(
                                const BorderSide(color: AppColor.dotIndicator),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed(MyRoutes.loginScreen);
                            },
                            child: const Text(
                              "Log in",
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColor.dotIndicator,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
