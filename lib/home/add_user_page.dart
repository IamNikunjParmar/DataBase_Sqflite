// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gap/gap.dart';
//
// import 'home_page_cubit.dart';
//
// class AddUserPage extends StatelessWidget {
//   const AddUserPage({super.key});
//
//   static const String routeName = 'add_user_page';
//
//   static Widget builder(BuildContext context) {
//     return BlocProvider(
//       create: (_) => HomePageCubit(),
//       child: const AddUserPage(),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final nameController = TextEditingController();
//     final emailController = TextEditingController();
//     final ageController = TextEditingController();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add User (Simple)'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: nameController,
//               decoration: const InputDecoration(labelText: 'Name'),
//             ),
//             const Gap(16),
//             TextField(
//               controller: emailController,
//               decoration: const InputDecoration(labelText: 'Email'),
//             ),
//             const Gap(16),
//             TextField(
//               controller: ageController,
//               decoration: const InputDecoration(labelText: 'Age'),
//               keyboardType: TextInputType.number,
//             ),
//             const Gap(32),
//             ElevatedButton(
//               onPressed: () {
//                 //  context.read<HomePageCubit>().addUser(context, "viki", "email", 12);
//               },
//               child: const Text('Add'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
