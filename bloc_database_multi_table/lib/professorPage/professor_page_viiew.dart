import 'package:bloc_database_multi_table/modal/professor_modal.dart';
import 'package:bloc_database_multi_table/modal/student_modal.dart';
import 'package:bloc_database_multi_table/professorPage/add_professor_page.dart';
import 'package:bloc_database_multi_table/professorPage/professor_bloc.dart';
import 'package:bloc_database_multi_table/professorPage/professor_event.dart';
import 'package:bloc_database_multi_table/professorPage/professor_state.dart';
import 'package:bloc_database_multi_table/repo/professor_repo.dart';
import 'package:bloc_database_multi_table/student/student_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfessorPageView extends StatefulWidget {
  const ProfessorPageView({super.key});

  static const String routeName = 'professor_page_view';

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfessorBloc()..add(GetProfessor()),
      child: const ProfessorPageView(),
    );
  }

  @override
  State<ProfessorPageView> createState() => _ProfessorPageViewState();
}

class _ProfessorPageViewState extends State<ProfessorPageView> {
  void _showStudentListDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return BlocBuilder<ProfessorBloc, ProfessorState>(
          builder: (context, state) {
            List<StudentModal> myStudent = state.filterStudentList;

            print("${myStudent.length}==+++++++++++++++++++");

            return AlertDialog(
              title: const Text("Assigned Students List"),
              content: SizedBox(
                width: double.maxFinite,
                child: (myStudent.isEmpty)
                    ? const Text(
                        "No Assign student",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: myStudent.length,
                        itemBuilder: (ctx, index) {
                          final student = myStudent[index];
                          return ListTile(
                            title: Text(student.name),
                            subtitle: Text("Email: ${student.email}"),
                          );
                        },
                      ),
              ),
              actions: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Close"),
                ),
              ],
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
                      context.read<ProfessorBloc>().add(SearchForProfessor(searchQuery: val));
                    },
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      labelText: "Search For Professor",
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
        body: BlocBuilder<ProfessorBloc, ProfessorState>(
          builder: (context, state) {
            final professors = searchController.text.isEmpty ? state.professorList : state.searchList;

            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.error.isNotEmpty) {
              return Text(state.error);
            } else if (professors.isNotEmpty) {
              return ListView.builder(
                  itemCount: professors.length,
                  itemBuilder: (ctx, index) {
                    ProfessorModal myProf = professors[index];
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: Card(
                        elevation: 5,
                        child: Container(
                          height: 115,
                          // alignment: Alignment.center,
                          padding: const EdgeInsets.all(16),
                          child: InkWell(
                            onTap: () {
                              context.read<ProfessorBloc>().add(FilterStudentByProfessor(student: myProf.name));
                              _showStudentListDialog();
                            },
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
                                    Text(myProf.name),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      'Subject: ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(myProf.subject),
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
                                    Text(myProf.number),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            } else {
              return const Center(
                  child: Text(
                "No Professor",
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
            final result = await Navigator.of(context).pushNamed(AddProfessorPage.routeName);

            if (result == true) {
              context.read<ProfessorBloc>().add(GetProfessor());
            }
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
