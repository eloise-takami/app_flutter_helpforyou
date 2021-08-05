import 'dart:io' as io;

import 'package:flutter/material.dart';
import 'package:flutter_audio_recorder2/flutter_audio_recorder2.dart';
import 'package:helpforyou/app_routes.dart';
import 'package:helpforyou/services/database/database_service.dart';
import 'package:helpforyou/shared/models/audio_model.dart';
import 'package:path_provider/path_provider.dart';

import 'package:helpforyou/services/storage/storage_service.dart';
import 'package:helpforyou/shared/responses/default_response.dart';

extension E on RecordingStatus {
  /// Becouse [RecordingStatus.Paused] is not used
  bool get idle => this == RecordingStatus.Paused;

  bool get recording => this == RecordingStatus.Recording;
  bool get loading => this == RecordingStatus.Stopped;
}

class RecordController {
  final statusNotifier = ValueNotifier<RecordingStatus>(RecordingStatus.Unset);

  RecordingStatus get status => statusNotifier.value;

  set status(RecordingStatus status) => statusNotifier.value = status;

  FlutterAudioRecorder2? _recorder;
  int? millisecondsSinceEpoch;

  void onButtonPressed(BuildContext context) {
    switch (status) {
      case RecordingStatus.Initialized:
        {
          start(context);
          break;
        }
      case RecordingStatus.Recording:
        {
          stop(context);
          break;
        }
      default:
        break;
    }
  }

  Future<void> init(BuildContext context) async {
    try {
      final hasPermission = await FlutterAudioRecorder2.hasPermissions;

      if (hasPermission ?? false) {
        millisecondsSinceEpoch = DateTime.now().millisecondsSinceEpoch;
        String customPath = '/flutter_audio_recorder_';
        io.Directory appDocDirectory;

        if (io.Platform.isIOS) {
          appDocDirectory = await getApplicationDocumentsDirectory();
        } else {
          appDocDirectory = (await getExternalStorageDirectory())!;
        }

        customPath =
            appDocDirectory.path + customPath + '$millisecondsSinceEpoch .aac';

        _recorder = FlutterAudioRecorder2(
          customPath,
          audioFormat: AudioFormat.AAC,
        );

        await _recorder!.initialized;
        final result = await _recorder!.current();
        status = result!.status!;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: new Text("Você deve aceitar permissões")));
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> start(BuildContext context) async {
    try {
      final hasPermission = await FlutterAudioRecorder2.hasPermissions;

      if (hasPermission ?? false) {
        status = RecordingStatus.Recording;
        await _recorder!.start();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: new Text("Você deve aceitar permissões")));
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> stop(BuildContext context) async {
    var result = await _recorder!.stop();
    status = RecordingStatus.Paused;

    final name = await showDialog<String>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        final inputController = TextEditingController();
        final formKey = GlobalKey<FormState>();

        inputController.text = 'Novo áudio';

        return AlertDialog(
          title: Text('Nome'),
          content: Form(
            key: formKey,
            child: TextFormField(
              controller: inputController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              validator: (value) =>
                  value != null && value.isNotEmpty ? null : 'Nome do áudio',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  Navigator.pop(context, inputController.text);
                }
              },
              child: Text('Salvar'),
            ),
          ],
        );
      },
    );

    status = result!.status!;

    final response = await StorageService.uploadFile(
      filePath: result.path!,
      folderName: 'audios',
      fileNameWithExtension: '$millisecondsSinceEpoch.aac',
    );

    if (response.status == ResponseStatus.SUCCESS) {
      final url = await response.object!.ref.getDownloadURL();
      final audio = AudioModel(
        localPath: result.path!,
        url: url,
        name: name!,
        durationInMilliseconds: result.duration!.inMilliseconds,
        date: DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch!),
      );

      await DatabaseService.saveAudio(audio);
    }

    Navigator.pushNamedAndRemoveUntil(
        context, AppRoutes.audio_record, ModalRoute.withName(AppRoutes.app));
  }
}
