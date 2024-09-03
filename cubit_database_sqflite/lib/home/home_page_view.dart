import 'package:cubit_database_sqflite/home/add_student_page.dart';
import 'package:cubit_database_sqflite/home/home_page_cubit.dart';
import 'package:cubit_database_sqflite/home/home_page_state.dart';
import 'package:cubit_database_sqflite/modal/student_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  static const String routeName = '/home_page_view';

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (_) => HomePageCubit()..onGetStudent(),
      child: const HomePageView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<HomePageCubit, HomePageState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.error.isNotEmpty) {
              return Text(state.error);
            } else if (state.studentList.isNotEmpty) {
              return RefreshIndicator(
                onRefresh: () {
                  return context.read<HomePageCubit>().onGetStudent();
                },
                child: ListView.builder(
                  itemCount: state.studentList.length,
                  itemBuilder: (ctx, index) {
                    StudentModal student = state.studentList[index];
                    return Card(
                      color: Colors.white,
                      elevation: 5,
                      child: ExpansionTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(student.name),
                            const Gap(35),
                            GestureDetector(
                              onTap: () {
                                TextEditingController nameController = TextEditingController(text: student.name);
                                TextEditingController courseController = TextEditingController(text: student.course);
                                TextEditingController numberController = TextEditingController(text: student.number);
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text("Update Student"),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TextField(
                                              controller: nameController,
                                              decoration: const InputDecoration(labelText: 'Name'),
                                            ),
                                            TextField(
                                              controller: courseController,
                                              decoration: const InputDecoration(labelText: 'Course'),
                                            ),
                                            TextField(
                                              controller: numberController,
                                              decoration: const InputDecoration(labelText: 'Number'),
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                              },
                              child: const Icon(Icons.edit),
                            ),
                            GestureDetector(onTap: () {}, child: const Icon(Icons.delete)),
                          ],
                        ),
                        leading: CircleAvatar(
                          child: Text(student.id.toString()),
                        ),
                        children: [
                          Container(
                            height: 90,
                            width: 400,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        "Course:",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      const Gap(5),
                                      Text(
                                        student.course,
                                        style: const TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        "Number:",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      const Gap(5),
                                      Text(
                                        student.number,
                                        style: const TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            } else {
              return const Center(
                child: Text("no Student"),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.of(context).pushNamed(AddStudentPage.routeName);

          if (result == true) {
            context.read<HomePageCubit>().onGetStudent();
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
