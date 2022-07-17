import 'dart:convert';
import 'dart:ffi';

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
  late Future<List<User>> users;

  @override
  void initState() {
    super.initState();
    users = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: users,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            List<User> users = (snapshot.data as List<User>);
            return Center(
                child: ListView.builder(
                    itemCount: users.length,
                    itemBuilder: ((context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(users[index].avatar),
                          Text(
                            users[index].firstName,
                          ),
                          Text(
                            users[index].lastName,
                          ),
                          Text(
                            users[index].email,
                          )
                        ],
                      );
                    })));
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                children: [Text(snapshot.error.toString())],
              ),
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

  Future<List<User>> fetchData() async {
    var response = await http.get(Uri.parse('https://reqres.in/api/users'));
    var jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return (jsonResponse['data'] as List)
          .map((e) => User.fromJson(e))
          .toList();
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
