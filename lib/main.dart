import 'package:demo_app/login.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/login.dart';
import 'package:demo_app/register.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo App',
      home: LoginPage(),
    );
  }
}