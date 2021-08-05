import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:helpforyou/services/auth/auth_service.dart';
import 'package:helpforyou/shared/responses/default_response.dart';
import 'package:file/local.dart';

class StorageService {
  static Future<DefaultResponse<firebase_storage.TaskSnapshot>> uploadFile({
    required String filePath,
    required String folderName,
    required String fileNameWithExtension,
    bool local = false,
  }) async {
    File file;
    final userId = AuthService.user().uid;

    if (local) {
      file = LocalFileSystem().file(filePath);
    } else {
      file = File(filePath);
    }

    try {
      final uploadTask = await firebase_storage.FirebaseStorage.instance
          .ref('users/$userId/$folderName/$fileNameWithExtension')
          .putFile(file);

      return ResponseBuilder.success(object: uploadTask);
    } on firebase_core.FirebaseException catch (e) {
      return ResponseBuilder.failed(message: e.code);
    }
  }
}
