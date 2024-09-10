import 'package:flutter/material.dart';

class FourthScreen extends StatelessWidget {
  const FourthScreen({super.key});

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
              color: Colors.brown,
              child: const Text('4'),
            ),
          ],
        ),
      ),
    );
  }
}
