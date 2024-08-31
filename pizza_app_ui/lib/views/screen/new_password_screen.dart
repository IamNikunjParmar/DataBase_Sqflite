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

class NewPasswordScreen extends StatelessWidget {
  NewPasswordScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  dynamic incorrectPin;
  dynamic newValue;
  dynamic password;

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
                            "New Password",
                            style: TextStyle(
                              color: AppColor.dotIndicator,
                              fontSize: 32,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          const Text(
                            "You can log in to the application by setting your new password.",
                            style: TextStyle(
                              color: AppColor.textBackground,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          CustomTextFormFiled(
                            textInputAction: TextInputAction.next,
                            controller: passwordController,
                            obscure: true,
                            keyboard: TextInputType.visiblePassword,
                            title: "Password",
                            imagePath: ImagePath.lockImage,
                            onChanged: (value) {
                              password = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                              } else {
                                password = value;
                              }

                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          CustomTextFormFiled(
                            textInputAction: TextInputAction.done,
                            controller: confirmPasswordController,
                            obscure: true,
                            keyboard: TextInputType.visiblePassword,
                            title: "Verification Password",
                            imagePath: ImagePath.lockImage,
                            validator: (value) {
                              if (value != password) {
                                return "you password not match";
                              } else {}
                            },
                          ),
                          const SizedBox(
                            height: 300,
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
                                  (password == null) ? const Color(0xffE2E4E9) : const Color(0xff5C0319),
                                ),
                              ),
                              onPressed: () {
                                (password == null)
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
                                              onPressed: () {
                                                Navigator.of(context).pushNamedAndRemoveUntil(
                                                  MyRoutes.loginScreen,
                                                  (route) => false,
                                                );
                                              },
                                              container: Container(),
                                              title: "Your Password Successfully \n                 Updated!",
                                              imagePath: ImagePath.trueImage,
                                              buttonTitle: "Log in Again",
                                              subtext:
                                                  "You can use your new password to log in to the \n                            application.",
                                            ),
                                          );
                                        });
                              },
                              child: Text(
                                "Continue",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: (password == null) ? const Color(0xff6F7886) : const Color(0xffFFFFFF),
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
