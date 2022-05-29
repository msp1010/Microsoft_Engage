

import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  @override

  Widget build(BuildContext context) {
    return MaterialApp(

        home:Scaffold(
          backgroundColor: Colors.tealAccent,
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50.0,
                 backgroundImage: AssetImage('images/puja.jpg'),
                ),
          
                Text(
                  'Pujitha',
                  style:TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),

                ),
                Text(
                  'FLUTTER DEVELOPER',
                  style: TextStyle(
                    fontFamily:'Source Sans Pro',
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                    fontSize: 20.0,
                    letterSpacing: 2.5,

                  ),
                ),
                SizedBox(
                  height: 20.0,
                  width: 150.0,
                  child: Divider(
                    color: Colors.blue,
                  ),
                ),
                Card(
                  color: Colors.white,
                  margin: EdgeInsets.all(20.0),

                  child:Padding(
                    padding: const EdgeInsets.all(10.0),
                    child:  ListTile(
                      leading: Icon(

                        Icons.phone,
                        color:Colors.teal,
                      ),
                      title: Text('9353991184',
                        style:TextStyle(
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20.0,
                          color: Colors.black,



                        ),
                      ),
                    ),
                  ) ,

                ),
                Card(
                    color: Colors.white,
                    margin: EdgeInsets.all(20.0),

                    child:Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListTile(
                        leading: Icon(

                          Icons.email,
                          color:Colors.teal,
                        ),
                        title: Text('junk@gmail.com',
                          style:TextStyle(
                            fontFamily: 'Source Sans Pro',
                            fontSize: 20.0,
                            color: Colors.black,



                          ),
                        ),
                      ),
                    )
                ) ,



              ],
            ),
          ),
        )





    );
  }
}
