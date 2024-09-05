import 'package:cubit_database_sqflite/helper/db_helper.dart';
import 'package:cubit_database_sqflite/home/home_page_cubit.dart';
import 'package:cubit_database_sqflite/home/home_page_view.dart';
import 'package:cubit_database_sqflite/utils/my_routes_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.dbHelper.initDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HomePageCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        routes: myRoutes,
        initialRoute: HomePageView.routeName,
      ),
    );
  }
}
