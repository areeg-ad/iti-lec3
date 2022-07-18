import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_samples_2/lab3/details_screen.dart';
import 'package:http/http.dart' as http;

//presentation layer
class ArticlesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UserScreenState();
  }
}

class _UserScreenState extends State<ArticlesScreen> {
  late Future<List<News>> user;

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
              var _users = (snapshot.data as List<News>);
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
  var _newsList;

  UserListItem(this._newsList);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 5,
      child: Center(
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetailsScreen(_newsList)));
          },
          child: Card(
            child: Row(
              children: [
                Container(
                  child: Image.network(_newsList.picture),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(_newsList.title),
                    // Text(_user.lastName),
                    // Text(_user.email),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//data layer
class News {
  String id;
  String title;
  String content;
  String picture;

  News(
    this.id,
    this.title,
    this.content,
    this.picture,
  );

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      json['id'],
      json['title'],
      json['content'],
      json['picture'],
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
  Future<List<News>> fetchUsers() async {
    var response = await http.get(
        Uri.parse('https://62d4154fcd960e45d452f790.mockapi.io/api/article'));
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);

      var list = (jsonResponse as List);
      var newList = list.map((item) => News.fromJson(item)).toList();

      return newList;
    } else {
      throw Exception('Can not fetch user');
    }
  }
}
