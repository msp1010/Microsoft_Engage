import 'package:flutter/material.dart';
class RoundedButton extends StatelessWidget {
  RoundedButton({this.colour,this.icon,this.onPressed,@required this.title});
  final Color colour;
  final String title;
  final Function onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,

        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed:onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,
            style: TextStyle(
            color:Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}