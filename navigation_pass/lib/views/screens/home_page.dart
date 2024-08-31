import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigation_pass/utils/my_routes_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  int? intValue;
  double? doubleValue;
  bool? boolValue;
  String? stringValue;

  dynamic data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                Navigator.of(context).pushNamed(MyRoutes.thirdPage);
              });
            },
            child: const Text("third"),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                data = await Navigator.of(context).pushNamed(MyRoutes.secondPage);
                print("DATA:$data");
                setState(() {
                  if (data is int) {
                    intValue = data;
                  } else if (data is double) {
                    doubleValue = data;
                  } else if (data is bool) {
                    boolValue = data;
                  } else if (data is String) {
                    stringValue = data;
                  }
                });
              },
              child: const Text("SecondPage"),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            "IntValue:$intValue",
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            "DoubleValue:$doubleValue",
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            "BoolValue:$boolValue",
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            "StringValue:  $stringValue",
          ),
        ],
      ),
    );
  }
}
