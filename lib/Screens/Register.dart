// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController email = TextEditingController();
  bool? isChecked = false;
  bool isLoading = false;
  Future sign_up() async{
    String url = "http://127.0.0.1/flutter_login/register.php";
    final response = await http.post(Uri.parse(url), body:{
      'name': name.text,
      'password': pass.text,
      'email': email.text,
    });
    var data = json.decode(response.body);
    if (data == 'Error'){
      Navigator.of(context, rootNavigator: true).pushNamed('register');
    }else{
      Navigator.of(context, rootNavigator: true).pushNamed('home');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 239, 247, 255),
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: Center(
        child: Form(
          key: formKey,
          child: ListView(
            shrinkWrap: true,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "กรุณาสมัครสมาชิก",
                    style: GoogleFonts.dmSans(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 3, 4, 90)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 350,
                    child: TextFormField(
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'กรุณากรอกชื่อ',
                      ),
                      validator: (val){
                        if (val!.isEmpty){
                          return 'Empty';
                        }
                        return null;
                      },
                      controller: name,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 350,
                    child: TextFormField(
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'กรุณากรอกอีเมลล์',
                      ),
                       validator: (val){
                        if (val!.isEmpty){
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
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'กรุณากรอกรหัสผ่าน',
                      ),
                       validator: (val){
                        if (val!.isEmpty){
                          return 'Empty';
                        }
                        return null;
                      },
                      controller: pass,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 350,
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'กรุณากรอกรหัสผ่านอีกครั้ง',
                      ),
                       validator: (val){
                        if (val!.isEmpty){
                          return 'Empty';
                        }else if(val != pass.text){
                          return 'password not match';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 350,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                          child: Row(children: [
                            Transform.scale(
                              scale: 0.7,
                              child: Checkbox(
                                value: isChecked,
                                activeColor: const Color.fromARGB(255, 3, 4, 90),
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
                            const SizedBox(
                              width: 0,
                            ),
                            Text(
                              "Remember me",
                              style: GoogleFonts.dmSans(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  color: const Color.fromARGB(150, 3, 4, 90)),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
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

                        if(pass){
                          sign_up();
                        }
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account yet? ",
                        style: GoogleFonts.dmSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: const Color.fromARGB(255, 4, 6, 126),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Sign In",
                          style: GoogleFonts.dmSans(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: Colors.amber[700],
                              decoration: TextDecoration.underline),
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