// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todox/screens/service.dart';
import 'package:lottie/lottie.dart';

class signUpPage extends StatefulWidget {
  const signUpPage({Key? key}) : super(key: key);

  @override
  State<signUpPage> createState() => _signUpPageState();
}

class _signUpPageState extends State<signUpPage> {


  final email = TextEditingController();
  final pass = TextEditingController();

   signUp()  {
    if (email == null ){
      return (Container(child: AlertDialog(content: Text("Please Fill The Fields First"),),));
    }
    else{
      FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text.trim(), password: pass.text.trim());
    }
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
                      'Sign Up',
                      style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.headline4,
                        fontSize: 24,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(5),child: Center(child:  Lottie.network(
                        'https://assets10.lottiefiles.com/packages/lf20_OT15QW.json',height: 200,width: 300),),)
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
                          obscureText: true,
                          controller: pass,
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
                           signUp();
                           Navigator.of(context).push(MaterialPageRoute(builder: (context) =>servicesBackground()));
                         },
                         child: Container(
                           alignment: Alignment.center,
                           height: 50,
                           width: double.infinity,
                           child: Text(
                             'Sign Up',
                             style: GoogleFonts.lato(),
                           ),
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10),
                             color: Colors.blue,
                           ),
                         ),
                       ),



                    ],
                  ),
                ),

              ]),
            )
          ],
        ),
      )
    );
  }
}
