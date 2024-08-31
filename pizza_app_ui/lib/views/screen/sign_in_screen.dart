import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pizza_app_ui/utils/color_utils.dart';
import 'package:pizza_app_ui/utils/image_utils.dart';
import 'package:pizza_app_ui/utils/my_routes_utils.dart';

import '../widget/custom_bottom_sheet.dart';
import '../widget/custom_icon_button.dart';
import '../widget/custom_sign_in_button.dart';
import '../widget/custom_text_fform_filed.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final _formkey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final verificationController = TextEditingController();

  dynamic password = 0;
  dynamic newValue;

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
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
              title: "Invalid Email Address",
              imagePath: "assets/icons/failed.png",
              buttonTitle: "Try Again",
              subtext: "Please check the e-mail address \n              and enter it again.",
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColor.bgColorScreen,
        body: SingleChildScrollView(
          child: SafeArea(
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
                        child: Form(
                          key: _formkey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Create Account",
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
                                "To complete your registration, you can choose one of the options below.",
                                style: TextStyle(
                                  color: AppColor.textBackground,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              CustomTextFormFiled(
                                textInputAction: TextInputAction.next,
                                controller: nameController,
                                obscure: false,
                                keyboard: TextInputType.name,
                                title: "Full Name",
                                imagePath: ImagePath.contactImage,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "please enter your name";
                                  } else {
                                    newValue = value;
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              CustomTextFormFiled(
                                textInputAction: TextInputAction.next,
                                controller: emailController,
                                obscure: false,
                                keyboard: TextInputType.emailAddress,
                                title: "E-mail Address",
                                imagePath: ImagePath.mailImage,
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
                                    newValue = value;
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 12,
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
                                    return "please enter your password";
                                  } else {
                                    password = value;
                                    if (value.length < 6) {
                                      return "Password must be longer than 6 characters";
                                    }
                                  }

                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              CustomTextFormFiled(
                                textInputAction: TextInputAction.done,
                                controller: verificationController,
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
                                height: 24,
                              ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Divider(
                                      indent: 40,
                                      endIndent: 15,
                                      color: AppColor.myDivider,
                                      height: 10,
                                    ),
                                  ),
                                  Text(
                                    "Or Sign In with",
                                    style: TextStyle(
                                      color: Color(0xff9CA4AB),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Expanded(
                                    child: Divider(
                                      indent: 15,
                                      endIndent: 40,
                                      color: AppColor.myDivider,
                                      height: 10,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              CustomSignInButton(
                                imagePath: ImagePath.appleImage,
                                title: "Sign in with Apple",
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              CustomSignInButton(
                                imagePath: ImagePath.googleImage,
                                title: "Sign in with Google",
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
                                      (newValue == null) ? const Color(0xffE2E4E9) : const Color(0xff5C0319),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (_formkey.currentState!.validate()) {
                                      (newValue == null)
                                          ? showBottomSheet(context)
                                          : Navigator.of(context).pushReplacementNamed(MyRoutes.verificationScreen,
                                              arguments: emailController.text);
                                      print("Email:$emailController");
                                    }
                                  },
                                  child: Text(
                                    "Continue",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: (newValue == null) ? const Color(0xff868C98) : Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
      ),
    );
  }
}
