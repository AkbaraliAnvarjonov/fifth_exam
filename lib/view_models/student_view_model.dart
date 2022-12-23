import 'package:fifth_exam/data/model/student_model/student_model.dart';
import 'package:fifth_exam/data/repository/student_repository.dart';
import 'package:flutter/cupertino.dart';

class StudentViewModel extends ChangeNotifier {
  late final StudentRepository _studentRepository;
  List<StudentModel> studentList = [];

  StudentViewModel({required StudentRepository studentRepository}) {
    _studentRepository = studentRepository;
    listenStudents();
  }

  addStudent(StudentModel studentModel) =>
      _studentRepository.addStudent(studentModel: studentModel);

  listenStudents() async {
    _studentRepository.getStudents().listen((event) {
      studentList = event;
      print("keldi  --------------------");
      notifyListeners();
    });
  }

  deleteStudent(String id) => _studentRepository.deleteStudent(docId: id);

  updateStudent(StudentModel studentModel) =>
      _studentRepository.updateStudent(studentModel: studentModel);
}
