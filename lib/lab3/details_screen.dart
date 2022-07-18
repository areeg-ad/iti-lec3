import 'package:flutter/material.dart';
import 'package:flutter_samples_2/lab3/users_screen.dart';

class DetailsScreen extends StatelessWidget {
  News news;

  DetailsScreen(this.news);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(news.title)),
      body: Container(child: Text(news.content)),
    );
  }
}
