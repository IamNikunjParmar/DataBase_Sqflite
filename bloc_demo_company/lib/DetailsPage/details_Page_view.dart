import 'package:bloc_demo_company/DetailsPage/details_bloc.dart';
import 'package:bloc_demo_company/DetailsPage/details_event.dart';
import 'package:bloc_demo_company/DetailsPage/details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsPageView extends StatelessWidget {
  const DetailsPageView({super.key});

  static const String routeName = "Details_Page_view";

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailsBloc(),
      child: const DetailsPageView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Details Page"),
          centerTitle: true,
        ),
        body: BlocBuilder<DetailsBloc, DetailsState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                children: [
                  TextField(
                    onChanged: (val) {
                      context.read<DetailsBloc>().add(SearchFood(query: val));
                    },
                    decoration: const InputDecoration(
                      labelText: "Search for Food",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.filterFood.length,
                      itemBuilder: (ctx, index) {
                        AllFood myFood = state.filterFood[index];
                        return ListTile(
                          title: Text(myFood.name),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class AllFood {
  String name;
  int price;

  AllFood({required this.name, required this.price});
}
