import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 900,
              width: double.infinity,
              alignment: Alignment.center,
              color: Colors.green,
              child: const Text('3'),
            ),
          ],
        ),
      ),
    );
  }
}
