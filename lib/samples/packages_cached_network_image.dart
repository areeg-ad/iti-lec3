import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(),
      ),
    );
  }
}
