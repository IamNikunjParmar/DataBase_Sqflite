import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:pizza_app_ui/utils/color_utils.dart';
import 'package:pizza_app_ui/views/widget/custom_text_fform_filed.dart';

class AccountInformationScreen extends StatelessWidget {
  AccountInformationScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String newValue = "";
  String nameValue = "";
  String emailValue = "";
  String numberValue = "";

  bool newNameValue = true;

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
            "Account Information",
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
                children: [
                  CustomTextFormFiled(
                    title: "Full Name",
                    imagePath: "assets/icons/contact.png",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter your name";
                      } else {
                        nameValue = value;
                      }
                      return null;
                    },
                    keyboard: TextInputType.name,
                    obscure: false,
                    controller: nameController,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextFormFiled(
                    title: "E-mail Address",
                    imagePath: "assets/icons/mail.png",
                    validator: (value) {
                      const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
                          r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
                          r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
                          r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
                          r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
                          r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
                          r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
                      final regex = RegExp(pattern);
                      if (value!.isEmpty || !regex.hasMatch(value)) {
                        return ' please enter your email';
                      } else {
                        emailValue = value;
                      }
                      return null;
                    },
                    keyboard: TextInputType.emailAddress,
                    obscure: false,
                    controller: emailController,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextFormFiled(
                    title: "Phone Number",
                    imagePath: "assets/icons/phone.png",
                    validator: (value) {
                      if (value?.length != 10) {
                        return 'Mobile Number must be of 10 digits';
                      } else {
                        numberValue = value!;
                      }
                      return null;
                    },
                    keyboard: TextInputType.phone,
                    obscure: false,
                    controller: numberController,
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/icons/info.png",
                        color: AppColor.dotIndicator,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        "If you change your email or phone number, you will need \nto verify it again.",
                        style: TextStyle(
                          color: Color(0xff52525B),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 325,
                  ),
                  InkWell(
                    onTap: () async {
                      if (nameValue.isEmpty) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              closeIconColor: const Color(0xff868C98),
                              content: Row(
                                children: [
                                  Image.asset("assets/icons/error.png"),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    "please enter your name",
                                    style: TextStyle(
                                      color: Color(0xffCB2B2B),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              backgroundColor: const Color(0xffFCEAEA),
                              behavior: SnackBarBehavior.floating,
                              showCloseIcon: true,
                              margin: const EdgeInsets.only(bottom: 650, left: 10, right: 10
                                  // top: 100,
                                  ),
                            ),
                          );
                        });
                      } else if (emailValue.isEmpty) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              closeIconColor: const Color(0xff868C98),
                              content: Row(
                                children: [
                                  Image.asset("assets/icons/error.png"),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    "Unrequited E-mail Address. Please try again.",
                                    style: TextStyle(
                                      color: Color(0xffCB2B2B),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              backgroundColor: const Color(0xffFCEAEA),
                              behavior: SnackBarBehavior.floating,
                              showCloseIcon: true,
                              margin: const EdgeInsets.only(bottom: 650, left: 10, right: 10
                                  // top: 100,
                                  ),
                            ),
                          );
                        });
                      } else if (numberValue.isEmpty) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              closeIconColor: const Color(0xff868C98),
                              content: Row(
                                children: [
                                  Image.asset("assets/icons/error.png"),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    "Unrequited Phone Number. Please try again.",
                                    style: TextStyle(
                                      color: Color(0xffCB2B2B),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              backgroundColor: const Color(0xffFCEAEA),
                              behavior: SnackBarBehavior.floating,
                              showCloseIcon: true,
                              margin: const EdgeInsets.only(bottom: 650, left: 10, right: 10
                                  // top: 100,
                                  ),
                            ),
                          );
                        });
                      } else {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              closeIconColor: const Color(0xff868C98),
                              content: Row(
                                children: [
                                  Image.asset("assets/icons/success.png"),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    "please Changed Successfully ",
                                    style: TextStyle(
                                      color: Color(0xff1B8848),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              backgroundColor: const Color(0xffE9F9F0),
                              behavior: SnackBarBehavior.floating,
                              showCloseIcon: true,
                              margin: const EdgeInsets.only(bottom: 650, left: 10, right: 10
                                  // top: 100,
                                  ),
                            ),
                          );
                        });
                      }
                      print("EMaiL:$emailValue");
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
                        "Save Changes",
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
