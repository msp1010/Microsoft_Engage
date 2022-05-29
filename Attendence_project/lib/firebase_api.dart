import 'dart:io';
import 'dart:typed_data';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseApi {
  static uploadFile(String destination, File file) {
    try {
      String path = destination;
      final ref = FirebaseStorage.instance.ref().child(destination);

      return ref.putFile(file);
    } on FirebaseApi catch (e) {
      return null;
    }
  }
}

