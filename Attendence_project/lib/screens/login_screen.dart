import 'package:flutter/material.dart';
import 'package:flash_chat/components/roundedbutton.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'chat_screen.dart';
import 'package:flash_chat/request.dart';
import 'dart:convert';
class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth =FirebaseAuth.instance;
  bool showSpinner = false;
  String email;
  String password;
  String url;
  var data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

                 Container(
                    child: Image.asset('images/attendence.png'),
                    height: 60,
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
                  //Do something with the user input.
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your email'),

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
                  //Do something with the user input.
                },
                decoration:kTextFieldDecoration.copyWith(hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(title:'Log In',
                colour: Colors.red,onPressed:
                    () async {

                setState(() {
                  showSpinner = true;
                });
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if(user !=null){

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

              ),
              Text(
                'Not a member? Register',
                textAlign: TextAlign.center,

                style: TextStyle(

                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
