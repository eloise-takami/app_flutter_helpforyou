import 'package:flutter/material.dart';
import 'chat_page.dart';
import 'chat_model.dart';
import 'package:helpforyou/shared/themes/app_colors.dart';
import 'package:helpforyou/shared/themes/app_images.dart';

class PageMensagem extends StatefulWidget {
  const PageMensagem({Key? key}) : super(key: key);

  @override
  _PageMensagemState createState() => _PageMensagemState();
}

class _PageMensagemState extends State<PageMensagem> {
  List<ChatModel> list = ChatModel.list;

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
                )),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.roxo,
                ),
                hintText: " Procurar",
                hintStyle: TextStyle(
                  color: AppColors.roxo,
                ),
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => ChatPage(),
                          ),
                        );
                      },
                      leading: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                            image: DecorationImage(
                              image: ExactAssetImage(Imagem.medico),
                            )),
                      ),
                      title: Text(
                        list[index].contact.name,
                        style: TextStyle(
                          color: AppColors.roxo,
                        ),
                      ),
                      subtitle: Row(
                        children: <Widget>[
                          Text(
                            list[index].lastMessage,
                            style: TextStyle(
                              color: AppColors.roxo,
                            ),
                          ),
                          SizedBox(width: 25),
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
                        ],
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
