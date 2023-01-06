import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todox/screens/home.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var user_name = FirebaseAuth.instance.currentUser!.email.toString();

    signOut (){
      FirebaseAuth.instance.signOut();
    }

    return  Scaffold(

      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Material(
                child: Row(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 5,),


                    IconButton(icon:Icon(Icons.close),onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
                    },),

                  ],
                ),
              ),
              CircleAvatar(
                  radius: 70, backgroundImage: AssetImage("lib/assets/user_image.jpg")),
              Text(
                'Signed As :',
                style: GoogleFonts.lato(

                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '$user_name',
                style: GoogleFonts.lato(

                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 20,
                width: 150,
                child: Divider(

                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 2,horizontal: 25),
                child: ListTile(
                    leading: Icon(
                      Icons.warning,

                    ),
                    title: Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        'Dear beta users,\nThank you for taking the time to try out this product. I truly appreciate your feedback and input. I am always working to improve our product and your help is invaluable.\nSince we are still in beta, there may be bugs or glitches that you come across. I would greatly appreciate if you could report any issues that you have so that I can fix them as quickly as possible.\nThank you again for your support. I can not wait to hear what you think of the final product.\nSincerely,\nDev.',
                        style: GoogleFonts.lato(


                          fontSize: 12,
                        ),
                      ),
                    )
                ),

              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 25),
                child: ListTile(
                  leading: Icon(
                    Icons.update,

                  ),
                  title: Text(
                    '1.0v',
                    style: GoogleFonts.roboto(


                      fontSize: 14,
                    ),
                  ),
                ),

              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 2,horizontal: 25),
                child: ListTile(
                  leading: Icon(
                    Icons.workspaces_sharp,

                  ),
                  title: Text(
                    'Beta',
                    style: GoogleFonts.roboto(


                      fontSize: 12,
                    ),
                  ),
                ),

              ),
              SizedBox(height: 8),
              GestureDetector(
                onTap: (){signOut();},
                child: Card(
                  color: Colors.red,
                  margin: EdgeInsets.symmetric(vertical: 2,horizontal: 25),
                  child: ListTile(
                    leading: Icon(
                      Icons.logout,

                    ),
                    title: Text(
                      'Sign Out',
                      style: GoogleFonts.roboto(


                        fontSize: 12,
                      ),
                    ),
                  ),

                ),
              ),
              SizedBox(height: 50,)
            ],
          ),
        ),
      )

    );
  }
}
