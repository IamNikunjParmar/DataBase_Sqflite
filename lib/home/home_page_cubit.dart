import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_database_demo/helper/fb_helper.dart';
import 'package:cloud_database_demo/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:logger/logger.dart';

part 'home_page_state.dart';

final eventBus = EventBus();

class UserAddedEvent {
  final String name;
  final String email;
  final int age;

  UserAddedEvent(this.name, this.email, this.age);
}

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit(super.initialState, {required this.context}) {
    fetchUser();
    _userAddedSubscription = eventBus.on<UserAddedEvent>().listen((event) {
      logger.i('User added: ${event.name}, ${event.email}, ${event.age}');
      fetchUser();
    });
  }

  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  final logger = Logger();
  final BuildContext context;
  late StreamSubscription _userAddedSubscription;
  Future<void> addUser(BuildContext context, String name, String email, int age) async {
    try {
      emit(state.copyWith(isLoading: true));
      await FireStoreHelper.addUser(name, email, age);
      eventBus.fire(UserAddedEvent(name, email, age));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  Future<void> fetchUser() async {
    try {
      emit(state.copyWith(isLoading: true));
      final users = await FireStoreHelper.fetchUsers();
      final updateList = List.from(users);
      emit(state.copyWith(userList: updateList, isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  void addEventMethod() async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Employee Details"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: state.nameController,
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  decoration: const InputDecoration(
                    labelText: 'name',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                ),
                const Gap(20),
                TextField(
                  controller: state.companyController,
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  decoration: const InputDecoration(
                    labelText: 'company',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                ),
                const Gap(20),
                TextField(
                  controller: state.ageController,
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  decoration: const InputDecoration(
                    labelText: 'age',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  context.read<HomePageCubit>().addUser(
                        context,
                        state.nameController.text,
                        state.companyController.text,
                        int.parse(state.ageController.text),
                      );
                  state.nameController.clear();
                  state.companyController.clear();
                  state.ageController.clear();
                  Navigator.pop(context);
                },
                child: const Text("Add"),
              ),
            ],
          );
        });
  }

  Future<void> deleteUser(String docId) async {
    await FireStoreHelper.deleteUser(docId);
    await fetchUser();
  }

  @override
  Future<void> close() {
    _userAddedSubscription.cancel();
    return super.close();
  }
}
