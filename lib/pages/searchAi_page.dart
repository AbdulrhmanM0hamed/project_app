import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AiScanning extends StatefulWidget {
  @override
  _AiScanningState createState() => _AiScanningState();
}

class _AiScanningState extends State<AiScanning> {
  File? _image;
  String? _diseaseStatus;
  bool _isLoading = false;

  Future<void> _getImageFromGallery() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _diseaseStatus = null;
        _isLoading = true;
        // في الواقع يجب هنا استدعاء الخوارزمية أو API لتحليل الصورة والحصول على التشخيص
        // هنا نفترض أنه تم الحصول على تشخيص مزيف لأغراض التوضيح
        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            _isLoading = false;
            _diseaseStatus = 'Skin rash'; // تشخيص مزيف لأغراض التوضيح
          });
        });
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      "AI Scanning",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      GestureDetector(
                        onTap: _isLoading ? null : _getImageFromGallery,
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: _isLoading
                              ? CircularProgressIndicator() // عرض دائرة التحميل أثناء التحليل
                              : (_image != null
                                  ? Image.file(_image!, fit: BoxFit.cover)
                                  : Icon(Icons.image,
                                      size: 100, color: Colors.grey)),
                        ),
                      ),
                      if (_isLoading)
                        CircularProgressIndicator() // عرض دائرة التحميل على كامل الشاشة
                      else if (_diseaseStatus != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 300),
                          child: Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'Disease Status: $_diseaseStatus',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.all(100),
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _getImageFromGallery,
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 69, 142, 231),
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text('Select Image', style: TextStyle(fontSize: 20)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
