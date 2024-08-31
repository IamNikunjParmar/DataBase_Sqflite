import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../modal/user.dart';

class JsonSerializationScreen extends StatefulWidget {
  const JsonSerializationScreen({super.key});

  @override
  State<JsonSerializationScreen> createState() =>
      _JsonSerializationScreenState();
}

class _JsonSerializationScreenState extends State<JsonSerializationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<User>>(
            future: getData(),
            builder: (context, data) {
              if (data.hasData) {
                dynamic userList = data.data;
                return ListView.builder(
                    itemCount: userList.length,
                    itemBuilder: (context, index) {
                      dynamic userData = userList[index];

                      return Container(
                        height: 100,
                        margin:
                            const EdgeInsets.only(top: 30, left: 20, right: 20),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'First Name: ${userData.name}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}

Future<List<User>> getData() async {
  return await Future.delayed(const Duration(seconds: 2), () {
    String userJson =
        '{"name":"Mohan","firstName":"Ninja","lastName":"param",}';
    List<dynamic> data = jsonDecode(userJson);
    List<User> users = data.map((data) => User.fromJson(data)).toList();
    return users;
  });
}
