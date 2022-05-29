import 'dart:convert';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flash_chat/components/Button_widget.dart';

import 'chat_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/components/roundedbutton.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flash_chat/storage_service.dart';
import 'package:http/http.dart' as http;

import 'dart:io';
import 'package:path/path.dart';
import 'package:flash_chat/firebase_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final _sigInFormKey = GlobalKey<FormState>();
class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  StorageUploadTask task ;
  File file;
  String url;

  final _auth =FirebaseAuth.instance;
  bool showSpinner =  false;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {

    final fileName = file != null ? basename(file .path) : 'No File Selected';


    return Scaffold(
      backgroundColor: Colors.black38,
      body:ModalProgressHUD(
        inAsyncCall: showSpinner,
        child:
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 60.0,
                    child: Image.asset('images/attendence.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  color:  Colors.white,
                ),
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email =value;
                },
                decoration:kTextFieldDecoration.copyWith(hintText: 'Enter your email'
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                style:TextStyle(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,


                onChanged: (value) {
                  password = value;
                },
                decoration:kTextFieldDecoration.copyWith(hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 24.0,
              ),
             ButtonWidget(title: 'select file',
                 icon:Icons.attach_file,

                 onPressed: ()async {
               final results = await FilePicker.platform.pickFiles(
                 allowMultiple: false,
                 type: FileType.custom,
                 allowedExtensions: ['png', 'jpg'],
               );
               if (results == null) return;


               final path = results.files.single.path;

               setState(() => file = File(path));
             }),
              SizedBox(height: 10),
              Text(
                fileName,
                style: TextStyle(color:Colors.white,fontSize: 16, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 10),
             ButtonWidget(
               title: 'upload photo',icon:Icons.cloud_upload_outlined ,onPressed: ()async{

               if (file == null) return;

               final fileName = basename(file.path);
               final destination = 'text/$fileName';

               task = FirebaseApi.uploadFile(destination, file);
               setState(() {});




             },
             ),



             SizedBox(
               height: 10,
             ),


             RoundedButton(title:'Register',colour: Colors.red,onPressed: () async {



               setState(() {
                 showSpinner = true;
               });



                try {
                 final newUser = await _auth.createUserWithEmailAndPassword(
                     email: email, password: password);
                 if(newUser !=null){
                   Navigator.pushNamed(context, ChatScreen.id);

                 }
                 setState(() {
                   showSpinner = false;
                 });
               }
               catch (e) {
                 print(e);
               }
             },
                )



            ],
          ),
        ),
      ),
    );
  }
}
