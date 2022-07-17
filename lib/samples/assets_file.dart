import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  String? text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text ?? 'old text'),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  loadData();
                },
                child: Text('Load Data')),
          ],
        ),
      ),
    );
  }

  void loadData() async {
    var data = await rootBundle.loadString('assets/text.txt');
    setState(() {
      this.text = data;
    });
  }
}
