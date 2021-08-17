import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:helpforyou/modules/chat/chat_controller.dart';
import 'package:helpforyou/services/database/database_service.dart';
import 'package:helpforyou/shared/models/chat_model.dart';
import 'package:helpforyou/shared/models/psychologist_model.dart';
import 'package:helpforyou/shared/themes/app_colors.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key, required this.psychologist}) : super(key: key);

  final PsychologistModel psychologist;

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _controller = ChatController();
  final _inputMessage = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _controller.init(widget.psychologist.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.azulClaro,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          toolbarHeight: 100,
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
          title: CircleAvatar(
            backgroundImage: NetworkImage(widget.psychologist.photoUrl),
          ),
          flexibleSpace: Column(
            children: [
              SizedBox(
                height: 70,
              ),
              Text(widget.psychologist.name),
              Text('online'),
            ],
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: DatabaseService.messages(_controller.groupId!),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Erro ao carregar mensagens.'));
                }

                if (snapshot.hasData) {
                  if (snapshot.data!.docs.isEmpty) {
                    return Center(
                      child: Text('Não há mensagens para mostrar.'),
                    );
                  } else {
                    final messages = snapshot.data!.docs
                        .map((m) => ChatModel.fromMap(m.data()))
                        .toList();

                    return ListView.builder(
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        return ItemMessageWidget(chat: messages[index]);
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
                    controller: _inputMessage,
                    focusNode: _focusNode,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Digite sua mensagem...',
                      hintStyle: TextStyle(color: AppColors.roxo),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.send,
                  color: AppColors.roxo,
                ),
                onPressed: () {
                  if (_inputMessage.text.isNotEmpty) {
                    _controller.sendMessage(msg: _inputMessage.text);

                    _inputMessage.clear();
                    _focusNode.unfocus();
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ItemMessageWidget extends StatelessWidget {
  const ItemMessageWidget({Key? key, required this.chat}) : super(key: key);

  final ChatModel chat;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
      child: Align(
        alignment:
            (chat.sentByPsychologist ? Alignment.topLeft : Alignment.topRight),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: (chat.sentByPsychologist
                ? Colors.grey.shade200
                : Colors.blue[200]),
          ),
          padding: EdgeInsets.all(16),
          child: Text(
            chat.content,
            style: TextStyle(fontSize: 15),
          ),
        ),
      ),
    );

    // return Container(
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(8),
    //     color: Colors.green,
    //   ),
    //   alignment: Alignment.center,
    //   child: Text(chat.content),
    // );
  }
}

// class ChatPage extends StatefulWidget {
//   @override
//   _ChatPageState createState() => _ChatPageState();
// }

// class _ChatPageState extends State<ChatPage> {
//   //Service service = Service();

//   final storeMensagem = FirebaseFirestore.instance;
//   final auth = FirebaseAuth.instance;
//   TextEditingController msg = TextEditingController();

//   getCurrentUser() {
//     final user = auth.currentUser;

//     if (user != null) {
//       LoginUser = user;
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     getCurrentUser();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.azulClaro,
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(100),
//         child: AppBar(
//           toolbarHeight: 100, // default is 56
//           toolbarOpacity: 0.5,
//           automaticallyImplyLeading: false,
//           backgroundColor: AppColors.azulClaro,
//           elevation: 0,
//           leading: IconButton(
//             icon: Icon(
//               Icons.arrow_back,
//               color: AppColors.roxo,
//             ),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//           title: Container(
//             width: 50,
//             height: 50,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.all(Radius.circular(100)),
//               image: DecorationImage(
//                 image: ExactAssetImage(Imagem.medico),
//               ),
//             ),
//           ),
//           flexibleSpace: Column(
//             children: [
//               SizedBox(
//                 height: 70,
//               ),
//               Text('Nome do psicologo'),
//               Text('online'),
//             ],
//           ),
//         ),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           //Text('mensagens'),
//           //ShowMensagem(),
//           Expanded(child: Container()),
//           Row(
//             children: [
//               Expanded(
//                 child: Container(
//                   margin: EdgeInsets.all(12),
//                   padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
//                   decoration: BoxDecoration(
//                     color: AppColors.branco,
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(10),
//                     ),
//                   ),
//                   child: TextField(
//                     controller: msg,
//                     decoration: InputDecoration(
//                       border: InputBorder.none,
//                       hintText: 'Digite sua mensagem...',
//                       hintStyle: TextStyle(color: AppColors.roxo),
//                     ),
//                   ),
//                 ),
//               ),
//               IconButton(
//                 icon: Icon(
//                   Icons.send,
//                   color: AppColors.roxo,
//                 ),
//                 onPressed: () {
//                   if (msg.text.isNotEmpty) {
//                     storeMensagem.collection("Mensagens").doc().set({
//                       "mensagem": msg.text.trim(),
//                       "user": LoginUser!.email.toString()
//                     });
//                     msg.clear();
//                   }
//                 },
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
