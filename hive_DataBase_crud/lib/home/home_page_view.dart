import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_database_crud/home/home_page_cubit.dart';
import 'package:hive_database_crud/modal/employee_modal.dart';

class HomePageView extends StatelessWidget {
  HomePageView({super.key});

  static const String routeName = '/home_page_view';

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (_) => HomePageCubit()..onGetEmp(),
      child: HomePageView(),
    );
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home PAge"),
        centerTitle: true,
      ),
      body: BlocBuilder<HomePageCubit, HomePageState>(
        builder: (context, state) {
          if (state is HomePageLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomePageLoaded) {
            return ListView.builder(
              itemCount: state.empList.length,
              itemBuilder: (context, index) {
                EmployeeModal newEmp = state.empList[index];
                print("newEMPPPP::: ${newEmp.name}");
                return ListTile(
                  title: Text(newEmp.name),
                );
              },
            );
          } else if (state is HomePageError) {
            return Center(child: Text(state.msg));
          } else {
            return const Center(child: Text("No data"));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Emp Details"),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      EmployeeModal emp = EmployeeModal(
                        id: DateTime.now().millisecondsSinceEpoch,
                        name: nameController.text,
                        email: emailController.text,
                        number: 45456,
                      );
                      context.read<HomePageCubit>().onInsertEmp(emp);
                      // nameController.clear();
                      // emailController.clear();
                      Navigator.pop(context, true);
                      print("add: $emp");
                    },
                    child: const Text("Add"),
                  ),
                ],
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        label: Text("name"),
                      ),
                    ),
                    TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        label: Text("email"),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
