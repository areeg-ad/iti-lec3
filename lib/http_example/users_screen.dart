import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//presentation layer
class UsersScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UserScreenState();
  }
}

class _UserScreenState extends State<UsersScreen> {
  late Future<List<User>> user;

  @override
  void initState() {
    super.initState();
    user = RemoteDataSource().fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: user,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var _users = (snapshot.data as List<User>);
              //handle data response
              // return UserListItem(_user);
              return ListView.builder(
                  itemCount: _users.length,
                  itemBuilder: (context, index) => UserListItem(_users[index]));
            } else if (snapshot.hasError) {
              //handle error response
              return Container(
                child: Center(child: Text('has error')),
              );
            }

            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}

class UserListItem extends StatelessWidget {
  var _user;

  UserListItem(this._user);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 5,
      child: Center(
          child: Card(
        child: Row(
          children: [
            Container(
              child: Image.network(_user.avatar),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_user.firstName),
                Text(_user.lastName),
                Text(_user.email),
              ],
            ),
          ],
        ),
      )),
    );
  }
}

//data layer
class User {
  int id;
  String firstName;
  String lastName;
  String email;
  String avatar;

  User(
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.avatar,
  );

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['id'],
      json['first_name'],
      json['last_name'],
      json['email'],
      json['avatar'],
    );
  }
}

class UsersUsecase {
  // Future<User> getUsers() {
  //   return RemoteDataSource().fetchUsers();
  // }
}

//Data layer
class RemoteDataSource {
  Future<List<User>> fetchUsers() async {
    var response = await http.get(Uri.parse('https://reqres.in/api/users'));
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);

      var list = (jsonResponse['data'] as List);
      var newList = list.map((item) => User.fromJson(item)).toList();

      return newList;
    } else {
      throw Exception('Can not fetch user');
    }
  }
}
