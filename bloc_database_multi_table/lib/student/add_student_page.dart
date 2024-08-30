import 'package:bloc_database_multi_table/modal/student_modal.dart';
import 'package:bloc_database_multi_table/student/student_page_bloc.dart';
import 'package:bloc_database_multi_table/student/student_page_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../HomePage/home_page_view.dart';

class AddStudentPage extends StatelessWidget {
  AddStudentPage({super.key});

  static const String routeName = 'add_student_page';

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => StudentPageBloc(),
      child: AddStudentPage(),
    );
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController professorIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Student"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
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
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
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
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: numberController,
              decoration: const InputDecoration(
                labelText: "Mobile Number",
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
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () {
                final student = StudentModal(
                  name: nameController.text,
                  number: numberController.text,
                  email: emailController.text,
                );
                context.read<StudentPageBloc>().add(AddTOStudent(student: student));
                Navigator.pop(context, true);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    behavior: SnackBarBehavior.floating,
                    showCloseIcon: true,
                    content: Text("Student Added"),
                  ),
                );
              },
              child: const Text("Add Student"),
            ),
          ],
        ),
      ),
    );
  }
}
