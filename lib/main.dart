import 'package:flutter/material.dart';
import 'package:jobspot/Screens/Home.dart';
import 'package:jobspot/Screens/Login.dart';
import 'package:jobspot/Screens/Register.dart';
import 'package:jobspot/Screens/Splash.dart';

void main() {
  runApp(const JobSpot());
}

class JobSpot extends StatelessWidget {
  const JobSpot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Splash(),
      routes: {
        'register': (context) => const Register(),
        'home':(context) => const HomeScreen(),
        'login':(context) => const Login(),
      },
    );
  }
}
