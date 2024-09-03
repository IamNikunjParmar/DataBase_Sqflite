import 'package:cubit_database_sqflite/home/add_student_page.dart';
import 'package:cubit_database_sqflite/home/home_page_view.dart';
import 'package:flutter/cupertino.dart';

Map<String, WidgetBuilder> get myRoutes => <String, WidgetBuilder>{
      HomePageView.routeName: HomePageView.builder,
      AddStudentPage.routeName: AddStudentPage.builder,
    };
