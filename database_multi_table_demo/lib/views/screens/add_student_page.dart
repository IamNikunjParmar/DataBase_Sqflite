import 'package:database_multi_table_demo/helper/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../modal/professor_modal.dart';
import '../../modal/student_modal.dart';

class AddStudentPage extends StatefulWidget {
  const AddStudentPage({super.key});

  @override
  State<AddStudentPage> createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  final DbHelper dbHelper = DbHelper.dbHelper;

  List<ProfessorModal> professor = [];
  List<StudentModal> student = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _intDb();
  }

  Future<void> _intDb() async {
    await dbHelper.initDb();
    _loadStudent();
  }

  Future<void> _loadStudent() async {
    student = await dbHelper.getAllStudent();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController numberController = TextEditingController();
    TextEditingController professorIdController = TextEditingController();

    String newValue = '';

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Student"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                label: Text("Name"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            const Gap(15),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                label: Text("Email"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            const Gap(15),
            TextField(
              controller: numberController,
              decoration: const InputDecoration(
                label: Text("phone Number"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            const Gap(15),
            // TextField(
            //   controller: professorIdController,
            //   decoration: const InputDecoration(
            //     label: Text("Professor Id"),
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.all(
            //         Radius.circular(10),
            //       ),
            //     ),
            //   ),
            // ),
            const Gap(25),
            ElevatedButton(
              onPressed: () async {
                if (nameController.text.isEmpty || emailController.text.isEmpty || numberController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.black,
                      showCloseIcon: true,
                      content: Text(
                        "Failed Add Student.please try again",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                } else {
                  final student = StudentModal(
                    name: nameController.text,
                    email: emailController.text,
                    number: numberController.text,
                    //professorId: int.parse(professorIdController.text),
                  );
                  await dbHelper.insertStudent(student);
                  _loadStudent();
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    showCloseIcon: true,
                    backgroundColor: Colors.green,
                    content: Text(
                      " Add Student SuccessFully",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    behavior: SnackBarBehavior.floating,
                  ));
                  Navigator.pop(context, true);
                }
              },
              child: const Text(
                "Add Student",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
