import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:pizza_app_ui/utils/image_utils.dart';
import 'package:pizza_app_ui/utils/my_routes_utils.dart';
import 'package:pizza_app_ui/views/widget/custom_bottom_sheet.dart';

import '../../utils/color_utils.dart';
import '../widget/custom_icon_button.dart';
import '../widget/custom_sign_in_button.dart';
import '../widget/custom_text_fform_filed.dart';

class VerificationScreen extends StatelessWidget {
  VerificationScreen({super.key});

  dynamic incorrectPin;

  @override
  Widget build(BuildContext context) {
    dynamic emailUser = ModalRoute.of(context)!.settings.arguments;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColor.bgColorScreen,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomIconButton(),
                Stack(
                  children: [
                    Transform.translate(
                      offset: const Offset(0, -100),
                      child: Image(
                        alignment: Alignment.topCenter,
                        image: AssetImage(ImagePath.signInBgImage),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15.0,
                        right: 15.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Verification Code",
                            style: TextStyle(
                              color: AppColor.dotIndicator,
                              fontSize: 32,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          RichText(
                              text: TextSpan(children: [
                            const TextSpan(
                              text: "Enter the verification code we sent to your ",
                              style: TextStyle(
                                color: AppColor.textBackground,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: "$emailUser",
                              style: const TextStyle(
                                color: AppColor.textBackground,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const TextSpan(
                              text: " email address.",
                              style: TextStyle(
                                color: AppColor.textBackground,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ])),
                          const SizedBox(
                            height: 24,
                          ),
                          Pinput(
                            obscureText: true,
                            obscuringWidget: const CircleAvatar(
                              backgroundColor: Color(0xff0A0D14),
                              radius: 8,
                            ),
                            defaultPinTheme: PinTheme(
                              height: 56,
                              width: 52,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xffE2E4E9),
                                ),
                                color: const Color(0xffFFFFFF),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            length: 6,
                            pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                            showCursor: true,
                            onCompleted: (pin) => print(pin),
                            validator: (value) {
                              incorrectPin = value;
                              print("New:$value");
                            },
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Didn’t reveice the code?",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: const Text(
                                  "Resend",
                                  style: TextStyle(
                                    color: Color(0xff5C0319),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 330,
                          ),
                          const Text(
                            "If you don't see the verification email, be sure to check your spam or junk folders!",
                            style: TextStyle(
                              color: Color(0xff606060),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          SizedBox(
                            height: 52,
                            width: 380,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  const Color(0xff5C0319),
                                ),
                              ),
                              onPressed: () {
                                (incorrectPin == null)
                                    ? showModalBottomSheet(
                                        context: (context),
                                        builder: (BuildContext context) {
                                          return Container(
                                            height: 318,
                                            width: 400,
                                            decoration: const BoxDecoration(
                                              color: Color(0xffFFFFFF),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20),
                                              ),
                                            ),
                                            child: CustomBottomSheet(
                                              onPressed: () {},
                                              container: Container(),
                                              title: "Invalid Verification Code",
                                              imagePath: ImagePath.failedImage,
                                              buttonTitle: "Try Again",
                                              subtext:
                                                  "Please check the verification code and \n                      enter it again.",
                                            ),
                                          );
                                        })
                                    : showModalBottomSheet(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Container(
                                            height: 318,
                                            width: 400,
                                            decoration: const BoxDecoration(
                                              color: Color(0xffFFFFFF),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20),
                                              ),
                                            ),
                                            child: CustomBottomSheet(
                                              onPressed: () {
                                                Navigator.of(context).pushNamedAndRemoveUntil(
                                                  MyRoutes.homeScreen,
                                                  (route) => false,
                                                );
                                              },
                                              container: Container(),
                                              title: "Register Success",
                                              imagePath: ImagePath.trueImage,
                                              buttonTitle: "Go to HomePage",
                                              subtext:
                                                  "Congratulation! your account already created. \n       Please login to get amazing experience.",
                                            ),
                                          );
                                        });
                              },
                              child: const Text(
                                "Submit",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffFFFFFF),
                                ),
                              ),
                            ),
                          ),
                        ],
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
