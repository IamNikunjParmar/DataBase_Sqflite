import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pizza_app_ui/modal/catgory_data_modal.dart';
import 'package:pizza_app_ui/utils/my_routes_utils.dart';

import '../../../../utils/color_utils.dart';
import '../../../../utils/image_utils.dart';
import '../../widget/custom_basket_container.dart';
import '../../widget/custom_container_basket.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  bool isExpanded = false;
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    final List<CategoryData> basketItem = ModalRoute.of(context)!.settings.arguments as List<CategoryData>;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColor.bgColorScreen,
        appBar: AppBar(
          backgroundColor: AppColor.bgColorScreen,
          title: const Text(
            "My Basket",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xff0A0D14),
            ),
          ),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(0.4),
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey,
              color: Colors.red,
              value: 0.39,
              minHeight: 6,
              valueColor: AlwaysStoppedAnimation(AppColor.dotIndicator),
            ),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16,
                      bottom: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 435,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Products(3)",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextButton.icon(
                                    onPressed: () {},
                                    label: const Row(
                                      children: [
                                        Icon(
                                          Icons.add,
                                          color: AppColor.dotIndicator,
                                        ),
                                        Text(
                                          "Add product to basket",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: AppColor.dotIndicator,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: ListView.builder(
                                    itemCount: basketItem.length,
                                    itemBuilder: (ctx, index) {
                                      final myItem = basketItem[index];

                                      return CustomBasketContainer(
                                        imagePath: myItem.image,
                                        title: myItem.title,
                                        subtitle: "Thin Crust",
                                        endTitle: "Extra Mushrooms",
                                        price: '£${myItem.price.toString()}',
                                      );
                                    }),
                              )

                              // CustomBasketContainer(
                              //   imagePath: ImagePath.pizzasImage4,
                              //   title: "Diavola Pizza",
                              //   subtitle: "Thin Crust",
                              //   endTitle: "Extra Mushrooms",
                              //   price: '£9.99',
                              // ),
                              // const Gap(10),
                              // CustomBasketContainer(
                              //   imagePath: ImagePath.pizzasImage3,
                              //   title: "Pepperoni Breadsticks",
                              //   subtitle: "8 Units",
                              //   endTitle: "Additional Sauce",
                              //   price: '£2.99',
                              // ),
                              // const Gap(10),
                              // CustomBasketContainer(
                              //   imagePath: ImagePath.cokeImage,
                              //   title: "Coca Cola 350ml.",
                              //   subtitle: "Thin Crust",
                              //   endTitle: "Extra Mushrooms",
                              //   price: '£9.99',
                              // ),
                            ],
                          ),
                        ),
                        const Gap(16),
                        const Text(
                          "It Goes Well With",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Gap(12),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              CustomContainerBasket(
                                imagePath: ImagePath.breadImage,
                                title: ' Pepperoni Breadsticks',
                                price: "£3.99",
                              ),
                              const Gap(10),
                              CustomContainerBasket(
                                imagePath: ImagePath.cokeImage,
                                title: 'Coca Cola 350ml.',
                                price: "£2.99",
                              ),
                              const Gap(10),
                              CustomContainerBasket(
                                imagePath: ImagePath.breadImage,
                                title: ' Pepperoni Breadsticks',
                                price: "£3.99",
                              ),
                              const Gap(10),
                              CustomContainerBasket(
                                imagePath: ImagePath.cokeImage,
                                title: 'Coca Cola 350ml.',
                                price: "£2.99",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.1,
              minChildSize: 0.1,
              maxChildSize: 0.5,
              builder: (context, scrollController) {
                return Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10.0,
                        spreadRadius: 5.0,
                      ),
                    ],
                  ),
                  child: ListView(
                    controller: scrollController,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 15,
                          left: 23,
                          right: 23,
                          bottom: 25,
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 211,
                              width: 350,
                              // color: Colors.red,
                              child: Column(
                                children: [
                                  IconButton(
                                    iconSize: 24,
                                    onPressed: () {
                                      setState(() {
                                        _isVisible = !_isVisible;
                                      });
                                    },
                                    icon: Icon(
                                      _isVisible
                                          ? Icons.keyboard_arrow_down_outlined
                                          : Icons.keyboard_arrow_up_outlined,
                                    ),
                                  ),
                                  Visibility(
                                    visible: _isVisible,
                                    child: Container(
                                      height: 163,
                                      width: 350,
                                      //color: Colors.amber,
                                      child: const Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Total",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18,
                                              color: AppColor.bottomColorTitle,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Products",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                  color: AppColor.bottomColorTitle,
                                                ),
                                              ),
                                              Text(
                                                "£9.99",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16,
                                                  color: AppColor.dotIndicator,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Gap(5),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Delivery Fee",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                  color: AppColor.bottomColorTitle,
                                                ),
                                              ),
                                              Text(
                                                "£3.00",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16,
                                                  color: AppColor.dotIndicator,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Gap(5),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Coupon",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                  color: AppColor.bottomColorTitle,
                                                ),
                                              ),
                                              Text(
                                                "Apply",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16,
                                                  color: AppColor.bottomColorTitle,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Gap(5),
                                          Divider(
                                            color: Color(0xffD9D9D9),
                                          ),
                                          const Gap(5),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Total",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  color: AppColor.bottomColorTitle,
                                                ),
                                              ),
                                              Text(
                                                "£9.99",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16,
                                                  color: AppColor.dotIndicator,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 48,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(AppColor.dotIndicator),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed(MyRoutes.finalPaymentScreen);
                            },
                            child: const Text(
                              "Confirm Basket",
                              style: TextStyle(
                                color: AppColor.whiteColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
