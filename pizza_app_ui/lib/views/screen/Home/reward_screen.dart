import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pizza_app_ui/utils/color_utils.dart';
import 'package:pizza_app_ui/utils/image_utils.dart';

import '../../../utils/my_routes_utils.dart';

class RewardScreen extends StatelessWidget {
  const RewardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColorScreen,
      appBar: AppBar(
        backgroundColor: AppColor.bgColorScreen,
        title: const Text(
          "RewardScreen",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xff0A0D14),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(MyRoutes.homeScreen);
          },
          icon: const Icon(Icons.arrow_back_outlined),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Container(
              height: 161,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImagePath.splashBgImage),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      height: 129,
                      width: 287,
                      decoration: const BoxDecoration(),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage(ImagePath.reImage),
                          ),
                          Gap(5),
                          const Text(
                            "Your Point: 0",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColor.bottomColorTitle,
                            ),
                          ),
                          //Gap(5),
                          const Text(
                            "Only 100 points away from a free pizza!",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColor.textDisable,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(62),
            Container(
              height: 227,
              width: 255,
              decoration: const BoxDecoration(
                  //color: Colors.amber,
                  ),
              child: Column(
                //alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(ImagePath.dataImage),
                      ),
                    ),
                  ),
                  const Gap(30),
                  const Text(
                    "You Haven’t Earned Any Points Yet",
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColor.bottomColorTitle,
                    ),
                  ),
                  const Gap(10),
                  const Text(
                    "Place an order to earn points and enjoy \n                     delicious rewards!",
                    //maxLines: 1,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColor.textDisable,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(78),
            Container(
              height: 52,
              // width: 350,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: AppColor.dotIndicator,
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              child: const Text(
                "Order Now and Earn Points",
                style: TextStyle(
                  color: Color(0xffFFFFFF),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
