
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todox/screens/home.dart';


_launchWhatsapp() async {
  var whatsapp = "+94761567331";
  var whatsappAndroid =Uri.parse("whatsapp://send?phone=$whatsapp&text=hello");
  if (await canLaunchUrl(whatsappAndroid)) {
    await launchUrl(whatsappAndroid);
  }

  }



class Developer extends StatefulWidget {
  const Developer({Key? key}) : super(key: key);

  @override
  State<Developer> createState() => _DeveloperState();
}

class _DeveloperState extends State<Developer> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(

      body: SafeArea(
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
            SizedBox(
              height: 150,
              child:             CircleAvatar(

                  radius: 70, backgroundImage: AssetImage("lib/assets/dev_image.png")),
            ),

            Text(
              'Developed With ❤ By',
              style: GoogleFonts.lato(

                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'TharushaT',
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
                  Icons.message,

                ),
                title: Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'Hello, \nI hope you are enjoying this app. I am constantly working to improve the app and make sure it is the best it can be for users.\nIf you have any feedback, suggestions or ideas on how I can improve, I would love to hear from you. You can email me directly at tharushatdev@gmail.com or send me a message by clicking "contact" button.\nThank you for using this app!\nDev.',
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
                  Icons.code_off,

                ),
                title: Text(
                  'Source Code: github.com/TharushaT/Notely',
                  style: GoogleFonts.lato(


                    fontSize: 14,
                  ),
                ),
              ),

            ),
            Card(
              color: Colors.brown,
              margin: EdgeInsets.symmetric(vertical: 2,horizontal: 25),
              child: ListTile(
                leading: Icon(
                  Icons.email,

                ),
                title: Text(
                  'tharushatdev@gmail.com',
                  style: GoogleFonts.lato(


                    fontSize: 12,
                  ),
                ),
              ),

            ),
            SizedBox(height: 8),
            GestureDetector(
              onTap: (){_launchWhatsapp();},
              child: Card(
                color: Colors.green,
                margin: EdgeInsets.symmetric(vertical: 2,horizontal: 25),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,

                  ),
                  title: Text(
                    'Contact',
                    style: GoogleFonts.lato(


                      fontSize: 12,
                    ),
                  ),
                ),

              ),
            ),

          ],
        ),
      ),

    );
  }
}
