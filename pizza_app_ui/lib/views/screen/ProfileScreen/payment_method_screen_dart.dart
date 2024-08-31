import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:pizza_app_ui/utils/color_utils.dart';
import 'package:pizza_app_ui/utils/image_utils.dart';
import 'package:pizza_app_ui/utils/my_routes_utils.dart';

import '../../widget/custom_payment_bottom.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  bool isVisible = false;

  String nameValue = "";

  int? newName;

  @override
  Widget build(BuildContext context) {
    dynamic data = ModalRoute.of(context)!.settings.arguments;

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
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18),
          child: SingleChildScrollView(
            child: Column(
              children: [
                (newName == null)
                    ? Column(
                        children: [
                          const Gap(130),
                          Center(
                            child: Image(
                              image: AssetImage(ImagePath.cardBgImage),
                            ),
                          ),
                          const Gap(32),
                          //Text(newName.toString()),
                          const Text(
                            "No Saved Cards Found",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff222226),
                            ),
                          ),
                          const Gap(10),
                          const Text(
                            "Add a card to speed up your payment process.",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff8B8B91),
                            ),
                          ),
                          const Gap(180),
                        ],
                      )
                    : Column(
                        children: [
                          Container(
                            height: 80,
                            width: 370,
                            // alignment: Alignment.centerRight,
                            decoration: const BoxDecoration(
                              color: AppColor.whiteColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ListTile(
                                  leading: Image(
                                    image: AssetImage(ImagePath.masterCard),
                                  ),
                                  title: const Text(
                                    "Master Card",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: AppColor.bottomColorTitle,
                                    ),
                                  ),
                                  subtitle: Text(
                                    newName.toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: AppColor.textDisable,
                                    ),
                                  ),
                                  trailing: IconButton(
                                    onPressed: () {},
                                    icon: Image(
                                      image: AssetImage(ImagePath.delete),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                (newName == null) ? const Gap(10) : const Gap(500),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return CustomPaymentBottomSheet(
                            onPressed: () async {
                              data = await Navigator.of(context).pushReplacementNamed(MyRoutes.paymentCardScreen);

                              newName = data;
                              print(newName);
                            },
                          );
                        });
                  },
                  child: Container(
                    height: 52,
                    width: 350,
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
          ),
        ),
      ),
    );
  }
}
