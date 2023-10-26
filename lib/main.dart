import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:tu_cine/LogIn/forgotPassword.dart';
import 'package:tu_cine/LogIn/login.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Welcome to Flutter',
      home: LoginPage(),
    );
  }
}

