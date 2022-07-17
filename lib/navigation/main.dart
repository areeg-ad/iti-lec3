import 'package:flutter/material.dart';
import 'package:flutter_samples_2/navigation/screen1.dart';
import 'package:flutter_samples_2/navigation/screen2.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Screen1(),
      '/screen2': (context) => Screen2(),
    },
  ));
}
