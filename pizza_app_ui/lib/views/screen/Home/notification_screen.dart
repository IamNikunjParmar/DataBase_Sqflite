import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../utils/color_utils.dart';
import '../../../../utils/image_utils.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xffFAFAFA),
        appBar: AppBar(
          backgroundColor: AppColor.bgColorScreen,
          title: const Text(
            "Notifications",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xff0A0D14),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Image.asset(ImagePath.notificationDeleteImage),
            ),
          ],
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 292,
                width: 360,
                decoration: const BoxDecoration(
                    //color: Colors.red,
                    ),
                child: Column(
                  children: [
                    Container(
                      height: 180,
                      width: 180,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(ImagePath.notificationScreenImage),
                        ),
                      ),
                    ),
                    const Gap(30),
                    const Text(
                      "No Notifications",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColor.bottomColorTitle,
                      ),
                    ),
                    const Gap(10),
                    const Text(
                      "You will see new notifications here. There are no \n                            notifications yet.",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColor.textDisable,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
