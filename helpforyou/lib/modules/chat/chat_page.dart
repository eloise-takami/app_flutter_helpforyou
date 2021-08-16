import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:helpforyou/shared/themes/app_colors.dart';
import 'package:helpforyou/shared/themes/app_images.dart';

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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          toolbarHeight: 100, // default is 56
          toolbarOpacity: 0.5,
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
          title: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                image: DecorationImage(
                  image: ExactAssetImage(Imagem.medico),
                )),
          ),
          flexibleSpace: Column(
            children: [
              SizedBox(
                height: 70,
              ),
              Text('Nome do psicologo'),
              Text('online'),
            ],
          ),
        ),
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
