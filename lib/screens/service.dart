import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todox/screens/account.dart';
import 'package:todox/screens/home.dart';
import 'package:todox/screens/login.dart';


class servicesBackground extends StatefulWidget {
  const servicesBackground({Key? key}) : super(key: key);

  @override
  State<servicesBackground> createState() => _servicesBackgroundState();
}

class _servicesBackgroundState extends State<servicesBackground> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context , snapshot){
        if (snapshot.hasData){
          return MaterialApp(theme:ThemeData.dark(),home:Material(child: HomePage()),);
        }
        else if (snapshot.connectionState == ConnectionState.waiting)
        {
          return  Container(child: Center(child: CircularProgressIndicator(),),);
        }
        else if (snapshot.hasError){
           return  Column(children: [const Center(child: const Text("Error Check Your Connection OR Contact App Dev."),)],);
        }
        else{
          return LoginPage();
        }
      },
    );
  }
}
