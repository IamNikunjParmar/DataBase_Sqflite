import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:pizza_app_ui/utils/color_utils.dart';
import 'package:pizza_app_ui/utils/image_utils.dart';
import 'package:pizza_app_ui/views/widget/custom_bottom_sheet.dart';

import '../../../utils/my_routes_utils.dart';

class PaymentCardScreen extends StatefulWidget {
  const PaymentCardScreen({super.key});

  @override
  State<PaymentCardScreen> createState() => _PaymentCardScreenState();
}

class _PaymentCardScreenState extends State<PaymentCardScreen> {
  bool isVisible = false;

  int? numberValue;
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
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
            "Payment Methods",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xff0A0D14),
            ),
          ),
          // leading: IconButton(
          //   onPressed: () {
          //     Navigator.of(context).pushReplacementNamed(MyRoutes.paymentMethodScreen);
          //     ;
          //   },
          //   icon: const Icon(Icons.arrow_back_outlined),
          // ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(18),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Card Information",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff0A0D14),
                      ),
                    ),
                    const Gap(10),
                    TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        hintText: "Full Name",
                        hintStyle: const TextStyle(
                          color: AppColor.textDisable,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 18),
                          child: Image(
                            color: AppColor.textDisable,
                            alignment: AlignmentDirectional.centerEnd,
                            image: AssetImage(ImagePath.contactImage),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xffE2E4E9),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: AppColor.dotIndicator,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.red),
                        ),
                        fillColor: const Color(0xffFFFFFF),
                        filled: true,
                      ),
                    ),
                    const Gap(16),
                    TextFormField(
                      onChanged: (val) {
                        numberValue = int.parse(val);
                        print("$numberValue====================================");
                      },
                      controller: numberController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Card Number",
                        hintStyle: const TextStyle(
                          color: AppColor.textDisable,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 18),
                          child: Image(
                            color: AppColor.textDisable,
                            alignment: AlignmentDirectional.centerEnd,
                            image: AssetImage(ImagePath.creditCardImage),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xffE2E4E9),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: AppColor.dotIndicator,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.red),
                        ),
                        fillColor: const Color(0xffFFFFFF),
                        filled: true,
                      ),
                    ),
                    const Gap(16),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.datetime,
                            decoration: InputDecoration(
                              hintText: "YY/MM",
                              hintStyle: const TextStyle(
                                color: AppColor.textDisable,
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(right: 18),
                                child: Image(
                                  color: AppColor.textDisable,
                                  alignment: AlignmentDirectional.centerEnd,
                                  image: AssetImage(ImagePath.calendarImage),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  color: Color(0xffE2E4E9),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  color: AppColor.dotIndicator,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: Colors.red),
                              ),
                              fillColor: const Color(0xffFFFFFF),
                              filled: true,
                            ),
                          ),
                        ),
                        const Gap(16),
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "CVV",
                              hintStyle: const TextStyle(
                                color: AppColor.textDisable,
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(right: 18),
                                child: Image(
                                  color: AppColor.textDisable,
                                  alignment: AlignmentDirectional.centerEnd,
                                  image: AssetImage(ImagePath.calendarImage),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  color: Color(0xffE2E4E9),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  color: AppColor.dotIndicator,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: Colors.red),
                              ),
                              fillColor: const Color(0xffFFFFFF),
                              filled: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Gap(355),
                    GestureDetector(
                      onTap: () {
                        var data = numberValue;
                        (numberValue == null)
                            ? const Text("please filed fill now ")
                            : showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    height: 358,
                                    width: 400,
                                    decoration: const BoxDecoration(
                                      color: Color(0xffFFFFFF),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                    ),
                                    child: CustomBottomSheet(
                                      title: "Your card has been successfully \n                    registered!",
                                      onPressed: () {
                                        setState(() {
                                          var data = numberValue;
                                          Navigator.of(context).pop(data);
                                        });
                                      },
                                      imagePath: ImagePath.trueImage,
                                      buttonTitle: "Continue Payment Page",
                                      subtext:
                                          "You can complete your payment with \n                     your new card.",
                                      container: Container(),
                                    ),
                                  );
                                }).then(
                                (value) {
                                  Navigator.of(context).pop(data);
                                },
                              );
                      },
                      child: Container(
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
                          "Add New Payment Method",
                          style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
