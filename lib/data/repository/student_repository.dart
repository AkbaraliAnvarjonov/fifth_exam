import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fifth_exam/data/model/student_model/student_model.dart';

class StudentRepository {
  final FirebaseFirestore _firestore;

  StudentRepository({required FirebaseFirestore firebaseFirestore})
      : _firestore = firebaseFirestore;

  Future<void> addStudent({required StudentModel studentModel}) async {
    try {
      DocumentReference newStudent =
          await _firestore.collection("students").add(studentModel.toJson());
      await _firestore.collection("students").doc(newStudent.id).update({
        "studentId": newStudent.id,
      });
    } on FirebaseException catch (er) {
      print(er.message);
    }
  }

  Stream<List<StudentModel>> getStudents() =>
      _firestore.collection("students").snapshots().map(
            (event) => event.docs
                .map((doc) => StudentModel.fromJson(doc.data()))
                .toList(),
          );

  Future<void> deleteStudent({required String docId}) async {
    try {
      await _firestore.collection("students").doc(docId).delete();
    } on FirebaseException catch (er) {
      print(er.message.toString());
    }
  }

  Future<void> updateStudent({required StudentModel studentModel}) async {
    try {
      await _firestore
          .collection("students")
          .doc(studentModel.studentId)
          .update(studentModel.toJson());
    } on FirebaseException catch (er) {
      print(er.message.toString());
    }
  }
}
