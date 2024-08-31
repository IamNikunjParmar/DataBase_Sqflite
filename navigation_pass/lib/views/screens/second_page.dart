import 'package:flutter/material.dart';
import 'package:navigation_pass/utils/my_routes_utils.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    int intValue = 5;
    double doubleValue = 78;
    bool boolValue = true;
    String stringValue = "My name Is Kiran";

    return Scaffold(
      appBar: AppBar(
        title: const Text("SecondPage"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  Navigator.of(context).pushNamed(MyRoutes.thirdPage);
                });
              },
              child: const Text("third"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  Navigator.of(context).pop(intValue);
                  print("TApped:$intValue");
                });
              },
              child: const Text("int"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(doubleValue);
                print("DOUBleTApped:$doubleValue");
              },
              child: const Text("double"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(boolValue);
                print("boolTApped:$boolValue");
              },
              child: const Text("bool"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(stringValue);
                print("StringTApped:$stringValue");
              },
              child: const Text("string"),
            ),
          ],
        ),
      ),
    );
  }
}
