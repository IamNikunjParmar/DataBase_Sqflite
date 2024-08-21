import 'package:database_multi_table_demo/helper/db_helper.dart';
import 'package:database_multi_table_demo/modal/professor_modal.dart';
import 'package:database_multi_table_demo/modal/student_modal.dart';
import 'package:database_multi_table_demo/utils/my_routes_utils.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddProfessorPage extends StatefulWidget {
  const AddProfessorPage({super.key});

  @override
  State<AddProfessorPage> createState() => _AddProfessorPageState();
}

class _AddProfessorPageState extends State<AddProfessorPage> {
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
    _loadProfessor();
  }

  void _loadProfessor() async {
    professor = await dbHelper.getAllProfessor();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController subjectController = TextEditingController();
    TextEditingController numberController = TextEditingController();

    String newValue = '';

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Professor"),
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
              controller: subjectController,
              decoration: const InputDecoration(
                label: Text("Subject"),
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
            const Gap(25),
            ElevatedButton(
              onPressed: () async {
                if (nameController.text.isEmpty || subjectController.text.isEmpty || numberController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.black,
                      content: Text(
                        "Failed Add Professor.please try again",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                } else {
                  final professor = ProfessorModal(
                    name: nameController.text,
                    subject: subjectController.text,
                    number: numberController.text,
                  );
                  await dbHelper.insertProfessor(professor);
                  _loadProfessor();
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: Colors.black,
                    content: Text(
                      " Add Professor SuccessFully",
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
                "Add Professor",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
