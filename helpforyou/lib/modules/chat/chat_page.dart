import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:helpforyou/shared/themes/app_colors.dart';

var LoginUser = FirebaseAuth.instance.currentUser;

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  Service service = Service();

  final storeMensagem = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  TextEditingController msg = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.azulClaro,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.azulClaro,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.roxo,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        //title: Text(LoginUser!.email.toString()),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('mensagens'),
          //ShowMensagem(),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(12),
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  decoration: BoxDecoration(
                    color: AppColors.branco,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: TextField(
                    controller: msg,
                    decoration: InputDecoration(
                        hintText: 'Digite sua mensagem...',
                        hintStyle: TextStyle(color: AppColors.roxo)),
                  ),
                ),
              ),
              IconButton(
                  icon: Icon(
                    Icons.send,
                    color: AppColors.roxo,
                  ),
                  onPressed: () {
                    if (msg.text.isNotEmpty) {
                      storeMensagem.collection("Mensagens").doc().set({
                        "mensagem": msg.text.trim(),
                        "user": LoginUser!.email.toString()
                      });
                      msg.clear();
                    }
                  })
            ],
          ),
        ],
      ),
    );
  }
}
