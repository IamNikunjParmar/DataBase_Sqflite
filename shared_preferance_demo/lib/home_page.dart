import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String _userName;
  late bool _remember;

  loadData() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      _userName = prefs.getString('userName') ?? '';
      _remember = prefs.getBool('rememberMe') ?? false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(
                  labelText: "UserName", hintText: "Full Name"),
              onChanged: (val) {
                setState(() {
                  _userName = val;
                });
              },
            ),
            const SizedBox(
              height: 50,
            ),
            Text("UserName:$_userName"),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.setString('userName', _userName);

                print("USSSNAME:$_userName");
              },
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
