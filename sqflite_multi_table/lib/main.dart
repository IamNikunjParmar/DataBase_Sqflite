import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_multi_table/controller/db_controller.dart';
import 'package:sqflite_multi_table/helper/db_helper.dart';
import 'package:sqflite_multi_table/views/screens/home_page.dart';

import 'controller/cmp_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.dbHelper.initDb();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => DbController(),
      ),
      ChangeNotifierProvider(
        create: (context) => CmpController(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
