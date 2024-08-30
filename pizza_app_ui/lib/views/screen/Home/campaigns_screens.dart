import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pizza_app_ui/utils/image_utils.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/my_routes_utils.dart';

class CampaignsScreen extends StatelessWidget {
  const CampaignsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColorScreen,
      appBar: AppBar(
        backgroundColor: AppColor.bgColorScreen,
        title: const Text(
          "CampaignsScreens",
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 292,
                width: 320,
                decoration: const BoxDecoration(
                    // color: Colors.red,
                    ),
                child: Column(
                  children: [
                    Container(
                      height: 180,
                      width: 180,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            ImagePath.emptyImage,
                          ),
                        ),
                      ),
                    ),
                    const Gap(30),
                    const Text(
                      "No Campaigns Available",
                      //maxLines: 1,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColor.bottomColorTitle,
                      ),
                    ),
                    const Gap(8),
                    const Text(
                      "You can check for new promotions here. There are \n             no active promotions at the moment.",
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
            )
          ],
        ),
      ),
    );
  }
}
