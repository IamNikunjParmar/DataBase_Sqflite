import 'package:bloc_database_multi_table/HomePage/home_page_view.dart';
import 'package:bloc_database_multi_table/professorPage/professor_bloc.dart';
import 'package:bloc_database_multi_table/professorPage/professor_event.dart';
import 'package:bloc_database_multi_table/repo/professor_repo.dart';
import 'package:bloc_database_multi_table/student/student_page_bloc.dart';
import 'package:bloc_database_multi_table/student/student_page_event.dart';
import 'package:bloc_database_multi_table/utils/my_routes_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ProfessorRepo.professorRepo.initDb();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ProfessorBloc()..add(GetProfessor())),
          BlocProvider(create: (context) => StudentPageBloc()..add(GetToStudent())),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
          ),
          routes: myRoute,
          initialRoute: HomePageView.routeName,
        ));
  }
}
