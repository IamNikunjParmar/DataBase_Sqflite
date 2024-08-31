import 'package:block_strucher/apiBloc/api_bloc.dart';
import 'package:block_strucher/counter/counter_bloc.dart';
import 'package:block_strucher/switch/switch_bloc.dart';
import 'package:block_strucher/utils/my_routes_utils.dart';
import 'package:block_strucher/views/screen/api_home_screen.dart';
import 'package:block_strucher/views/screen/details_page.dart';
import 'package:block_strucher/views/screen/home_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CounterBloc(),
        ),
        BlocProvider(
          create: (_) => ApiBloc(),
        ),
        BlocProvider(
          create: (_) => SwitchBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        initialRoute: MyRoutes.home,
        routes: {
          MyRoutes.home: (context) => const HomePage(),
          MyRoutes.detailsPage: (context) => const DetailsPage(),
          MyRoutes.apiHomePage: (context) => const ApiHomeScreen(),
        },
      ),
    );
  }
}
