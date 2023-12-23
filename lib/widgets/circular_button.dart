import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';

class CircularButton extends StatefulWidget {
  const CircularButton({Key? key}) : super(key: key);

  @override
  _CircularButtonState createState() => _CircularButtonState();
}

class _CircularButtonState extends State<CircularButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: CircularMenu(items: [
      CircularMenuItem(
        icon: Icons.message,
        color: Colors.blue,
        onTap: () {
         
        },
      ),
      CircularMenuItem(
        icon: Icons.abc,
        color: Colors.green,
        onTap: () {
        
        },
      ),
    ]));
  }
}
