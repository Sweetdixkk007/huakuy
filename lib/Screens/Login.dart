// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobspot/Screens/Register.dart';
import 'package:page_transition/page_transition.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool? isChecked = false;
  get signInWithEmailAndPassword => null;
  Future sign_in() async {
    String url = "http://127.0.0.1/flutter_login/login.php";
    final response = await http.post(Uri.parse(url), body: {
      'email': email.text,
      'password': pass.text,
    });
    var data = json.decode(response.body);
    if (data == 'Error') {
      Navigator.of(context, rootNavigator: true).pushNamed("login");
    } else {
      Navigator.of(context, rootNavigator: true).pushNamed("home");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 162, 53),
      body: Center(
        child: Form(
          key: formKey,
          child: ListView(
            shrinkWrap: true,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'กรุณาเข้าสู่ระบบ',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 3, 4, 90)),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  
                  SizedBox(
                    width: 350,
                    child: TextFormField(
                      obscureText: false,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromARGB(255, 3, 4, 90)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 3, 4, 90)),
                        hintText: 'กรุณากรอกอีเมล์',
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Empty';
                        }
                        return null;
                      },
                      controller: email,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  
                  SizedBox(
                    width: 350,
                    child: TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromARGB(255, 3, 4, 90)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 3, 4, 90)),
                        hintText: 'กรุณากรอกรหัสผ่าน',
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Empty';
                        }
                        return null;
                      },
                      controller: pass,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 350,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                          child: Row(children: [
                            Transform.scale(
                              scale: 0.7,
                              child: Checkbox(
                                value: isChecked,
                                activeColor:
                                    const Color.fromARGB(255, 3, 4, 90),
                                onChanged: (newBool) {
                                  setState(() {
                                    isChecked = newBool;
                                  });
                                },
                                side: const BorderSide(
                                  color: Color.fromARGB(103, 3, 4, 90),
                                  width: 1,
                                ),
                              ),
                            ),
                            Text(
                              "Remember me",
                              style: GoogleFonts.dmSans(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  color: const Color.fromARGB(255, 3, 4, 90)),
                            ),
                          ]),
                        ),        
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 350,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 3, 4, 90),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onPressed: () {
                        bool pass = formKey.currentState!.validate();

                        if (pass) {
                          sign_in();
                        }
                      },
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "You don't have an account yet? ",
                        style: GoogleFonts.dmSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: const Color.fromARGB(255, 4, 6, 126),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.fade,
                                  child: const Register()));
                        },
                        child: Text(
                          "Sign Up",
                          style: GoogleFonts.dmSans(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
