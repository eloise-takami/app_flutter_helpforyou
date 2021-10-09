import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpforyou/shared/models/post_model.dart';
import 'package:helpforyou/shared/themes/app_colors.dart';

class NewPostPage extends StatefulWidget {
  const NewPostPage({Key? key}) : super(key: key);

  @override
  _NewPostPageState createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  var LoginUser = FirebaseAuth.instance.currentUser;

  TextEditingController content = TextEditingController();

  Future<void> insertData(final post) async {
    final firestore = FirebaseFirestore.instance;

    firestore
        .collection("relatos")
        .add(post)
        .then((DocumentReference document) {
      print(document.id);
    }).catchError((e) {
      print(e);
    });
  }

  String? _relato;
  String? valueChoose;
  final listItem = <String>[
    "Violência sexual",
    "Violência patrimonial",
    "Violência fisica",
    "Violência moral",
    "Violência psicológica"
  ];
  bool container = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(''),
        elevation: 0,
        backgroundColor: AppColors.roxo,
      ),
      body: Container(
        color: AppColors.roxo,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 5),
                height: 720,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.branco,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(70),
                    //topRight: Radius.circular(24)
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          padding: EdgeInsets.only(left: 1, right: 2),
                          decoration: new BoxDecoration(
                            color: Colors.white,
                          ),
                          child: DropdownButton<String>(
                            hint: Text(
                              "                Categoria",
                              style: GoogleFonts.breeSerif(
                                textStyle:
                                    Theme.of(context).textTheme.headline4,
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                                fontStyle: FontStyle.normal,
                                color: Color.fromRGBO(62, 71, 208, 1.0),
                              ),
                            ),
                            dropdownColor: Colors.white,
                            icon: Icon(Icons.arrow_drop_down,
                                color: Color.fromRGBO(62, 71, 208, 1.0)),
                            iconSize: 30,
                            style: GoogleFonts.breeSerif(
                              textStyle: Theme.of(context).textTheme.headline4,
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.normal,
                              color: Color.fromRGBO(62, 71, 208, 1.0),
                            ),
                            value: valueChoose,
                            onChanged: (newValue) {
                              setState(() {
                                valueChoose = newValue;
                              });
                            },
                            items: listItem.map((valueItem) {
                              return DropdownMenuItem(
                                value: valueItem,
                                child: Text(valueItem),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: 300,
                      child: TextField(
                        controller: content,
                        maxLength: 1000,
                        maxLines: 7,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Digite seu relato',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 45,
                      width: 110,
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.2, 1],
                          colors: [
                            Colors.cyan[700]!,
                            Color.fromRGBO(62, 71, 208, 1.0),
                          ],
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      child: SizedBox.expand(
                        child: FlatButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "   Postar",
                                style: GoogleFonts.breeSerif(
                                  textStyle:
                                      Theme.of(context).textTheme.headline4,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                  fontStyle: FontStyle.normal,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          onPressed: () {
                            final String pcontent = content.text;

                            final PostModel post = PostModel(content: pcontent);

                            insertData(post.toMap());
                            content.clear();

                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
