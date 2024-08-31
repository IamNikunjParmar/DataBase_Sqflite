import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pizza_app_ui/modal/catgory_data_modal.dart';
import 'package:pizza_app_ui/utils/my_routes_utils.dart';
import 'package:pizza_app_ui/views/widget/custom_bottom_sheet.dart';

import '../../../../utils/color_utils.dart';
import '../../../../utils/image_utils.dart';
import '../../widget/custom_basket_container.dart';
import '../../widget/custom_container_basket.dart';

class FinalPaymentScreen extends StatefulWidget {
  const FinalPaymentScreen({super.key});

  @override
  State<FinalPaymentScreen> createState() => _FinalPaymentScreenState();
}

class _FinalPaymentScreenState extends State<FinalPaymentScreen> {
  bool isExpanded = false;
  bool _isVisible = true;
  int selected = 0;
  int masterCardSelected = 0;

  setSelectedRadio(int val) {
    setState(() {
      selected = val;
    });
  }

  setMasterCardRadio(int val) {
    setState(() {
      masterCardSelected = val;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selected = 0;
    masterCardSelected = 0;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColor.bgColorScreen,
        appBar: AppBar(
          backgroundColor: AppColor.bgColorScreen,
          title: const Text(
            "Payment",
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
              value: 0.65,
              minHeight: 6,
              valueColor: AlwaysStoppedAnimation(AppColor.dotIndicator),
            ),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Shipping Method",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: AppColor.bottomColorTitle,
                      ),
                    ),
                    const Gap(8),
                    Container(
                      height: 100,
                      width: 360,
                      decoration: const BoxDecoration(
                        color: AppColor.whiteColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Transform.scale(
                                scale: 1.2,
                                child: Radio(
                                  value: 1,
                                  groupValue: selected,
                                  onChanged: (val) {
                                    setSelectedRadio(val!);
                                  },
                                  activeColor: AppColor.dotIndicator,
                                ),
                              ),
                              const Text(
                                "Let the courier bring it",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: AppColor.bottomColorTitle,
                                ),
                              ),
                              const Gap(20),
                              const Text(
                                "Delivery time: 45min.",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: AppColor.bottomColorTitle,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Transform.scale(
                                scale: 1.2,
                                child: Radio(
                                  value: 2,
                                  groupValue: selected,
                                  onChanged: (val) {
                                    setSelectedRadio(val!);
                                  },
                                  activeColor: AppColor.dotIndicator,
                                ),
                              ),
                              const Text(
                                "I will buy it myself",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: AppColor.bottomColorTitle,
                                ),
                              ),
                              const Gap(20),
                              const Text(
                                "Prepared Time: 25 min.",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: AppColor.bottomColorTitle,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Shipping Address",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: AppColor.bottomColorTitle,
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          iconAlignment: IconAlignment.end,
                          label: const Text(
                            "Edit Address",
                            style: TextStyle(
                              color: AppColor.dotIndicator,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          icon: Image.asset(
                            ImagePath.editImage,
                            height: 16,
                            width: 16,
                            color: AppColor.dotIndicator,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 100,
                      width: 360,
                      decoration: const BoxDecoration(
                        color: AppColor.whiteColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(14),
                            child: Row(
                              children: [
                                Container(
                                  height: 32,
                                  width: 32,
                                  child: Image(
                                    image: AssetImage(ImagePath.shippingHomeImage),
                                    color: AppColor.dotIndicator,
                                  ),
                                ),
                                const Gap(10),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '3891 Ranchview Dr. Richardson',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: AppColor.dotIndicator,
                                      ),
                                    ),
                                    Gap(2),
                                    Text(
                                      '3891 Ranchview Dr. Richardson',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: AppColor.textDisable,
                                      ),
                                    ),
                                    Gap(2),
                                    Text(
                                      ' California 62639',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: AppColor.textDisable,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(10),
                    const Text(
                      "Coupon Code",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: AppColor.bottomColorTitle,
                      ),
                    ),
                    Container(
                      height: 56,
                      width: 360,
                      color: AppColor.whiteColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage(ImagePath.couponImage),
                          ),
                          const Gap(10),
                          const Text(
                            "Have a discount code?",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: AppColor.bottomColorTitle,
                            ),
                          ),
                          const Gap(69),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return const CustomCouponBottemSheet();
                                  });
                            },
                            child: const Text(
                              "Enter Code",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: AppColor.dotIndicator,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(10),
                    const Text(
                      "Payment Method",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: AppColor.bottomColorTitle,
                      ),
                    ),
                    Container(
                      height: 75,
                      width: 360,
                      color: AppColor.whiteColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image(
                            image: AssetImage(ImagePath.masterCard),
                          ),
                          // const Gap(10),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Master Card",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: AppColor.bottomColorTitle,
                                ),
                              ),
                              Text(
                                "**** **** 1256",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: AppColor.textDisable,
                                ),
                              ),
                            ],
                          ),
                          const Gap(88),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      height: 380,
                                      width: 400,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(20),
                                        ),
                                        color: AppColor.whiteColor,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const Gap(10),
                                            Center(
                                              child: Container(
                                                height: 6,
                                                width: 60,
                                                color: AppColor.whiteColorBottom,
                                              ),
                                            ),
                                            const Gap(10),
                                            Container(
                                              height: 71,
                                              width: 380,
                                              decoration: BoxDecoration(
                                                borderRadius: const BorderRadius.all(Radius.circular(8)),
                                                border: Border.all(
                                                  color: AppColor.borderContainerColor,
                                                ),
                                              ),
                                              padding: const EdgeInsets.all(12),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Image(
                                                    image: AssetImage(ImagePath.appleImage),
                                                  ),
                                                  const Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "Apple Pay",
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 14,
                                                          color: AppColor.bottomColorTitle,
                                                        ),
                                                      ),
                                                      Text(
                                                        "johndoe@hotmail.com",
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 14,
                                                          color: AppColor.bottomColorTitle,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const Gap(50),
                                                  Transform.scale(
                                                      scale: 1.5,
                                                      child: Radio(
                                                          activeColor: AppColor.dotIndicator,
                                                          value: 1,
                                                          groupValue: masterCardSelected,
                                                          onChanged: (val) {
                                                            setMasterCardRadio(val!);
                                                          })),
                                                ],
                                              ),
                                            ),
                                            const Gap(12),
                                            Container(
                                              height: 71,
                                              width: 380,
                                              decoration: BoxDecoration(
                                                borderRadius: const BorderRadius.all(Radius.circular(8)),
                                                border: Border.all(
                                                  color: AppColor.borderContainerColor,
                                                ),
                                              ),
                                              padding: const EdgeInsets.all(12),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Image(
                                                    image: AssetImage(ImagePath.masterCard),
                                                  ),
                                                  const Gap(15),
                                                  const Column(
                                                    children: [
                                                      Text(
                                                        "Master Card",
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 14,
                                                          color: AppColor.bottomColorTitle,
                                                        ),
                                                      ),
                                                      Text(
                                                        "**** **** 1256",
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.w400,
                                                          fontSize: 12,
                                                          color: AppColor.textDisable,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const Gap(135),
                                                  Transform.scale(
                                                      scale: 1.5,
                                                      child: Radio(
                                                          activeColor: AppColor.dotIndicator,
                                                          value: 2,
                                                          groupValue: masterCardSelected,
                                                          onChanged: (val) {
                                                            setMasterCardRadio(val!);
                                                          })),
                                                ],
                                              ),
                                            ),
                                            const Gap(12),
                                            Container(
                                              height: 71,
                                              width: 380,
                                              decoration: BoxDecoration(
                                                borderRadius: const BorderRadius.all(Radius.circular(8)),
                                                border: Border.all(
                                                  color: AppColor.borderContainerColor,
                                                ),
                                              ),
                                              padding: const EdgeInsets.all(12),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  const Gap(18),
                                                  Image(
                                                    image: AssetImage(ImagePath.rewardImage),
                                                    color: AppColor.dotIndicator,
                                                  ),
                                                  const Gap(15),
                                                  const Text(
                                                    "Your Point: 0",
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 14,
                                                      color: AppColor.bottomColorTitle,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const Gap(12),
                                            Container(
                                              height: 71,
                                              width: 380,
                                              decoration: BoxDecoration(
                                                borderRadius: const BorderRadius.all(Radius.circular(8)),
                                                border: Border.all(
                                                  color: AppColor.borderContainerColor,
                                                ),
                                              ),
                                              padding: const EdgeInsets.all(12),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  const Gap(28),
                                                  Transform.scale(
                                                    scale: 1.5,
                                                    child: Image(
                                                      image: AssetImage(ImagePath.addImage),
                                                      color: AppColor.dotIndicator,
                                                    ),
                                                  ),
                                                  const Gap(15),
                                                  const Text(
                                                    "Add New Payment Method",
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 14,
                                                      color: AppColor.bottomColorTitle,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                            child: const Text(
                              "Change",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: AppColor.dotIndicator,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      height: 380,
                                      width: 400,
                                      decoration: const BoxDecoration(
                                        color: AppColor.whiteColor,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                      ),
                                      child: CustomBottomSheet(
                                        container: Container(),
                                        imagePath: ImagePath.likeImage,
                                        title: "Order Succesfully",
                                        subtext:
                                            "Happy! Your food will be made immediately and we \n will send it after it's finished by the courier, please \n                                wait a moment.",
                                        buttonTitle: "Order Tracking",
                                        onPressed: () {
                                          Navigator.of(context).pushReplacementNamed(MyRoutes.orderTrackingScreen);
                                        },
                                      ),
                                    );
                                  });
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

class CustomCouponBottemSheet extends StatelessWidget {
  const CustomCouponBottemSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: 250,
        width: 400,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
          color: AppColor.whiteColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(10),
            Center(
              child: Container(
                height: 6,
                width: 60,
                color: AppColor.whiteColorBottom,
              ),
            ),
            const Gap(10),
            const Padding(
              padding: EdgeInsets.only(
                left: 16,
                top: 8,
              ),
              child: Text(
                "Enter your coupon code",
                style: TextStyle(
                  fontSize: 16,
                  color: AppColor.bottomColorTitle,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Gap(8),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: Image(
                    image: AssetImage(ImagePath.couponImage),
                  ),
                  labelText: "Coupon Code",
                  labelStyle: const TextStyle(color: AppColor.dotIndicator),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    borderSide: BorderSide(
                      color: AppColor.textDisable,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    borderSide: BorderSide(
                      color: AppColor.dotIndicator,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
