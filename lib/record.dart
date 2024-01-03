import 'dart:core';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_sound_record/flutter_sound_record.dart';
import 'package:path/path.dart' as p;

class Records {
  final FlutterSoundRecord _audioRecorder = FlutterSoundRecord();
  Start() async {
    Directory appFolder = Directory("/storage/emulated/0/Download");
    bool appFolderExists = await appFolder.exists();
    if (!appFolderExists) {
      final created = await appFolder.create(recursive: true);
      if (kDebugMode) {
        print(created.path);
      }
    }
    final path = await _getPath();
    // print("creat fol $appFolderExists");
    // var document = await getTemporaryDirectory();
    // var storagePath = "${document.path}/amar.m4a";
    // var file = File(storagePath);
    // final externalDir = await Directory('/storage/emulated/0/Download/amar.m4a');
    // Directory paths = await getApplicationDocumentsDirectory();
    // print("callrecord ${externalDir.path}");
    // var document = await getTemporaryDirectory();
    // var storagePath = "${document.path}/opm.pcm";
    // var file = File(storagePath);
    // final dar = await file.create();
    // print("${dar.path}");
    // print("${document}");

    // if (await record.hasPermission()) {
    //   print("callrecordstart");
    // Future.delayed(Duration(seconds: 5), () async {
    if (await _audioRecorder.hasPermission()) {
      await _audioRecorder.start(
        path: path, // required
        encoder: AudioEncoder.AAC, // by default
        bitRate: 128000, // by default
        samplingRate: 44100, // by default
      );
    }
    // });

    //recordStream(record, RecordConfig());
    // Start recording
    // await record.start(
    //   path:
    //       '${externalDir.path}/${DateTime.now().microsecondsSinceEpoch}.m4a',
    //   encoder: AudioEncoder.aacLc, // by default
    //   bitRate: 128000, // by default
    //   samplingRate: 44100, // by default
    // );
    //}
  }

  Stoprec() async {
    var p = await _audioRecorder.stop();
    if (kDebugMode) {
      print("callrecordstop $p");
    }
  }

  Future<String> _getPath() async {
    final externalDir = Directory('/storage/emulated/0/Download');
    //  final dir = await getApplicationDocumentsDirectory();
    return p.join(
      externalDir.path,
      'audio${DateTime.now().millisecondsSinceEpoch}.m4a',
    );
  }
}
