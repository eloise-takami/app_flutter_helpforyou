import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpforyou/services/database/database_service.dart';
import 'package:helpforyou/shared/models/psychologist_model.dart';
import 'chat_page.dart';
import 'package:helpforyou/shared/themes/app_colors.dart';
import 'package:helpforyou/shared/themes/app_images.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  _ChatsPageState createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.azulClaro,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Image(
          image: AssetImage(Imagem.logo_h),
          width: 35.0,
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: AppColors.branco,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.roxo,
                ),
                hintText: " Procurar Psicólogo",
                hintStyle: TextStyle(
                  color: AppColors.roxo,
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<PsychologistModel>>(
              future: DatabaseService.psychologists(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Container(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Ops, algo deu errado ao procurar psicólogos :(',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.breeSerif(
                            textStyle: Theme.of(context).textTheme.headline4,
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.normal,
                            color: AppColors.roxo,
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: Image.asset(Imagem.erro),
                        ),
                      ],
                    ),
                  );
                }

                if (snapshot.hasData) {
                  if (snapshot.data!.isEmpty) {
                    return Container(
                      width: double.infinity,
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Ops, não há psicólogos cadastrados :(',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.breeSerif(
                              textStyle: Theme.of(context).textTheme.headline4,
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.normal,
                              color: AppColors.roxo,
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            height: 100,
                            //child: Image.asset(Imagem.firebase_vazio),
                          ),
                        ],
                      ),
                    );
                  } else {
                    final psychologists = snapshot.data!;

                    return ListView.builder(
                      itemCount: psychologists.length,
                      itemBuilder: (context, index) {
                        return ItemPsychologistWidget(
                          psychologist: psychologists[index],
                        );
                      },
                    );
                  }
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ItemPsychologistWidget extends StatelessWidget {
  const ItemPsychologistWidget({
    Key? key,
    required this.psychologist,
  }) : super(key: key);

  final PsychologistModel psychologist;

  void getUrl() async {
    final storage = FirebaseStorage.instance;
    final url = await storage
        .ref('psychologists/WwE5JiwJK2OrMay5OTMR/paula.jpg')
        .getDownloadURL();
    print(url);
  }

  @override
  Widget build(BuildContext context) {
    getUrl();
    return ListTile(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ChatPage(psychologist: psychologist),
          ),
        );
      },
      leading: CircleAvatar(
        backgroundImage: NetworkImage(psychologist.photoUrl),
      ),
      // Container(
      //   width: 50,
      //   height: 50,
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.all(Radius.circular(100)),
      //     image: DecorationImage(
      //       image: ExactAssetImage(Imagem.medico),
      //     ),
      //   ),
      // ),
      title: Text(
        psychologist.name,
        style: GoogleFonts.breeSerif(
          textStyle: Theme.of(context).textTheme.headline4,
          fontSize: 16,
          fontWeight: FontWeight.w900,
          fontStyle: FontStyle.normal,
          color: Color.fromRGBO(63, 71, 206, 1.0),
        ),
      ),
      subtitle: //Row(
          //children: <Widget>[
          Text(
        'last menssage',
        style: GoogleFonts.breeSerif(
          textStyle: Theme.of(context).textTheme.headline4,
          fontSize: 14,
          fontStyle: FontStyle.normal,
          color: Color.fromRGBO(63, 71, 206, 1.0),
        ),
      ),
      //SizedBox(width: 25),
      // Text(
      //   list[index].lastMessageTime + "ias atrás",
      //   style: TextStyle(
      //     color: AppColors.roxo,
      //   ),
      // ),
      // Text(ChatModel.list[index].lastMessageTime,
      // style: TextStyle(
      //      color: AppColors.roxo,
      //    ),)
      //],
      //),
    );
  }
}
