import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/chat_screen.dart';
import 'request.dart';
import 'dart:async';
import 'package:flutter/services.dart';




import 'screens/login_screen.dart';

import 'screens/registration_screen.dart';
import 'screens/welcome_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();




  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute:WelcomeScreen.id ,
      routes: {
        WelcomeScreen.id:(context) => WelcomeScreen(),
        LoginScreen.id:(context)=> LoginScreen(),
        RegistrationScreen.id:(context) => RegistrationScreen(),
        ChatScreen.id:(context) => ChatScreen(),
      },
    );
  }
}
