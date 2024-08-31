import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../utils/color_utils.dart';
import '../../utils/image_utils.dart';
import '../../utils/my_routes_utils.dart';

class CustomPaymentBottomSheet extends StatelessWidget {
  final void Function()? onPressed;
  const CustomPaymentBottomSheet({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              height: 6,
              width: 70,
              color: AppColor.whiteColorBottom,
            ),
            const Gap(16),
            GestureDetector(
              onTap: () {
                //  Navigator.of(context).pushReplacementNamed(MyRoutes.paymentCardScreen);
              },
              child: Container(
                height: 56,
                // padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  border: Border.all(
                    color: AppColor.bottomColorBorder,
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    const Gap(20),
                    Image(
                      image: AssetImage(ImagePath.appleImage),
                    ),
                    const Gap(20),
                    const Text(
                      "Apple Pay",
                      style: TextStyle(
                        color: AppColor.bottomColorTitle,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Gap(180),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward_ios_rounded),
                      iconSize: 20,
                      color: AppColor.bottomColorTitle,
                    ),
                  ],
                ),
              ),
            ),
            const Gap(16),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 56,
                // padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  border: Border.all(
                    color: AppColor.bottomColorBorder,
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    const Gap(20),
                    Image(
                      image: AssetImage(ImagePath.creditCardImage),
                    ),
                    const Gap(20),
                    const Text(
                      "Credit or Debit Card",
                      style: TextStyle(
                        color: AppColor.bottomColorTitle,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Gap(115),
                    IconButton(
                      onPressed: onPressed,
                      icon: const Icon(Icons.arrow_forward_ios_rounded),
                      iconSize: 20,
                      color: AppColor.bottomColorTitle,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
