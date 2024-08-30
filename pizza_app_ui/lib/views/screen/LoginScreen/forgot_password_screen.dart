import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:pizza_app_ui/utils/image_utils.dart';
import 'package:pizza_app_ui/utils/my_routes_utils.dart';
import 'package:pizza_app_ui/views/widget/custom_bottom_sheet.dart';

import '../../../utils/color_utils.dart';
import '../../widget/custom_icon_button.dart';
import '../../widget/custom_sign_in_button.dart';
import '../../widget/custom_text_fform_filed.dart';

class ForGotScreen extends StatelessWidget {
  ForGotScreen({super.key});

  final _formkey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  dynamic incorrectPin;
  dynamic newValue;

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
                            "Forgot My Password",
                            style: TextStyle(
                              color: AppColor.dotIndicator,
                              fontSize: 32,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            "Enter the verification code we sent to your $emailUser email address.",
                            style: const TextStyle(
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
                            height: 350,
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
                                  (newValue == null) ? const Color(0xffE2E4E9) : const Color(0xff5C0319),
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pushNamed(MyRoutes.newPasswordScreen);
                              },
                              child: Text(
                                "Continue",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: (newValue == null) ? const Color(0xff6F7886) : const Color(0xffFFFFFF),
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
