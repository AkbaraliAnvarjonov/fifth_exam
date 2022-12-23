import 'package:fifth_exam/data/model/student_model/student_model.dart';
import 'package:fifth_exam/ui/student_page/add_student.dart';
import 'package:fifth_exam/ui/student_page/update_page.dart';
import 'package:fifth_exam/view_models/student_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentPage extends StatelessWidget {
  const StudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//  List<CategoryModel> categories = [];
      appBar: AppBar(
        title: const Text("Student Page"),
        actions: [
          IconButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddStudentPage(),
                  )),
              icon: const Icon(Icons.add))
        ],
      ),
      body: Consumer<StudentViewModel>(
        builder: (context, viewModel, child) {
          StudentModel studentModel;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: viewModel.studentList.length,
              itemBuilder: (context, index) {
                studentModel = viewModel.studentList[index];
                return viewModel.studentList.isNotEmpty
                    ? SizedBox(
                        height: 65,
                        child: Row(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image:
                                          NetworkImage(studentModel.imageUrl),
                                      fit: BoxFit.cover)),
                            ),
                            const SizedBox(width: 8),
                            Text(studentModel.studentName),
                            const Spacer(),
                            IconButton(
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        UpdatePage(studentModel: studentModel),
                                  )),
                              icon: const Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () => Provider.of<StudentViewModel>(
                                      context,
                                      listen: false)
                                  .deleteStudent(studentModel.studentId),
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ))
                    : const Center(
                        child: CircularProgressIndicator(),
                      );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 8),
            ),
          );
        },
      ),
    );
  }
}
