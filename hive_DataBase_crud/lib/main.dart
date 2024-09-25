import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_database_crud/helper/emp_helper.dart';
import 'package:hive_database_crud/home/home_page_cubit.dart';
import 'package:hive_database_crud/home/home_page_view.dart';
import 'package:hive_database_crud/modal/employee_modal.dart';
import 'package:hive_database_crud/utils/routes.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(EmployeeModalAdapter());
  await Hive.openBox<EmployeeModal>('empBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HomePageCubit()..onGetEmp(),
        ),
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
