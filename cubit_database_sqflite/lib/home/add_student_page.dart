import 'package:cubit_database_sqflite/home/home_page_cubit.dart';
import 'package:cubit_database_sqflite/home/home_page_view.dart';
import 'package:cubit_database_sqflite/modal/student_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class AddStudentPage extends StatelessWidget {
  AddStudentPage({super.key});
  static const String routeName = 'add_student_page';

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (_) => HomePageCubit(),
      child: AddStudentPage(),
    );
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController courseController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add Student"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Name",
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
              const Gap(15),
              TextField(
                controller: courseController,
                decoration: const InputDecoration(
                  labelText: "Course",
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
              const Gap(15),
              TextField(
                controller: numberController,
                decoration: const InputDecoration(
                  labelText: "number",
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
              const Gap(50),
              ElevatedButton(
                onPressed: () {
                  final student = StudentModal(
                    name: nameController.text,
                    number: numberController.text,
                    course: courseController.text,
                  );
                  context.read<HomePageCubit>().onInsertStudent(student);
                  Navigator.pop(context, true);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      behavior: SnackBarBehavior.fixed,
                      showCloseIcon: true,
                      backgroundColor: Colors.green,
                      content: Text("Student Added"),
                    ),
                  );
                },
                child: const Text("Add Student"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
