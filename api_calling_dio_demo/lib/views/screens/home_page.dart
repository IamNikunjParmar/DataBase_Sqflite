import 'package:api_calling_dio_demo/helper/api_helper.dart';
import 'package:api_calling_dio_demo/modal/api_modal.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiHelper apiHelper = ApiHelper.apiHelper;

  final dio = Dio();

  ApiModal? apiModal;
  List<ApiModal> allData = [];
  bool isLoading = true;

  TextEditingController contentController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Future<void> addUser() async {
    String content = contentController.text;
    String email = emailController.text;

    if (content.isEmpty || email.isEmpty) return;
    try {
      ApiModal newUser = await apiHelper.postData(content, email);

      setState(() {
        allData.add(newUser);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Add User SuccessFully"),
          backgroundColor: Colors.green,
          showCloseIcon: true,
        ),
      );

      emailController.clear();
      contentController.clear();
    } catch (e) {
      print("Error for POST:$e");

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Failed User try again"),
          backgroundColor: Colors.red,
          showCloseIcon: true,
        ),
      );
    }
  }

  Future<void> updateUser(int id, index) async {
    String content = contentController.text;
    String email = emailController.text;

    if (content.isEmpty || email.isEmpty) return;
    try {
      ApiModal newUpdateUser = await apiHelper.putData(id, content: content, email: email);

      setState(() {
        allData[index] = newUpdateUser;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("User Update SuccessFully"),
          backgroundColor: Colors.green,
          showCloseIcon: true,
        ),
      );

      contentController.clear();
      emailController.clear();
    } catch (e) {
      print("Error for Put Data :$e=======================");

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Update User Failed"),
          backgroundColor: Colors.red,
          showCloseIcon: true,
        ),
      );
    }
  }

  Future<void> getMyData() async {
    try {
      allData = await apiHelper.getData();
    } catch (e) {
      print("Error++++++++++++++++++++++++++++++++:$e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> deleteUser(int id, int index) async {
    try {
      await apiHelper.deleteData(id);

      setState(() {
        allData.removeAt(index);
      });
    } catch (e) {
      print("DELETE ERROR:$e");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMyData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api for Dio"),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(18),
              child: ListView.builder(
                  itemCount: allData.length,
                  itemBuilder: (ctx, index) {
                    ApiModal apiModal = allData[index];

                    return Card(
                      elevation: 5,
                      margin: const EdgeInsets.all(8),
                      child: ListTile(
                        title: Text(apiModal.content),
                        leading: CircleAvatar(
                          child: Text("${index + 1}".toString()),
                        ),
                        subtitle: Text(apiModal.email),
                        trailing: Wrap(
                          spacing: 20,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Text("Update User"),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              TextField(
                                                controller: contentController,
                                                textInputAction: TextInputAction.next,
                                                decoration: const InputDecoration(
                                                  label: Text("content"),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              TextField(
                                                controller: emailController,
                                                textInputAction: TextInputAction.done,
                                                decoration: const InputDecoration(
                                                  label: Text("Email"),
                                                ),
                                              ),
                                            ],
                                          ),
                                          actions: [
                                            ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  updateUser(apiModal.id, index);
                                                  Navigator.pop(context);
                                                });
                                              },
                                              child: const Text("Update"),
                                            ),
                                          ],
                                        );
                                      });
                                });
                              },
                              child: const Icon(Icons.edit),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  deleteUser(apiModal.id, index);
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    behavior: SnackBarBehavior.fixed,
                                    showCloseIcon: true,
                                    backgroundColor: Colors.red,
                                    content: Text("User Deleted"),
                                  ),
                                );
                              },
                              child: const Icon(Icons.delete),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Add User"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        textInputAction: TextInputAction.next,
                        controller: contentController,
                        decoration: const InputDecoration(
                          label: Text("Content"),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        textInputAction: TextInputAction.done,
                        controller: emailController,
                        decoration: const InputDecoration(
                          label: Text("Email"),
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          addUser();
                          Navigator.pop(context);
                        });
                      },
                      child: const Text("Add"),
                    ),
                  ],
                );
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
