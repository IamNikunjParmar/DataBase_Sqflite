import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:pizza_app_ui/utils/color_utils.dart';
import 'package:pizza_app_ui/utils/image_utils.dart';
import 'package:pizza_app_ui/views/widget/custom_text_fform_filed.dart';

import '../../../utils/my_routes_utils.dart';
import '../../widget/custom_bottom_sheet.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});

  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String newValue = "";
  dynamic password;
  String newPassValue = "";
  String confirmPassValue = "";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xffFAFAFA),
        appBar: AppBar(
          backgroundColor: AppColor.bgColorScreen,
          title: const Text(
            "Change Password",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xff0A0D14),
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/icons/info.png",
                        color: AppColor.dotIndicator,
                      ),
                      const Gap(5),
                      const Text(
                        "After setting your new password, you will be logged out \nof the app and can log back in with the new password.",
                        style: TextStyle(
                          color: Color(0xff52525B),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const Gap(24),
                  const Text(
                    "Enter your new password",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Gap(10),
                  CustomTextFormFiled(
                    title: "New Password",
                    imagePath: ImagePath.visibleImage,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter your password";
                      } else {
                        password = value;
                        if (value.length < 6) {
                          return "Password must be longer than 6 characters";
                        }
                      }
                      return null;
                    },
                    keyboard: TextInputType.emailAddress,
                    obscure: true,
                    controller: newPasswordController,
                    textInputAction: TextInputAction.next,
                    onChanged: (val) {
                      password = val;
                    },
                  ),
                  const Gap(16),
                  CustomTextFormFiled(
                    title: "New Password(Verification)",
                    imagePath: ImagePath.visibleImage,
                    validator: (value) {
                      if (value != password) {
                        return "you password not match";
                      } else {}
                    },
                    keyboard: TextInputType.phone,
                    obscure: true,
                    controller: confirmPasswordController,
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(
                    height: 385,
                  ),
                  InkWell(
                    onTap: () {
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
                        "Change Password",
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
      ),
    );
  }
}
