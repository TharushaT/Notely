// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todox/screens/service.dart';
import 'package:lottie/lottie.dart';
import 'package:todox/screens/signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final pass = TextEditingController();

  signIn() {
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text.trim(), password: pass.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions: [
          Padding(
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                SizedBox(
                  width: 370,
                ),
              ],
            ),
          ),
        ]),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Log In',
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.headline4,
                          fontSize: 24,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                     Padding(padding: EdgeInsets.all(10),child: Center(child:  Lottie.network(
                         'https://assets2.lottiefiles.com/packages/lf20_tr1pjkop.json',height: 200,width: 200),),)
                    ],
                  )),
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.all(1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text("Email"),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: TextField(
                            controller: email,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 10, 2, 104),
                                    width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 1.0),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text("Password"),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: TextField(
                            controller: pass,
                            obscureText: true,
                            decoration: InputDecoration(

                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 10, 2, 104),
                                    width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 1.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: (){
                            signIn();
                            if (pass == null ){
                              return;

                            }
                            else if (email==null){


                            }
                            else{
                              signIn();
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>servicesBackground()));
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: double.infinity,
                            child: Text(
                              'Log In',
                              style: GoogleFonts.lato(),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Center(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 2,
                                  width: 100,
                                  color: Colors.blueGrey,
                                ),
                                Text("or"),
                                Container(
                                  height: 2,
                                  width: 100,
                                  color: Colors.blueGrey,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => signUpPage()));
                      },
                      child: Padding(
                        padding: EdgeInsets.all(25),
                        child: Text(
                          "Don't have an account? Sign Up Here!",
                          style: GoogleFonts.lato(),
                        ),
                      )),
                ]),
              )
            ],
          ),
        ));
  }
}
