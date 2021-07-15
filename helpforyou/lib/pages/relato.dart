import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Relato extends StatefulWidget {
  const Relato({ Key key }) : super(key: key);

  @override
  _RelatoState createState() => _RelatoState();
}

class _RelatoState extends State<Relato> {
  String _relato;
  String valueChoose;
  List listItem = [
    "Violência sexual","Violência patrimonial","Violência fisica","Violência moral","Violência psicológica"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Color.fromRGBO(62,71,208,1.0),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height:20),
              Container(
               child: Padding(
               padding: const EdgeInsets.all(16.0),
               child: Container(
                 padding: EdgeInsets.only(left:1, right:2),
                 decoration: new BoxDecoration(
                   color: Colors.white,
                 ),
                 child: DropdownButton(
                  hint: Text(" onde se aproxima esse relato",
                  style: GoogleFonts.breeSerif(
                   textStyle: Theme.of(context).textTheme.headline4,
                   fontSize: 16,
                   fontWeight: FontWeight.w900,
                   fontStyle: FontStyle.normal,
                   color: Color.fromRGBO(62,71,208,1.0),
                  ),
                  ),
                  dropdownColor: Colors.white,
                  icon: Icon(Icons.arrow_drop_down, color: Color.fromRGBO(62,71,208,1.0)),
                  iconSize: 30,
            
                  style: GoogleFonts.breeSerif(
                  textStyle: Theme.of(context).textTheme.headline4,
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.normal,
                  color: Color.fromRGBO(62,71,208,1.0),
                  ),
                  value: valueChoose,
                  onChanged: (newValue){
                  setState(() {
                    valueChoose = newValue;
                  });
                 },
                 items: listItem.map((valueItem){
                 return DropdownMenuItem( 
                 value:valueItem,
                 child: Text(valueItem),
                );
               }).toList(),
              ),
            ),
          ),
         ),
            SizedBox(height:20),
            TextField(
              maxLength: 200,
              maxLines: 7,
              decoration: InputDecoration(
                hintText: 'Digite seu relato',
              ),
              onChanged: (value){
                _relato =value;
              },
            ),
            
           SizedBox(height: 40,),
           Container(
           height: 60,
           width: 230,
           alignment: Alignment.centerLeft,
           decoration: BoxDecoration(
             gradient: LinearGradient(
               begin: Alignment.topLeft,
               end: Alignment.bottomRight,
               stops: [0.2,1],
               colors: [
                 Colors.cyan[700],
                 Color.fromRGBO(62,71,208,1.0),
               ],
             ),
             borderRadius: BorderRadius.all(
               Radius.circular(30),
             ),
            ),
            
           child:  SizedBox.expand(
              child: FlatButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget> [
                    Text(
                      "                Postar",
                      style: GoogleFonts.breeSerif(
                      textStyle: Theme.of(context).textTheme.headline4,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.normal,
                      color: Colors.white,
                     ),
                      textAlign:TextAlign.center,
                     ),
                  ],
                ),
                onPressed: (){
                  //Navigator.push(
                    //context,
                    //MaterialPageRoute(builder: (context) => PagePessoa()),
                  //);
                },
              ),
            ),
         ),
          ],),
      ),
    );
  }
}