import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AddPost extends StatefulWidget {
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final TextEditingController useridController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController usercompanyController = TextEditingController();
  XFile? selectedImage; // Holds the selected image file

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        selectedImage = XFile(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 23, 45),
      appBar: AppBar(
        backgroundColor: const Color(0xFF001F3F),
        title: const Text('Add New Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                height: 300,
                width: double.infinity,
                color: const Color.fromARGB(83, 158, 158, 158),
                child: selectedImage == null
                    ? const Center(
                        child: Text(
                          'Tap to add image',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    : Image.file(
                        File(selectedImage!.path),
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            const SizedBox(height: 10),
            // TextField(
            //   controller: useridController,
            //   style: const TextStyle(color: Colors.white),
            //   decoration: const InputDecoration(
            //     labelText: 'User ID',
            //     labelStyle: TextStyle(color: Colors.white),
            //   ),
            // ),
            // const SizedBox(height: 10),
            // TextField(
            //   controller: usernameController,
            //   style: const TextStyle(color: Colors.white),
            //   decoration: const InputDecoration(
            //     labelText: 'Username',
            //     labelStyle: TextStyle(color: Colors.white),
            //   ),
            // ),
            const SizedBox(height: 10),
            TextField(
              controller: titleController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Title',
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: descriptionController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Description',
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: usercompanyController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'User Company',
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _submitForm(context);
              },
              child: const Text('Post'),
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm(BuildContext context) async {
    try {
      String imageUrl = '';

      if (selectedImage != null) {
        
        final firebase_storage.Reference storageReference = firebase_storage.FirebaseStorage.instance
            .ref()
            .child('post_images/${DateTime.now().millisecondsSinceEpoch}.jpg');

        final firebase_storage.UploadTask uploadTask = storageReference.putFile(
          File(selectedImage!.path),
        );

        await uploadTask.whenComplete(() async {
          imageUrl = await storageReference.getDownloadURL();
        });
      }

      await FirebaseFirestore.instance.collection('posts').add({
        'title': titleController.text,
        'description': descriptionController.text,
        'usercompany': usercompanyController.text,
        'imageUrl': imageUrl,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Posted successfully!'),
        ),
      );

      titleController.clear();
      descriptionController.clear();
      usercompanyController.clear();
      setState(() {
        selectedImage = null;
      });
    } catch (e) {
      print('Error submitting form: $e');
    }
  }

}
