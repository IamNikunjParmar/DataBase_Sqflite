import 'package:flutter/material.dart';

class FiveScreen extends StatelessWidget {
  const FiveScreen({super.key});

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
              color: Colors.cyanAccent,
              child: const Text('5'),
            ),
          ],
        ),
      ),
    );
  }
}
