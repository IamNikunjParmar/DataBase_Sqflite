import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../utils/color_utils.dart';

class CustomContainerBasket extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;
  const CustomContainerBasket({
    super.key,
    required this.imagePath,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 151,
      width: 155,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            color: Colors.grey,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          Image(
            height: 72,
            width: 131,
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
          const Gap(8),
          Container(
            height: 48,
            width: 131,
            decoration: const BoxDecoration(
                //color: Colors.yellow,
                ),
            child: Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    // color: AppColor.dotIndicator,
                  ),
                ),
                const Gap(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColor.dotIndicator,
                        // color: AppColor.dotIndicator,
                      ),
                    ),
                    const Icon(
                      Icons.add_circle_outline_rounded,
                      color: AppColor.dotIndicator,
                      size: 24,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
