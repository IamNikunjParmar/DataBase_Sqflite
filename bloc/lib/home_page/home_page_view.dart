import 'package:bloc_demo/details_view/details_view.dart';
import 'package:bloc_demo/home_page/home_page_bloc.dart';
import 'package:bloc_demo/home_page/home_page_event.dart';
import 'package:bloc_demo/home_page/home_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageView extends StatefulWidget {
  static const String routeName = "/home_page_view";

  const HomePageView({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageBloc(const HomePageState()),
      child: const HomePageView(),
    );
  }

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc example"),
      ),
      body: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, state) {
          return Center(
            child: InkWell(
              onTap: () {
                context.read<HomePageBloc>().add(
                      ChangeName(name: "Devang"),
                    );
                Navigator.of(context).pushNamed(DetailsView.routeName);
              },
              child: Text("My Name : ${state.name}"),
            ),
          );
        },
      ),
    );
  }
}
