import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/color_utils.dart';

class CustomTrackingProduct extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subTitle;
  final String endTitle;
  final String price;

  const CustomTrackingProduct({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subTitle,
    required this.endTitle,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 380,
      decoration: const BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: ListTile(
        leading: Column(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                ),
              ),
            ),
          ],
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              subTitle,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColor.textDisable,
              ),
            ),
            Text(
              endTitle,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColor.textDisable,
              ),
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              price,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColor.dotIndicator,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
