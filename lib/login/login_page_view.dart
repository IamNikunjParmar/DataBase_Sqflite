import 'package:cloud_database_demo/helper/fb_auth_helper.dart';
import 'package:cloud_database_demo/home/home_page_view.dart';
import 'package:cloud_database_demo/logger/logger.dart';
import 'package:cloud_database_demo/login/login_page_cubit.dart';
import 'package:cloud_database_demo/sign%20In/sing_in_page_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:toastification/toastification.dart';

import '../custom Widget/email_text_field.dart';
import '../custom Widget/password_text_field.dart';
import '../sign In/sing_in_page_cubit.dart';

class LoginPageView extends StatelessWidget {
  LoginPageView({super.key});

  static const String routeName = 'login_page_view';

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginPageCubit(),
      child: LoginPageView(),
    );
  }

  GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  User? user = FbAuthHelper.fbAuthHelper.firebaseAuth.currentUser;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const Gap(50),
              const Center(
                child: Text(
                  "Login Here",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              const Gap(20),
              Form(
                key: loginKey,
                child: Column(
                  children: [
                    EmailTextFormField(
                      emailController: emailController,
                    ),
                    const Gap(20),
                    PasswordTextFormField(
                      passwordController: passwordController,
                    ),
                    const Gap(30),
                    SizedBox(
                      height: 50,
                      width: 150,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.blue),
                        ),
                        onPressed: () async {
                          User? user = FbAuthHelper.fbAuthHelper.firebaseAuth.currentUser;
                          if (loginKey.currentState!.validate()) {
                            context
                                .read<LoginPageCubit>()
                                .loginWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text,
                                )
                                .then(
                              (value) {
                                if (context.mounted) {
                                  Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      (user != null) ? HomePageView.routeName : LoginPageView.routeName,
                                      (route) => false,
                                      arguments: user);
                                }
                                emailController.clear();
                                passwordController.clear();
                              },
                            );
                          }
                        },
                        child: const Text(
                          "Login Now",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Create new Account?"),
                        const Gap(5),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, SignInPageView.routeName);
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 16,
                            ),
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
      ),
    );
  }
}
