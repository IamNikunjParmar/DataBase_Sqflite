import 'package:database_multi_table_demo/utils/my_routes_utils.dart';
import 'package:database_multi_table_demo/views/screens/add_professor_page.dart';
import 'package:database_multi_table_demo/views/screens/add_student_page.dart';
import 'package:database_multi_table_demo/views/screens/home_page.dart';
import 'package:database_multi_table_demo/views/screens/professor_page.dart';
import 'package:database_multi_table_demo/views/screens/student_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: MyRoutes.home,
      routes: {
        MyRoutes.home: (context) => const HomePage(),
        MyRoutes.professorPage: (context) => const ProfessorPage(),
        MyRoutes.studentPage: (context) => const StudentPage(),
        MyRoutes.addProfessorPage: (context) => const AddProfessorPage(),
        MyRoutes.addStudentPage: (context) => const AddStudentPage(),
      },
    );
  }
}
