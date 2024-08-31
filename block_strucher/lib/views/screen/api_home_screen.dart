import 'package:block_strucher/apiBloc/api_bloc.dart';
import 'package:block_strucher/apiBloc/api_event.dart';
import 'package:block_strucher/apiBloc/api_state.dart';
import 'package:block_strucher/utils/enum/api_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/api_model.dart';

class ApiHomeScreen extends StatefulWidget {
  const ApiHomeScreen({super.key});

  @override
  State<ApiHomeScreen> createState() => _ApiHomeScreenState();
}

class _ApiHomeScreenState extends State<ApiHomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<ApiBloc>().add(FetchApi());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ApiHomePage"),
        centerTitle: true,
      ),
      body: BlocBuilder<ApiBloc, ApiState>(
        builder: (context, state) {
          switch (state.apiStatus) {
            case ApiStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ApiStatus.success:
              return ListView.builder(
                  itemCount: state.userList.length,
                  itemBuilder: (ctx, index) {
                    ApiModel user = state.userList[index];

                    return ListTile(
                      title: Text(user.content),
                      subtitle: Text(user.email),
                      leading: Text(user.id.toString()),
                    );
                  });
            case ApiStatus.error:
              return const Text("Failed Api Data");
          }
        },
      ),
    );
  }
}
