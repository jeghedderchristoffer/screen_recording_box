import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screen_recording_box/screen_recorder_box.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    [
      Permission.photos,
      Permission.storage,
      Permission.microphone,
    ].request();
  }

  void startRecording() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    bool result = await ScreenRecorderBox.startRecording(
      'test',
      appDocDir.path,
    );
    print("START RESULT: " + result.toString());
    setState(() {}); // UPDATE UI
  }

  void stopRecording() async {
    String result = await ScreenRecorderBox.stopRecording();
    print("STOP RESULT: " + result.toString());
    setState(() {}); // UPDATE UI
  }

  void pauseRecording() async {
    bool result = await ScreenRecorderBox.pauseRecording();
    print("PAUSE RESULT: " + result.toString());
    setState(() {}); // UPDATE UI
  }

  void resumeRecording() async {
    bool result = await ScreenRecorderBox.resumeRecording();
    print("RESUME RESULT: " + result.toString());
    setState(() {}); // UPDATE UI
  }

  @override
  Widget build(BuildContext context) {
    Widget isRecording = FutureBuilder(
      future: ScreenRecorderBox.isRecording,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text("IS RECORDING: " + snapshot.data.toString());
        }
        return Text("IS RECORDING: LOADING...");
      },
    );

    Widget hasBeenStarted = FutureBuilder(
      future: ScreenRecorderBox.hasBeenStarted,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text("HAS BEEN STARTED: " + snapshot.data.toString());
        }
        return Text("HAS BEEN STARTED: LOADING...");
      },
    );

    Widget buttonStart = TextButton(
      onPressed: () => startRecording(),
      child: Text("START RECORDING"),
    );

    Widget buttonStop = TextButton(
      onPressed: () => stopRecording(),
      child: Text("STOP RECORDING"),
    );

    Widget buttonPause = TextButton(
      onPressed: () => pauseRecording(),
      child: Text("PAUSE RECORDING"),
    );

    Widget buttonResume = TextButton(
      onPressed: () => resumeRecording(),
      child: Text("RESUME RECORDING"),
    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Screen recorder box'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              isRecording,
              hasBeenStarted,
              buttonStart,
              buttonStop,
              buttonPause,
              buttonResume,
            ],
          ),
        ),
      ),
    );
  }
}
