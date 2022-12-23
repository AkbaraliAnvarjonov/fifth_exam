import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fifth_exam/data/repository/student_repository.dart';
import 'package:fifth_exam/ui/home_page.dart';
import 'package:fifth_exam/view_models/student_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => StudentViewModel(
            studentRepository: StudentRepository(
                firebaseFirestore: FirebaseFirestore.instance)),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
