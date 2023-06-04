

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class PilihUploadfile extends ChangeNotifier {

  PlatformFile? pickfile;

  Future uploadfile() async {
    final path = 'file/${pickfile!.name}';
    final file = File(pickfile!.path!);
    final ref = FirebaseStorage.instance.ref().child(path);
    ref.putFile(file);
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['png','jpg']
    );
    if (result == null) return;
    pickfile = result.files.first;
   notifyListeners();
  }

  void clear(){
    pickfile = null;
    notifyListeners();
  }

}