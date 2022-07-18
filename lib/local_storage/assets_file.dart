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
  void initState() {
    super.initState();
    text = 'another value';
  }

  @override
  Widget build(BuildContext context) {
    print('build method');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text ?? ''),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  print('load data');
                  loadData();
                },
                child: Text('Load Data')),
          ],
        ),
      ),
    );
  }

  void loadData() async {
    String name = await rootBundle.loadString('assets/text.txt');
    setState(() {
      text = name;
    });
    print(text);
  }
}
