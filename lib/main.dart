import 'package:flutter/material.dart';
import 'package:tobetoapp/screen/login.dart';
import 'package:tobetoapp/theme/theme.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tobeto',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const Login(),
      
    );
  }
}
