import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpforyou/shared/models/post_model.dart';
import 'package:helpforyou/shared/themes/app_colors.dart';
import 'package:helpforyou/shared/themes/app_images.dart';

import 'post/new_post_page.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  var LoginUser = FirebaseAuth.instance.currentUser;
  final auth = FirebaseAuth.instance;
  getCurrentUser() {
    final user = auth.currentUser;

    if (user != null) {
      LoginUser = user;
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  String? valueChoose;
  final listItem = <String>[
    "Violência sexual",
    "Violência patrimonial",
    "Violência fisica",
    "Violência moral",
    "Violência psicológica"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[50],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Image(
          image: AssetImage(Imagem.logo_h),
          width: 35.0,
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                print("notificação");
              },
              child: Icon(
                Icons.notifications,
                color: Color.fromRGBO(63, 71, 206, 1.0),
                size: 30,
              ),
            ),
          )
        ],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 5, right: 2),
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: new Border.all(
                          color: Color.fromRGBO(63, 71, 206, 1.0), width: 3),
                      color: AppColors.azulClaro,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 3),
                          blurRadius: 10,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    child: DropdownButton<String>(
                      hint: Text(
                        "Categorias",
                        style: GoogleFonts.breeSerif(
                          textStyle: Theme.of(context).textTheme.headline4,
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.normal,
                          color: AppColors.roxo,
                        ),
                      ),
                      dropdownColor: Colors.white,
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.roxo,
                      ),
                      iconSize: 30,
                      style: GoogleFonts.breeSerif(
                        textStyle: Theme.of(context).textTheme.headline4,
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.normal,
                        color: AppColors.roxo,
                      ),
                      value: valueChoose,
                      onChanged: (newValue) {
                        setState(() {
                          valueChoose = newValue;
                        });
                      },
                      items: listItem.map((valueItem) {
                        return DropdownMenuItem<String>(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("relatos")
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> querySnapshot) {
                        if (querySnapshot.hasError) {
                          return Text("algum erro");
                        }
                        if (querySnapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else {
                          final list = querySnapshot.data!.docs;

                          return ListView.builder(
                            itemBuilder: (context, index) {
                              return Card(
                                elevation: 0,
                                color: AppColors.azulClaro,
                                margin: EdgeInsets.only(
                                  left: 1,
                                ),
                                child: ListTile(
                                  leading: CircleAvatar(
                                    radius: 25.0,
                                    child: Text('F'),
                                  ),
                                  title: Text(
                                    LoginUser!.email.toString(),
                                    style: GoogleFonts.breeSerif(
                                      textStyle:
                                          Theme.of(context).textTheme.headline4,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w900,
                                      fontStyle: FontStyle.normal,
                                      color: AppColors.roxo,
                                    ),
                                  ),
                                  subtitle: Text(
                                    list[index]["content"],
                                    style: GoogleFonts.breeSerif(
                                      textStyle:
                                          Theme.of(context).textTheme.headline4,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w900,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemCount: list.length,
                          );
                        }
                      }))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.create, color: AppColors.roxo),
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewPostPage()),
          );
        },
      ),
    );
  }
}
