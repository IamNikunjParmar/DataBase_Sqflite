import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'details_bloc.dart';

part 'details_event.dart';

part 'details_state.dart';

class DetailsView extends StatefulWidget {
  static const String routeName = "/details_view";

  const DetailsView({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailsBloc(const DetailsState(name: "name")),
      child: const DetailsView(),
    );
  }

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details View"),
      ),
      body: BlocBuilder<DetailsBloc, DetailsState>(
        builder: (BuildContext context, state) {
          return Center(
            child: Text(state.name),
          );
        },
      ),
    );
  }
}
