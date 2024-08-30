import 'package:bloc_database_multi_table/HomePage/home_page_view.dart';
import 'package:bloc_database_multi_table/professorPage/add_professor_page.dart';
import 'package:bloc_database_multi_table/professorPage/professor_page_viiew.dart';
import 'package:bloc_database_multi_table/student/add_student_page.dart';
import 'package:bloc_database_multi_table/student/student_page_view.dart';
import 'package:flutter/cupertino.dart';

Map<String, WidgetBuilder> get myRoute => <String, WidgetBuilder>{
      HomePageView.routeName: HomePageView.builder,
      ProfessorPageView.routeName: ProfessorPageView.builder,
      StudentPageView.routeName: StudentPageView.builder,
      AddProfessorPage.routeName: AddProfessorPage.builder,
      AddStudentPage.routeName: AddStudentPage.builder,
    };
