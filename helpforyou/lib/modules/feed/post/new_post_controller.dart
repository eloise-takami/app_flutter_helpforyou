import 'package:helpforyou/services/database/database_service.dart';
import 'package:helpforyou/shared/models/post_model.dart';
import 'package:helpforyou/shared/providers/auth_state.dart';
import 'package:helpforyou/shared/responses/default_response.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class NewPostController {
  TextEditingController content = TextEditingController();
  String? valueChoose;
  final categorias = <String>[
    "Violência sexual",
    "Violência patrimonial",
    "Violência fisica",
    "Violência moral",
    "Violência psicológica"
  ];

  Future<bool> postar(BuildContext context) async {
    final user = Provider.of<AuthState>(context, listen: false).getUser;
    bool result = false;

    if (user != null) {
      final post = new PostModel(
        content: content.text,
        categoria: valueChoose!,
        userName: user.name,
        userId: user.id,
        likes: 0,
        date: DateTime.now(),
      );

      print(post);

      final response = await DatabaseService.savePost(post);

      if (response.status == ResponseStatus.SUCCESS) {
        result = true;
        // ScaffoldMessenger.of(context)
        //     .showSnackBar(new SnackBar(content: const Text('Post salvo!')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
            content: Text('Ops, ocorreu um erro: ${response.message!}')));
      }
    }

    return result;
  }
}
