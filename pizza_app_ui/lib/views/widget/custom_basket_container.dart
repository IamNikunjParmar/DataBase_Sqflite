import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../utils/color_utils.dart';
import '../../utils/image_utils.dart';

class CustomBasketContainer extends StatefulWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String price;
  final String endTitle;

  const CustomBasketContainer({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.endTitle,
  });

  @override
  State<CustomBasketContainer> createState() => _CustomBasketContainerState();
}

class _CustomBasketContainerState extends State<CustomBasketContainer> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 121,
      padding: const EdgeInsets.all(16),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                  image: DecorationImage(
                    image: AssetImage(widget.imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 50,
                width: 50,
              ),
              Container(
                height: 89,
                width: 259,
                decoration: const BoxDecoration(
                    //color: Colors.red,
                    ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              widget.subtitle,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColor.textDisable,
                              ),
                            ),
                            Text(
                              widget.endTitle,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColor.textDisable,
                              ),
                            ),
                            const Gap(10),
                            Row(
                              children: [
                                Image(
                                  color: AppColor.dotIndicator,
                                  height: 16,
                                  width: 16,
                                  image: AssetImage(ImagePath.editImage),
                                ),
                                const Gap(5),
                                const Text(
                                  "Edit Item",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.dotIndicator,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              widget.price,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColor.dotIndicator,
                              ),
                            ),
                            const Gap(20),
                            Container(
                              height: 34,
                              width: 75,
                              decoration: BoxDecoration(
                                // color: Colors.amber,
                                border: Border.all(
                                  color: AppColor.textDisable,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Icon(
                                    Icons.delete,
                                    size: 18,
                                    color: AppColor.dotIndicator,
                                  ),
                                  Text(count.toString()),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        count++;
                                      });
                                    },
                                    child: const Icon(
                                      Icons.add,
                                      size: 18,
                                      color: AppColor.dotIndicator,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
