import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class FileUploader {
  static Future<String> imageUploader(XFile xFile) async {
    String downloadUrl = "";
    final storageReference = FirebaseStorage.instance.ref();
    var imageRef = storageReference.child("images/student/${xFile.name}");
    await imageRef.putFile(File(xFile.path));
    downloadUrl = await imageRef.getDownloadURL();
    return downloadUrl;
  }
}