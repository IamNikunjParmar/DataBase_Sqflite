import 'package:dynamic_api_demo/helper/api_helper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiHelper apiHelper = ApiHelper.apiHelper;

  bool isLoading = true;
  Map<String, dynamic> allData = {};

  fetchData() async {
    try {
      allData = await apiHelper.getData();
      setState(() {
        //  print("Home Page :   $allData  ====================++++++++++++++====");
      });
    } catch (e) {
      print("ERROR IS :   $e --------------------------------------------------");
    } finally {
      isLoading = false;
    }
  }

  refreshButton() {
    setState(() {
      fetchData();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dynamic Api"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              refreshButton();
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(18),
              child: ListView.builder(
                  itemCount: allData.length,
                  itemBuilder: (ctx, index) {
                    String myKeys = allData.keys.elementAt(index);
                    var value = allData.values.elementAt(index);

                    if (value is String) {
                      return Card(
                        elevation: 5,
                        child: ListTile(
                          title: Text(" String Key: $myKeys"),
                          subtitle: Text(" String Value : $value"),
                        ),
                      );
                    } else if (value is Map) {
                      return ExpansionTile(
                        title: Text(" Map Key: $myKeys"),
                        children: (value as Map<String, dynamic>).entries.map(
                          (e) {
                            return ListTile(
                              title: Text("Map Key : ${e.key}"),
                              subtitle: Text("Map value : ${e.value}"),
                            );
                          },
                        ).toList(),
                      );
                    } else if (value is List) {
                      return ExpansionTile(
                          title: Text(" List Key: $myKeys"),
                          children: value.map((e) {
                            return ListTile(
                              title: Text("List value : ${e.toString()}"),
                            );
                          }).toList());
                    } else {
                      return ListTile(
                        title: Text(" other Key :$myKeys"),
                      );
                    }

                    // print("===============  KEY ;;;; : $myKeys========================");
                    //  print("KEYS :      $myKeys===============");
                    // print("VALUES :      $value++++++++++++++++++++++++++++++++++");
                  }),
            ),
    );
  }
}
