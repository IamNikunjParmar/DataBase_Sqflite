import 'package:cloud_database_demo/home/add_user_page.dart';
import 'package:cloud_database_demo/home/home_page_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:logger/logger.dart';

import '../helper/fb_auth_helper.dart';

class HomePageView extends StatelessWidget {
  HomePageView({super.key});

  static const String routeName = '/home_page_view';

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageCubit(
          HomePageState(
            nameController: TextEditingController(),
            companyController: TextEditingController(),
            ageController: TextEditingController(),
          ),
          context: context),
      child: HomePageView(),
    );
  }

  final logger = Logger();

  User? user = FbAuthHelper.fbAuthHelper.firebaseAuth.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<HomePageCubit, HomePageState>(
                builder: (context, state) {
                  return ListView.builder(
                      itemCount: state.userList.length,
                      itemBuilder: (ctx, index) {
                        final newUser = state.userList[index];
                        return Card(
                          elevation: 5,
                          margin: const EdgeInsets.all(5),
                          child: ListTile(
                            title: Text(newUser['name']),
                            subtitle: Text(newUser['age'].toString()),
                          ),
                        );
                      });
                },
              ),
            ),
            //  Text("User Email : ${user?.email ?? 'email not found'}"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<HomePageCubit>().addEventMethod();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
