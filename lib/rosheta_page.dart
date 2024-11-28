import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'api_services.dart';
class RoshetaPage extends StatefulWidget {
  @override
  _RoshetaPageState createState() => _RoshetaPageState();
}

class _RoshetaPageState extends State<RoshetaPage> {
  final List<Map<String, dynamic>> roshetaList = [];  // ستخزن هذه البيانات الخاصة بكل صورة تم رفعها
  final TextEditingController titleController = TextEditingController();
  final TextEditingController termsController = TextEditingController();
  File? selectedImage;

  Future<void> pickImage(bool fromGallery) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: fromGallery ? ImageSource.gallery : ImageSource.camera,
    );

    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
    }
  }

  Future<void> uploadRosheta() async {
    if (selectedImage != null &&
        titleController.text.isNotEmpty &&
        termsController.text.isNotEmpty) {
      final imageId = await ApiService.uploadRosheta(
        title: titleController.text,
        terms: termsController.text,
        imageFile: selectedImage!,
        context: context,
      );

      if (imageId != null) {
        setState(() {
          roshetaList.add({
            'id': imageId,
            'title': titleController.text,
            'image': selectedImage!,
          });
        });
        titleController.clear();
        termsController.clear();
        selectedImage = null;
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields and select an image.')),
      );
    }
  }

  Future<void> editRosheta(String id, File currentImage) async {
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController newTermsController = TextEditingController();
        final TextEditingController newspecialController = TextEditingController();
        File? updatedImage = currentImage;

        return AlertDialog(
          title: Text('Edit Rosheta'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: newspecialController,
                decoration: InputDecoration(hintText: 'Enter new special'),
              ),
              TextField(
                controller: newTermsController,
                decoration: InputDecoration(hintText: 'Enter new terms'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  // السماح بتغيير الصورة إذا أراد المستخدم
                  final picker = ImagePicker();
                  final pickedFile = await picker.pickImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    setState(() {
                      updatedImage = File(pickedFile.path);
                    });
                  }
                },
                child: Text('Change Image'),
              ),
              if (updatedImage != null) ...[
                //SizedBox(height: 10),
                //Image.file(updatedImage!, height: 50, fit: BoxFit.cover),
              ],
            ],
          ),
          actions: [
            TextButton(
              onPressed: () async {
                final success = await ApiService.editRosheta(
                  id: id,
                  newTerms: newTermsController.text,
                  context: context,
                  title: newspecialController.text,
                  imageFile: updatedImage!, // تمرير الصورة المُحدثة
                );
                if (success) {
                  setState(() {
                    final index = roshetaList.indexWhere((item) => item['id'] == id);
                    if (index != -1) {
                      roshetaList[index]['title'] = newspecialController.text;
                      roshetaList[index]['terms'] = newTermsController.text;
                      roshetaList[index]['image'] = updatedImage;
                    }
                  });
                }
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
  Future<void> showDeleteDialog(String id, Map<String, dynamic> rosheta) async {
    final TextEditingController termsController =
    TextEditingController(text: rosheta['terms'] ?? '');
    final TextEditingController specialController =
    TextEditingController(text: rosheta['special'] ?? '');

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Rosheta'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: termsController,
                decoration: InputDecoration(labelText: 'Terms'),
              ),
              TextField(
                controller: specialController,
                decoration: InputDecoration(labelText: 'Special'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () async {
                final success = await ApiService.deleteRoshetaWithBody(
                  id: id,
                  context: context,
                  terms: termsController.text,
                  special: specialController.text,
                );

                if (success) {
                  setState(() {
                    roshetaList.removeWhere((item) => item['id'] == id);
                  });
                }

                Navigator.pop(context);
              },
              child: Text('Delete'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rosheta Management'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: roshetaList.length,
              itemBuilder: (context, index) {
                final rosheta = roshetaList[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image.file(
                        rosheta['image'],
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(rosheta['title']),
                            Text('ID: ${rosheta['id']}'),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.blue),
                        onPressed: () => editRosheta(rosheta['id'], rosheta['image']),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => showDeleteDialog(rosheta['id'], rosheta),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true, // Allow the Bottom Sheet to expand
                builder: (context) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      top: 16.0,
                      bottom: MediaQuery.of(context).viewInsets.bottom + 15.0,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: titleController,
                          decoration: InputDecoration(
                            labelText: 'Title',
                          ),
                        ),
                        TextField(
                          controller: termsController,
                          decoration: InputDecoration(
                            labelText: 'Terms',
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () => pickImage(true),
                              child: Text('Upload Image'),
                            ),
                            ElevatedButton(
                              onPressed: () => pickImage(false),
                              child: Text('Pick from Camera'),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: uploadRosheta,
                          child: Text('Upload Rosheta'),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: Text('Add Rosheta'),
          ),
        ],
      ),
    );
  }
}
