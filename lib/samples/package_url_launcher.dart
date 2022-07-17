import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

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
  var text = 'I am old text';

  @override
  void initState() {
    super.initState();
  }

  void readFile() async {
    String textasset = "assets/text.txt"; //path to text file asset
    String text = await rootBundle.loadString(textasset);
    setState(() {
      this.text = text;
    });
    print(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text),
          ElevatedButton(
              onPressed: () {
                readFile();
              },
              child: Text('Load String from File'))
        ],
      )),
    );
  }
}
