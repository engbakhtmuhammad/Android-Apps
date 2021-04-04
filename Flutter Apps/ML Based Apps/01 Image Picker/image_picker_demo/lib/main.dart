import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart' as ImagePickers;

void main() {
  runApp(MaterialApp(
    home: ImagePicker(),
  ));
}

class ImagePicker extends StatefulWidget {
  @override
  _ImagePickerState createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  File _image;
  ImagePickers.ImagePicker imagePicker;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imagePicker = ImagePickers.ImagePicker();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Picker"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image != null ? Image.file(_image,height: 200,width: 200,):Icon(Icons.image,size: 100,),
            RaisedButton(
              child: Text("Choose/Capture"),
              onPressed: _chooseFromGallary
            )
          ],
        ),
      ),
    );
  }

  Future<void> _chooseFromGallary() async {
    ImagePickers.PickedFile pickedFile = await imagePicker.getImage(
        source: ImagePickers.ImageSource.gallery);
    setState(() {
      _image = File(pickedFile.path);
    });
  }
}
