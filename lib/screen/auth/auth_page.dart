import 'package:flutter/material.dart';
import 'package:todo_appp/screen/login_screen.dart';
import 'package:todo_appp/screen/signup_screen.dart';

class AuthPage extends StatefulWidget {
  AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool a = true;
  void to() {
   // setState(() {
      a = !a;
   // });
  }

  @override
  Widget build(BuildContext context) {
    if (a) {
      return LogINScreen(to);
    } else {
      return SignUpScreen(to);
    }
  }
}
