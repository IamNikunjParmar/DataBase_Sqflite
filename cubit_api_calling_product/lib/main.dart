import 'package:cubit_api_calling_product/controller/product_controller.dart';
import 'package:cubit_api_calling_product/home%20Cubit/home_page_cubit.dart';
import 'package:cubit_api_calling_product/home%20Cubit/home_page_view.dart';
import 'package:cubit_api_calling_product/utils/my_routes_utils.dart';
import 'package:cubit_api_calling_product/view/home/home_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ProductController(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (_) => HomePageCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        routes: myRoutes,
        initialRoute: HomePAgeViewCubit.routeName,
      ),
    );
  }
}
