import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../switch/switch_bloc.dart';
import '../../switch/switch_event.dart';
import '../../switch/switch_state.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details Page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<SwitchBloc, SwitchState>(
            builder: (context, state) {
              return Center(
                child: Switch(
                    value: state.isSwitch,
                    onChanged: (val) {
                      context.read<SwitchBloc>().add(EnableButton());
                    }),
              );
            },
          ),
        ],
      ),
    );
  }
}
