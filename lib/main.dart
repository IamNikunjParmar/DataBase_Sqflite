import 'package:cloud_database_demo/home/home_page_cubit.dart';
import 'package:cloud_database_demo/home/home_page_view.dart';
import 'package:cloud_database_demo/login/login_page_cubit.dart';
import 'package:cloud_database_demo/login/login_page_view.dart';
import 'package:cloud_database_demo/sign%20In/sing_in_page_cubit.dart';
import 'package:cloud_database_demo/sign%20In/sing_in_page_view.dart';
import 'package:cloud_database_demo/utils/routes_utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomePageCubit(
              HomePageState(
                nameController: TextEditingController(),
                companyController: TextEditingController(),
                ageController: TextEditingController(),
              ),
              context: context),
        ),
        BlocProvider(
          create: (context) => SingInPageCubit(),
        ),
        BlocProvider(
          create: (context) => LoginPageCubit(),
        ),
      ],
      child: ToastificationWrapper(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
          ),
          routes: myRoutes,
          initialRoute: LoginPageView.routeName,
        ),
      ),
    );
  }
}
