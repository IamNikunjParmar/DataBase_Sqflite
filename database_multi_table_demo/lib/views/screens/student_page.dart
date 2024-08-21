import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../helper/db_helper.dart';
import '../../modal/professor_modal.dart';
import '../../modal/student_modal.dart';
import '../../utils/my_routes_utils.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({super.key});

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  final DbHelper dbHelper = DbHelper.dbHelper;

  List<ProfessorModal> professors = [];
  List<StudentModal> students = [];
  List<StudentModal> filteredStudents = [];

  @override
  void initState() {
    super.initState();
    _initDb();
  }

  Future<void> _initDb() async {
    await dbHelper.initDb();
    _loadStudent();
    _loadProfessors();
  }

  Future<void> _loadStudent() async {
    List<StudentModal> data = await dbHelper.getAllStudent();
    setState(() {
      students = data;
    });
  }

  Future<void> _loadProfessors() async {
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
  }

  void _showProfessorDialog(StudentModal student) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Assign Professor"),
          content: (professors.isEmpty)
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
                  children: professors.map((professor) {
                    return ListTile(
                      title: Text(professor.name),
                      onTap: () {
                        student.professorId = professor.name;
                        dbHelper.updateStudent(student);
                        Navigator.pop(context);
                        _loadStudent();
                      },
                    );
                  }).toList(),
                ),
        );
      },
    );
  }

  void _showEditDialog(StudentModal student) {
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
                dbHelper.updateStudent(student);
                Navigator.pop(context);
                _loadStudent();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    showCloseIcon: true,
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.green,
                    content: Text("Update done.."),
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

  void _deleteStudent(StudentModal student) {
    dbHelper.deleteStudent(student.id!);
    _loadStudent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () {
          return _loadStudent();
        },
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (ctx, index) {
                    final student = students[index];
                    return Card(
                      elevation: 5,
                      margin: const EdgeInsets.all(10),
                      shadowColor: Colors.grey,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        height: 230,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              student.name,
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Gap(10),
                            Text(
                              "Email: ${student.email}",
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const Gap(10),
                            Text(
                              "Mobile: ${student.number}",
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const Gap(10),
                            Text(
                              "Professor Name: ${student.professorId ?? 'Not Assigned'}",
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const Gap(10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {
                                    _showEditDialog(student);
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    _deleteStudent(student);
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.person_add),
                                  onPressed: () {
                                    _showProfessorDialog(student);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var result = await Navigator.of(context).pushNamed(MyRoutes.addStudentPage);
          setState(() {
            if (result == true) {
              _loadStudent();
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
