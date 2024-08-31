import 'package:bloc_demo_company/homePage/home_page_bloc.dart';
import 'package:bloc_demo_company/homePage/home_page_event.dart';
import 'package:bloc_demo_company/homePage/home_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  static const String routeName = "/home_page_view";

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: const HomePageView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page View"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${state.count}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.read<HomeBloc>().add(IncrementCounter());
                      },
                      child: const Text("Increment"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<HomeBloc>().add(DecrementCounter());
                      },
                      child: const Text("Decrement"),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
