import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'dart:io';

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({super.key});

  @override
  State<UploadImageScreen> createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Upload Image to Firebase'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            pickAndUploadImage();
          },
          child: Text('Upload Image'),
        ),
      ),
    );
  }

  Future<void> pickAndUploadImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      await uploadFile(imageFile);
    } else {
      // User canceled the picker
    }
  }

  Future<void> uploadFile(File file) async {
    try {
      firebase_storage.Reference storageRef =
          firebase_storage.FirebaseStorage.instance.ref().child('images/${DateTime.now().millisecondsSinceEpoch}');

      await storageRef.putFile(file);

      // Get the download URL
      String downloadURL = await storageRef.getDownloadURL();

      // Print the download URL to the console
      print(downloadURL);

      // Handle what to do with the download URL (e.g., save to database, show image in UI)
      // For simplicity, we're just printing it here
    } catch (e) {
      // Error uploading file
      print(e.toString());
    }
  }
}