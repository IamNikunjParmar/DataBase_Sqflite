import 'package:api_calling_dio_demo/helper/http_api_helper.dart';
import 'package:api_calling_dio_demo/modal/api_modal.dart';

import 'package:flutter/material.dart';

class HttpHomePage extends StatefulWidget {
  const HttpHomePage({super.key});

  @override
  State<HttpHomePage> createState() => _HttpHomePageState();
}

class _HttpHomePageState extends State<HttpHomePage> {
  final HttpApiHelper helper = HttpApiHelper.httpApiHelper;

  List<ApiModal> allData = [];
  bool isLoading = true;

  Future<void> getUser() async {
    try {
      allData = await helper.getData();
    } catch (e) {
      print("Error : $e");
    } finally {
      isLoading = false;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
    print('==$allData==');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Http Api"),
          centerTitle: true,
        ),
        body: isLoading
            ? const Center(
                //  child: CircularProgressIndicator(),
                )
            : ListView.builder(
                itemCount: allData.length,
                itemBuilder: (ctx, index) {
                  //print("${allData.length}================---------------");
                  ApiModal newUser = allData[index];
                  return ListTile(
                    title: Text(newUser.content),
                  );
                }));
  }
}
