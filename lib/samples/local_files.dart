import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  String? _content;
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Enter your name'),
              ),
              ElevatedButton(
                onPressed: () {
                  writeToFile();
                },
                child: Text('Save to File'),
              ),
              SizedBox(
                height: 40,
              ),
              Text(_content ?? 'press buttonto read from file'),
              ElevatedButton(
                onPressed: () {
                  readFromFile();
                },
                child: Text('Read from File'),
              ),
            ],
          )),
    );
  }

  Future<String> _getFileDir() async {
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  void readFromFile() async {
    final path = await _getFileDir();
    final myFile = File('$path/data.txt');
    final data = await myFile.readAsString();
    setState(() {
      this._content = data;
    });
  }

  void writeToFile() async {
    final path = await _getFileDir();
    final myFile = File('$path/data.txt');
    // If data.txt doesn't exist, it will be created automatically
    await myFile.writeAsString(textEditingController.text);
    setState(() {
      textEditingController.clear();
    });
  }
}
