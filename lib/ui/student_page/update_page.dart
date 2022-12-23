import 'package:fifth_exam/data/model/student_model/student_model.dart';
import 'package:fifth_exam/data/services/upload/uploader.dart';
import 'package:fifth_exam/view_models/student_view_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class UpdatePage extends StatefulWidget {
  StudentModel studentModel;
  UpdatePage({super.key, required this.studentModel});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  ImagePicker imagePicker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Update Page")),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(children: [
          TextFormField(
            onChanged: (value) => widget.studentModel.studentName = value,
            initialValue: widget.studentModel.studentName,
            textInputAction: TextInputAction.next,
            style: const TextStyle(fontSize: 17),
            validator: (name) =>
                name != null && name.length < 3 ? "Enter valid name" : null,
            decoration: const InputDecoration(label: Text("Name")),
          ),
          const SizedBox(height: 12),
          Image.network(
            widget.studentModel.imageUrl,
            height: 100,
            width: 100,
          ),
          const SizedBox(height: 12),
          ElevatedButton(
              onPressed: () => showPicker(context),
              child: const Text("Choose another image")),
          const SizedBox(height: 12),
          ElevatedButton(
              onPressed: () {
                StudentModel studentModel = StudentModel(
                    imageUrl: widget.studentModel.imageUrl,
                    studentId: widget.studentModel.studentId,
                    studentName: widget.studentModel.studentName);
                Provider.of<StudentViewModel>(context, listen: false)
                    .updateStudent(studentModel);
                Navigator.pop(context);
              },
              child: const Text("Update"))
        ]),
      )),
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
      widget.studentModel.imageUrl =
          await FileUploader.imageUploader(pickedFile);
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
      widget.studentModel.imageUrl =
          await FileUploader.imageUploader(pickedFile);
      if (!mounted) return;
      setState(() {});
    }
  }
}
