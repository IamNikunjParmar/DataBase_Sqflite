import 'package:database_multi_table_demo/helper/db_helper.dart';
import 'package:database_multi_table_demo/modal/professor_modal.dart';
import 'package:database_multi_table_demo/utils/my_routes_utils.dart';
import 'package:database_multi_table_demo/views/screens/professor_page.dart';
import 'package:database_multi_table_demo/views/screens/student_page.dart';
import 'package:flutter/material.dart';

import '../../modal/student_modal.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController tabController;
  final DbHelper dbHelper = DbHelper.dbHelper;

  List<ProfessorModal> professors = [];
  List<StudentModal> students = [];
  List<StudentModal> filteredStudents = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initDb();
    tabController = TabController(length: 2, vsync: this);
  }

  Future<void> _initDb() async {
    await dbHelper.initDb();
    _loadProfessor();
    _loadStudent();
    setState(() {});
  }

  void _loadProfessor() async {
    List<ProfessorModal> data = await dbHelper.getAllProfessor();
    setState(() {
      professors = data;
    });
  }

  void _loadStudent() async {
    List<StudentModal> data = await dbHelper.getAllStudent();
    setState(() {
      students = data;
    });
  }

  void _filterStudentsByProfessor(String profId) async {
    filteredStudents = await dbHelper.getStudentByProfessor(profId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select your role"),
        centerTitle: true,
        bottom: TabBar(
          controller: tabController,
          tabs: const [
            Tab(
              text: 'Professor',
            ),
            Tab(
              text: 'student',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          ProfessorPage(),
          StudentPage(),
        ],
      ),
    );
  }
}
