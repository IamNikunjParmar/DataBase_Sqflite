import 'package:cubit_api_calling_product/cartCubit/cart_cubit.dart';
import 'package:cubit_api_calling_product/controller/product_controller.dart';
import 'package:cubit_api_calling_product/helper/db_helper.dart';
import 'package:cubit_api_calling_product/home%20Cubit/home_page_cubit.dart';
import 'package:cubit_api_calling_product/home%20Cubit/home_page_view.dart';
import 'package:cubit_api_calling_product/modal/cart_modal.dart';
import 'package:cubit_api_calling_product/utils/my_routes_utils.dart';
import 'package:cubit_api_calling_product/view/home/home_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CartModalAdapter());
  await Hive.openBox<CartModal>('CartBox');

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
        BlocProvider(create: (_) => CartCubit()),
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
