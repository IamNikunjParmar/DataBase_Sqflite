import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_database/controller/db_controller.dart';
import 'package:sqflite_database/model/emp_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final DbController dbController = Provider.of<DbController>(context);

    TextEditingController nameController = TextEditingController();
    TextEditingController ageController = TextEditingController();

    EmployeeModel newEmployee = EmployeeModel(id: 0, name: "", age: 0);

    return Scaffold(
      appBar: AppBar(
        title: const Text("SQFLite"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Consumer<DbController>(builder: (context, pro, _) {
          return ListView.builder(
            itemCount: pro.allData.length,
            itemBuilder: (context, index) {
              EmployeeModel employee = pro.allData[index];

              return ExpansionTile(
                title: Text(employee.name),
                subtitle: Text("Age: ${employee.age}"),
                leading: Text(employee.id.toString()),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          EmployeeModel updateChangEmployee =
                              EmployeeModel(id: employee.id, name: employee.name, age: ageController.text.length);

                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("Add Employee"),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextFormField(
                                      initialValue: employee.name,
                                      //controller: nameController,
                                      onChanged: (val) {
                                        updateChangEmployee.name = val;
                                        print("${updateChangEmployee.name}----------------------------------");
                                      },
                                      decoration: const InputDecoration(labelText: 'Name'),
                                    ),
                                    TextFormField(
                                      controller: ageController,
                                      onChanged: (val) {
                                        setState(() {
                                          updateChangEmployee.age = int.tryParse(val) ?? 0;
                                        });
                                      },
                                      decoration: const InputDecoration(labelText: 'Age'),
                                      keyboardType: TextInputType.number,
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
                                      dbController.updateEmployee(employeeModel: employee);
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Add"),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          pro.deleteEmployee(employeeModel: employee);
                        },
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          TextEditingController controller = TextEditingController();

          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Add Employee"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: controller,
                      onChanged: (val) {
                        newEmployee.name = val;
                        print("ERROR:${newEmployee.name}");
                      },
                      decoration: const InputDecoration(labelText: 'Name'),
                    ),
                    TextField(
                      onChanged: (val) {
                        newEmployee.age = int.tryParse(val) ?? 0;
                      },
                      decoration: const InputDecoration(labelText: 'Age'),
                      keyboardType: TextInputType.number,
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
                      dbController.addEmployee(employeeModel: newEmployee);
                      Navigator.pop(context);
                    },
                    child: const Text("Add"),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
