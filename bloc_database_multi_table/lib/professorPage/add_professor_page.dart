import 'package:bloc_database_multi_table/HomePage/home_page_view.dart';
import 'package:bloc_database_multi_table/professorPage/professor_bloc.dart';
import 'package:bloc_database_multi_table/professorPage/professor_event.dart';
import 'package:bloc_database_multi_table/professorPage/professor_page_viiew.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../modal/professor_modal.dart';

class AddProfessorPage extends StatelessWidget {
  AddProfessorPage({super.key});

  static const String routeName = 'add_professor_page_';

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfessorBloc(),
      child: AddProfessorPage(),
    );
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add Professor"),
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
                controller: subjectController,
                decoration: const InputDecoration(
                  labelText: "Subject",
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
                onPressed: () async {
                  final professor = ProfessorModal(
                    name: nameController.text,
                    subject: subjectController.text,
                    number: numberController.text,
                  );
                  context.read<ProfessorBloc>().add(AddProfessor(query: professor));
                  Navigator.pop(context, true);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      behavior: SnackBarBehavior.floating,
                      showCloseIcon: true,
                      content: Text("Professor Added"),
                    ),
                  );
                },
                child: const Text("Add Professor"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
