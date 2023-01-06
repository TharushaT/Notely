import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_color/random_color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todox/screens/account.dart';
import 'package:todox/screens/developer.dart';

addData() {}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // int _index = 0;

  final _title = TextEditingController();
  final _content = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // Widget child;
    // switch (_index) {
    //   case 0:
    //     child = HomePage();
    //     break;
    //   case 1:
    //     child =About();
    //     break;
    //   case 2:
    //     child = Profile();
    //     break;
    // }

    return MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            // bottomNavigationBar: BottomNavigationBar(
            //   onTap: (newIndex) => setState(() => _index = newIndex),
            //   currentIndex: _index,
            //
            //
            //   items: [
            //     BottomNavigationBarItem(icon: Icon(Icons.looks_one), label: "Home"),
            //     BottomNavigationBarItem(icon: Icon(Icons.looks_two), label: "Profile"),
            //     BottomNavigationBarItem(icon: Icon(Icons.looks_3), label: "About"),
            //   ],
            // ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.transparent,
                        ),
                        child: Container(
                          color: ThemeData.dark().cardColor,
                            alignment: Alignment.center,

                            height: 400,
                            width: 350,
                            child: MaterialApp(
                              theme: ThemeData.dark(),
                              debugShowCheckedModeBanner: false,

                              color: ThemeData.dark().cardColor,
                              home: Material(
                                child: Column(

                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                Padding(
                                padding: EdgeInsets.all(2),
                                child: Text(
                                  "Add Note",
                                  style: GoogleFonts.lato(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(5),
                                child: Text("Title"),
                              ),
                              SizedBox(
                                width: 320,
                                child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: TextField(

                                    controller: _title,

                                    //controller: email,
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 10, 2, 104),
                                            width: 1.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 1.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                              Padding(
                              padding: EdgeInsets.all(5),
                              child: Text("Content"),
                            ),
                            SizedBox(
                              width: 320,
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: TextField(
                                  controller: _content,
                                  maxLines: 5,
                                  //controller: email,
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 10, 2, 104),
                                          width: 1.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue,
                                          width: 1.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                            OutlinedButton(
                            child: Text("Add NOTE"),
                            onPressed: () {

                              var user = FirebaseAuth.instance
                                  .currentUser?.email;
                              FirebaseFirestore.instance
                                  .collection(user.toString())
                                  .add({
                                //your data which will be added to the collection and collection will be created after this
                                "title": _title.text.trim(),
                                "content":
                                _content.text.trim(),
                                "date":DateTime.now()
                                  .toString()
                                  .substring(0,10)
                              ,
                                "full_date":DateTime.now()
                                .toString()
                                .substring(0,19),
                              }).then((_) {
                                _title.clear();
                                _content.clear();
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(
                                  SnackBar(
                                    backgroundColor:
                                    Colors.green,
                                    content: Text(
                                        "Added Successfully :)"),
                                  ),
                                );
                              }).catchError(
                                    (_) {
                                  SnackBar(
                                    backgroundColor:
                                    Colors.green,
                                    content: Text(
                                        "Error Check Your Connection :("),
                                  );
                                },
                              );
                            }),
                              ]),
                                        ],
                                      )
                                    ],
                                  ),

                              ),
                            )));
                  },
                );
              },
            ),
            appBar: AppBar(
              systemOverlayStyle:SystemUiOverlayStyle(
                systemNavigationBarColor: Colors.transparent, // Navigation bar
                statusBarColor: Colors.transparent, // Status bar
              ),
              title: Text("Notely"),
              backgroundColor: ThemeData.light().appBarTheme.backgroundColor,
              actions: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => AccountPage()));},
                      icon: Icon(Icons.account_circle_rounded),
                    ),
                    SizedBox(width: 10),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Developer()));

                      },
                      icon: Icon(Icons.code),
                    ),
                    SizedBox(width: 10),
                  ],
                )
              ],
            ),
            body: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                      // inside the <> you enter the type of your stream
                      stream: FirebaseFirestore.instance
                          .collection(FirebaseAuth.instance.currentUser!.email
                              .toString())
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return GridView.builder(
                              itemCount: snapshot.data!.docs.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                              itemBuilder: (context, index) {
                                RandomColor _randomColor = RandomColor();

                                Color _color =
                                    _randomColor.randomMaterialColor();
                                QueryDocumentSnapshot x =
                                    snapshot.data!.docs[index];

                                return GestureDetector(
                                  onTap:
                                        (){
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context){
                                            return Container(
                                              alignment: Alignment.center,
                                              height: 400,
                                              width: 350,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(12.0),
                                                color: ThemeData.dark().cardColor,

                                              ),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [


                                                  Material(
                                                    child: Row(

                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        SizedBox(width: 5,),


                                                        IconButton(icon:Icon(Icons.close),onPressed: (){
                                                          Navigator.pop(context);
                                                        },),

                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 15,),

                                                  Padding(padding: EdgeInsets.all(6),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [

                                                        SelectableText(x['title'],style: GoogleFonts.lato(
                                                            fontWeight: FontWeight.bold,
                                                          fontSize: 22

                                                        ),),
                                                        SizedBox(height: 10,),
                                                        Padding(padding: EdgeInsets.all(10),child: SelectableText(x['content']),),
                                                        SizedBox(height: 10,),
                                                        Text(x["full_date"],style: GoogleFonts.lato(
                                                          fontSize: 14
                                                        ),)

                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            );
                                          });
                                    },

                                  child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: _color,
                                        ),


                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 1,
                                              width: 2,
                                            ),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 1,
                                                ),
                                                IconButton(
                                                    onPressed: () {
                                                      final collection =
                                                      FirebaseFirestore.instance
                                                          .collection(
                                                          FirebaseAuth
                                                              .instance
                                                              .currentUser!
                                                              .email
                                                              .toString());
                                                      collection
                                                          .doc(snapshot
                                                          .data!
                                                          .docs[index]
                                                          .id) // <-- Doc ID to be deleted.
                                                          .delete() // <-- Delete
                                                          .then((_) =>
                                                          ScaffoldMessenger.of(
                                                              context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              backgroundColor:
                                                              Colors.red,
                                                              content: Text(
                                                                  "Deleted Successfully :)"),
                                                            ),
                                                          ))
                                                          .catchError((error) =>
                                                          ScaffoldMessenger.of(
                                                              context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              backgroundColor:
                                                              Colors.red,
                                                              content: Text(
                                                                  "Error Check Your Connection :("),
                                                            ),
                                                          ));
                                                    },
                                                    icon: Icon(Icons.close)),
                                              ],
                                            ),
                                            Padding(
                                                padding: EdgeInsets.all(1),
                                                child: Row(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      x['title'],
                                                      style: GoogleFonts.lato(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                            SizedBox(
                                              height: 1,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(10),
                                              child: SizedBox(
                                                height: 50,
                                                child: Column(
                                                  children: [Expanded(
                                                    child: RichText(

                                                        text:TextSpan(
                                                          text:  x['content'.toString()],
                                                          style: GoogleFonts.roboto(fontSize: 14),

                                                        )


                                                    ),
                                                  ),],
                                                )
                                              )
                                            ),
                                            SizedBox(height: 2,),
                                            Text(x['date'],style:GoogleFonts.lato(),)


                                          ],
                                        ),
                                      )

                                  ),
                                );
                              });
                        }
                        if (snapshot.hasError) {
                          return const Center(child:Text('Error contact admin tharushatdev@gmail.com'));
                        } else {
                          return Material(child: Center(child: Column ( crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center, children: [const CircularProgressIndicator(),Text("Fetching Data..",style: GoogleFonts.lato(),)],),),);
                        }
                      },
                    ),
                  )
                ],
              ),
            )));
  }
}
