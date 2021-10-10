import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:helpforyou/modules/home/contatos/adicionar_ctt.dart';
import 'package:helpforyou/shared/themes/app_colors.dart';

class VerContatos extends StatefulWidget {
  const VerContatos({Key? key}) : super(key: key);

  @override
  _VerContatosState createState() => _VerContatosState();
}

class _VerContatosState extends State<VerContatos> {
  FirebaseFirestore storage = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Meus contatos'),
        elevation: 0,
        backgroundColor: AppColors.roxo,
      ),
      body: Column(
        children: [
          Text(''),
          Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("contatos")
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
                            elevation: 4,
                            margin: EdgeInsets.all(15),
                            child: ListTile(
                              leading: CircleAvatar(
                                child: Icon(Icons.person),
                              ),
                              title: Text(list[index]["nome"]),
                              subtitle: Text(list[index]["tel"]),
                              trailing: IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      barrierDismissible: true,
                                      builder: (BuildContext ctx) {
                                        return AlertDialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15)),
                                          ),
                                          title: Text(
                                              "Tem certaza que deseja excluir?"),
                                          actions: <Widget>[
                                            RaisedButton(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15)),
                                              ),
                                              color: AppColors.roxo,
                                              child: Text(
                                                "Sim",
                                                style: TextStyle(
                                                    color: AppColors.branco),
                                              ),
                                              onPressed: () {
                                                Navigator.of(ctx).pop();
                                              },
                                            ),
                                            RaisedButton(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15)),
                                              ),
                                              color: AppColors.roxo,
                                              child: Text("Não",
                                                  style: TextStyle(
                                                      color: AppColors.branco)),
                                              onPressed: () {
                                                Navigator.of(ctx).pop();
                                              },
                                            ),
                                          ],
                                        );
                                      });
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: AppColors.roxo,
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: AppColors.branco),
        backgroundColor: AppColors.roxo,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Contatos()),
          );
        },
      ),
    );
  }
}
