import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_multi_table/controller/db_controller.dart';
import 'package:sqflite_multi_table/modal/db_modal.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final DbController dbController = Provider.of<DbController>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Multi Table"),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              dbController.fetchJoinedData(value);

              print("$value");
            },
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  value: "nano pvt ltd",
                  child: Text("nano pvt ltd"),
                ),
                const PopupMenuItem(
                  value: "jb coder solution",
                  child: Text("jb coder solution"),
                ),
              ];
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Consumer<DbController>(
          builder: (context, pro, _) {
            return ListView.builder(
              itemCount: pro.allData1.length,
              itemBuilder: (ctx, index) {
                EmpModal emp = pro.allData1[index];
                return ExpansionTile(
                  title: Text(emp.name),
                  leading: Text(emp.id.toString()),
                  subtitle: Text(emp.companyName), // Display company name
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addEmployee(context, dbController);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void addEmployee(BuildContext context, DbController dbController) {
    TextEditingController nameController = TextEditingController();
    TextEditingController companyController = TextEditingController();
    EmpModal newEmp = EmpModal(id: 0, name: "", companyName: "");

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add Employee"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                onChanged: (val) {
                  newEmp.name = val;
                },
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: companyController,
                onChanged: (val) {
                  newEmp.companyName = val;
                },
                decoration: const InputDecoration(labelText: 'Company Name'),
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
                newEmp.companyName = companyController.text;
                dbController.addData1(empModal: newEmp); // Ensure this method adds data to the correct table
                Navigator.pop(context);
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }
}
