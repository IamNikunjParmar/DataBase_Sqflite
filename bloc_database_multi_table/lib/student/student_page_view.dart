import 'package:bloc_database_multi_table/modal/professor_modal.dart';
import 'package:bloc_database_multi_table/modal/student_modal.dart';
import 'package:bloc_database_multi_table/professorPage/professor_bloc.dart';
import 'package:bloc_database_multi_table/student/add_student_page.dart';
import 'package:bloc_database_multi_table/student/student_page_bloc.dart';
import 'package:bloc_database_multi_table/student/student_page_event.dart';
import 'package:bloc_database_multi_table/student/student_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentPageView extends StatelessWidget {
  StudentPageView({super.key});

  static const String routeName = 'student_page_view';

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => StudentPageBloc(),
      child: StudentPageView(),
    );
  }

  List<ProfessorModal> professors = [];

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController numberController = TextEditingController();

  TextEditingController professorIdController = TextEditingController();

  void _showEditDialog(StudentModal student, BuildContext context) {
    TextEditingController nameController = TextEditingController(text: student.name);
    TextEditingController emailController = TextEditingController(text: student.email);
    TextEditingController numberController = TextEditingController(text: student.number);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Student"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: numberController,
                decoration: const InputDecoration(labelText: 'Number'),
              ),
            ],
          ),
          actions: [
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                student.name = nameController.text;
                student.email = emailController.text;
                student.number = numberController.text;
                context.read<StudentPageBloc>().add(UpdateTOStudent(upStudent: student));
                Navigator.pop(context);
                //  _loadStudent();

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    showCloseIcon: true,
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.green,
                    content: Text("Student Updated.."),
                  ),
                );
              },
              child: const Text("Update"),
            ),
          ],
        );
      },
    );
  }

  void _showProfessorDialog(StudentModal student, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return BlocBuilder<StudentPageBloc, StudentState>(
          builder: (context, state) {
            List<ProfessorModal> myProfessors = state.professorList;

            return AlertDialog(
              title: const Text("Assign Professor"),
              content: (myProfessors.isEmpty)
                  ? const Text(
                      "No Professor",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: myProfessors.map((myProfessors) {
                        return ListTile(
                          title: Text(myProfessors.name),
                          subtitle: Text(myProfessors.subject),
                          onTap: () {
                            student.professorId = myProfessors.name;
                            context.read<StudentPageBloc>().add(UpdateTOStudent(upStudent: student));
                            Navigator.pop(context, true);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                showCloseIcon: true,
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.green,
                                content: Text(
                                  "Professor Assigned..",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            );

                            // _loadStudent();
                          },
                        );
                      }).toList(),
                    ),
            );
          },
        );
      },
    );
  }

  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: searchController,
                    onChanged: (val) {
                      context.read<StudentPageBloc>().add(SearchForStudent(searchQuery: val));
                    },
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      labelText: "Search For Student",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: BlocBuilder<StudentPageBloc, StudentState>(
          /// bloc: StudentPageBloc()..add(GetToStudent()),
          builder: (context, state) {
            final students = searchController.text.isEmpty ? state.studentList : state.searchList;

            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.error.isNotEmpty) {
              return Center(child: Text(state.error));
            } else if (students.isNotEmpty) {
              return ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (context, index) {
                    StudentModal student = students[index];
                    return Card(
                      elevation: 7,
                      margin: const EdgeInsets.all(10),
                      child: Container(
                        height: 189,
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  'Name: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(student.name),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                const Text(
                                  'email: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(student.email),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Mobile: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(student.number),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Professor Name:",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(" ${student.professorId ?? 'Not Assigned'}"),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {
                                    _showEditDialog(student, context);
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    context.read<StudentPageBloc>().add(DeleteToStudent(id: student.id!));
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.person_add),
                                  onPressed: () {
                                    context.read<StudentPageBloc>().add(GetStudentByProfessor(profId: student.name));
                                    _showProfessorDialog(student, context);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return const Center(
                  child: Text(
                "No Student",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ));
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result = await Navigator.of(context).pushNamed(AddStudentPage.routeName);

            if (result == true) {
              context.read<StudentPageBloc>().add(GetToStudent());
            }
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
