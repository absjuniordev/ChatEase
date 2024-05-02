import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  final void Function(File image) onImagePicker;
  const UserImagePicker({
    super.key,
    required this.onImagePicker,
  });

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _image;

  Future<void> _pickedImage() async {
    final piker = ImagePicker();
    final pikedImage = await piker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      maxWidth: 150,
    );
    if (pikedImage != null) {
      setState(() {
        _image = File(pikedImage.path);
      });
    }
    widget.onImagePicker(_image!);
  }

  Future<void> _pickedCamera() async {
    final piker = ImagePicker();
    final pikedImage = await piker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxWidth: 150,
    );
    if (pikedImage != null) {
      setState(() {
        _image = File(pikedImage.path);
      });
    }
    widget.onImagePicker(_image!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: _image != null ? FileImage(_image!) : null,
          radius: 40,
          backgroundColor: Colors.grey,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: _pickedCamera,
              child: const Row(
                children: [
                  Icon(Icons.camera),
                  Text("Foto"),
                ],
              ),
            ),
            TextButton(
              onPressed: _pickedImage,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.image),
                  Text("Galeria"),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
