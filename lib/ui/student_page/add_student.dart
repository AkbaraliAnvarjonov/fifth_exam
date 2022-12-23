import 'package:fifth_exam/data/model/student_model/student_model.dart';
import 'package:fifth_exam/data/services/upload/uploader.dart';
import 'package:fifth_exam/view_models/student_view_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddStudentPage extends StatefulWidget {
  const AddStudentPage({super.key});

  @override
  State<AddStudentPage> createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  TextEditingController nameController = TextEditingController();
  ImagePicker imagePicker = ImagePicker();
  String imageUrl = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Student")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              textInputAction: TextInputAction.next,
              style: const TextStyle(fontSize: 17),
              validator: (name) =>
                  name != null && name.length < 3 ? "Enter valid name" : null,
              decoration: const InputDecoration(label: Text("name")),
            ),
            const SizedBox(height: 10),
            imageUrl.isEmpty
                ? ElevatedButton(
                    onPressed: () => showPicker(context),
                    child: const Text("Choose Image"))
                : Image.network(
                    imageUrl,
                    height: 100,
                    width: 100,
                  ),
            const SizedBox(height: 12),
            ElevatedButton(
                onPressed: () {
                  if (imageUrl.isNotEmpty) {
                    StudentModel studentModel = StudentModel(
                        imageUrl: imageUrl,
                        studentId: "",
                        studentName: nameController.text);
                    Provider.of<StudentViewModel>(context, listen: false)
                        .addStudent(studentModel);
                    Navigator.pop(context);
                  }
                },
                child: const Text("Add"))
          ],
        ),
      ),
    );
  }

  void showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text("Gallery"),
                    onTap: () {
                      _getFromGallery();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    _getFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  _getFromGallery() async {
    final XFile? pickedFile = await imagePicker.pickImage(
      maxWidth: 1920,
      maxHeight: 2000,
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      if (!mounted) return;
      setState(() {});
      if (!mounted) return;
      imageUrl = await FileUploader.imageUploader(pickedFile);
      if (!mounted) return;
      setState(() {});
    }
  }

  _getFromCamera() async {
    final XFile? pickedFile = await imagePicker.pickImage(
      maxWidth: 1920,
      maxHeight: 2000,
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      if (!mounted) return;
      imageUrl = await FileUploader.imageUploader(pickedFile);
      if (!mounted) return;
      setState(() {});
    }
  }
}
