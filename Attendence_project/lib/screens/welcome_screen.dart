import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:flash_chat/components/roundedbutton.dart';


class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>{



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                   Hero(
                     tag: 'attendence',
                     child:Container(

                    child: Image.asset('images/attendence.png'),
                       alignment: Alignment.center,
                    padding:EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
                    height:150 ,
                  ),
                   ),



                   Text('Roll_In',
                  textAlign: TextAlign.center,
                  style: TextStyle(

                    fontFamily: 'Pacifico',
                    color: Colors.redAccent,
                    fontSize: 45.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),

            RoundedButton(title: 'Log In',colour: Colors.lightBlueAccent,onPressed: () {
              Navigator.pushNamed(context, LoginScreen.id);
            },
            ),
            RoundedButton(title: 'Register',colour: Colors.blue,onPressed: () {
              Navigator.pushNamed(context, RegistrationScreen.id);
            },
            ),

          ],
        ),
      ),
    );
  }
}

