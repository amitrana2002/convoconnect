import 'package:convoconnect/chat_page.dart';
import 'package:convoconnect/core/theme.dart';
import 'package:convoconnect/home.dart';
import 'package:convoconnect/login_page.dart';
import 'package:convoconnect/message_page.dart';
import 'package:convoconnect/reg_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,

      home: LoginPage(),
    );
  }
}
