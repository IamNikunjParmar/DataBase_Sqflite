import 'package:flutter/material.dart';

class SecoundScreen extends StatelessWidget {
  const SecoundScreen({super.key});

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
              color: Colors.amber,
              child: const Text('2'),
            ),
          ],
        ),
      ),
    );
  }
}
