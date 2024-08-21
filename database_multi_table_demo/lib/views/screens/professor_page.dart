import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../helper/db_helper.dart';
import '../../modal/professor_modal.dart';
import '../../modal/student_modal.dart';
import '../../utils/my_routes_utils.dart';

class ProfessorPage extends StatefulWidget {
  const ProfessorPage({super.key});

  @override
  State<ProfessorPage> createState() => _ProfessorPageState();
}

class _ProfessorPageState extends State<ProfessorPage> {
  final DbHelper dbHelper = DbHelper.dbHelper;

  List<ProfessorModal> professors = [];
  List<StudentModal> filteredStudents = [];

  @override
  void initState() {
    super.initState();
    _initDb();
  }

  Future<void> _initDb() async {
    await dbHelper.initDb();
    _loadProfessor();
  }

  Future<void> _loadProfessor() async {
    List<ProfessorModal> data = await dbHelper.getAllProfessor();
    setState(() {
      professors = data;
    });
  }

  void _filterStudentsByProfessor(String profId) async {
    List<StudentModal> data = await dbHelper.getStudentByProfessor(profId);
    setState(() {
      filteredStudents = data;
    });
    _showStudentListDialog();
  }

  void _showStudentListDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Assigned Students List"),
          content: SizedBox(
            width: double.maxFinite,
            child: (filteredStudents.isEmpty)
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
                    itemCount: filteredStudents.length,
                    itemBuilder: (ctx, index) {
                      final student = filteredStudents[index];
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () {
          return _loadProfessor();
        },
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: professors.length,
                itemBuilder: (ctx, index) {
                  final professor = professors[index];
                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.all(10),
                    shadowColor: Colors.grey,
                    child: InkWell(
                      onTap: () {
                        _filterStudentsByProfessor(professor.name);
                      },
                      child: Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20),
                            height: 150,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  professor.name,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Gap(10),
                                Text(
                                  "Subject: ${professor.subject}",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const Gap(10),
                                Text(
                                  "Mobile: ${professor.number}",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var result = await Navigator.of(context).pushNamed(MyRoutes.addProfessorPage);
          setState(() {
            if (result == true) {
              _loadProfessor();
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
