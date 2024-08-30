import 'package:bloc_database_multi_table/professorPage/professor_page_viiew.dart';
import 'package:bloc_database_multi_table/student/student_page_view.dart';
import 'package:flutter/material.dart';

class HomePageView extends StatefulWidget {
  HomePageView({super.key});

  static const String routeName = "/home_page_view";

  static Widget builder(BuildContext context) {
    return HomePageView();
  }

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: true,
        bottom: TabBar(
          controller: tabController,
          tabs: const [
            Tab(
              text: "Professor",
            ),
            Tab(
              text: "Student",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          const ProfessorPageView(),
          StudentPageView(),
        ],
      ),
    );
  }
}
