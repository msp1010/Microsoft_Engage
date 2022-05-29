import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {

   ButtonWidget({

     this.icon,
     this.title,
     this.onPressed,
  });

   final IconData icon;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: Color.fromRGBO(29, 194, 95, 1),
      minimumSize: Size.fromHeight(50),
    ),
    child: buildContent(),
    onPressed: onPressed,
  );

  Widget buildContent() => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(icon, size: 28),
      SizedBox(width: 16),
      Text(
        title,
        style: TextStyle(fontSize: 22, color: Colors.white),
      ),
    ],
  );
}