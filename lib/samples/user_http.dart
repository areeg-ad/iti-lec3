import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

final String apiKey = 'f9489b9172a74ca497553792ff3f15f9';

void main() {
  runApp(MaterialApp(home: TodoScreen()));
}

class TodoScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TodoScreenState();
  }
}

class _TodoScreenState extends State<TodoScreen> {
  late Future<User> users;

  @override
  void initState() {
    super.initState();
    users = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<User>(
        future: users,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(snapshot.data!.avatar),
                  Text(
                    snapshot.data!.firstName,
                  ),
                  Text(
                    snapshot.data!.lastName,
                  ),
                  Text(
                    snapshot.data!.email,
                  )
                ],
              ),
            );
          } else if (snapshot.hasData) {
            return Column(
              children: [Text(snapshot.data!.lastName)],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
    );
  }

  Future<User> fetchData() async {
    var response = await http.get(Uri.parse('https://reqres.in/api/users'));
    var jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return User.fromJson(jsonResponse['data'][0]);
    } else {
      throw Exception('Failed to load todo');
    }
  }
}

class User {
  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  User(this.id, this.email, this.firstName, this.lastName, this.avatar);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['id'],
      json['email'],
      json['first_name'],
      json['last_name'],
      json['avatar'],
    );
  }
}
