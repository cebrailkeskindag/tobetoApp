import 'package:flutter/material.dart';
import 'package:tobetoapp/screen/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tobeto',
      theme: ThemeData(
        brightness:
            brightness == Brightness.dark ? Brightness.dark : Brightness.light,
      ),
      home: const Login(),
    );
  }
}
