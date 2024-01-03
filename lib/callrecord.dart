import 'package:flutter/material.dart';
import 'record.dart';

class RecordAudio extends StatefulWidget {
  const RecordAudio({Key? key}) : super(key: key);

  @override
  State<RecordAudio> createState() => _RecordAudioState();
}

class _RecordAudioState extends State<RecordAudio> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Records().Start();
              },
              child: const Text("start")),
          ElevatedButton(
              onPressed: () {
                Records().Stoprec();
              },
              child: const Text("stop"))
        ],
      ),
    );
  }
}
