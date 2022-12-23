import 'package:fifth_exam/ui/student_page/student_page.dart';
import 'package:fifth_exam/ui/user_page/users_page.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home page")),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
            onPressed: (() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StudentPage(),
                  ));
            }),
            child: const Text("Student Firebase"),
          ),
          ElevatedButton(
            onPressed: (() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UsersPage(),
                  ));
            }),
            child: const Text("User Api"),
          )
        ],
      )),
    );
  }
}
