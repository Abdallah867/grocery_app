// import 'package:appwrite/appwrite.dart';
// import 'package:appwrite/models.dart' as models;
// import 'package:flutter/material.dart';

// class MyForm extends StatefulWidget {
//   final Account account;

//   MyForm({required this.account});

//   @override
//   MyFormState createState() {
//     return MyFormState();
//   }
// }

// class MyFormState extends State<MyForm> {
//   models.User? loggedInUser;
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController nameController = TextEditingController();

//   Future<void> login(String email, String password) async {
//     await widget.account.createEmailSession(email: email, password: password);
//     final user = await widget.account.get();
//     setState(() {
//       loggedInUser = user;
//     });
//   }

//   Future<void> register(String email, String password, String name) async {
//     await widget.account.create(
//         userId: ID.unique(), email: email, password: password, name: name);
//     await login(email, password);
//   }

//   Future<void> logout() async {
//     await widget.account.deleteSession(sessionId: 'current');
//     setState(() {
//       loggedInUser = null;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Text(loggedInUser != null
//               ? 'Logged in as ${loggedInUser!.name}'
//               : 'Not logged in'),
//           SizedBox(height: 16.0),
//           TextField(
//             controller: emailController,
//             decoration: InputDecoration(labelText: 'Email'),
//           ),
//           SizedBox(height: 16.0),
//           TextField(
//             controller: passwordController,
//             decoration: InputDecoration(labelText: 'Password'),
//             obscureText: true,
//           ),
//           SizedBox(height: 16.0),
//           TextField(
//             controller: nameController,
//             decoration: InputDecoration(labelText: 'Name'),
//           ),
//           SizedBox(height: 16.0),
//           ElevatedButton(
//             onPressed: () {
//               login(emailController.text, passwordController.text);
//             },
//             child: Text('Login'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               register(emailController.text, passwordController.text,
//                   nameController.text);
//             },
//             child: Text('Register'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               logout();
//             },
//             child: Text('Logout'),
//           ),
//         ],
//       ),
//     );
//   }
// }
