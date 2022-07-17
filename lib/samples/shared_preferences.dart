import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  SharedPreferences? prefs;
  TextEditingController controller = new TextEditingController();
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                name,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                child: Text("Save"),
                onPressed: () {
                  save();
                },
              ),
              ElevatedButton(
                child: Text("retrieve"),
                onPressed: () {
                  retrieve();
                },
              ),
              ElevatedButton(
                child: Text("Delete"),
                onPressed: () {
                  delete();
                },
              )
            ],
          )),
    );
  }

  void save() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('name_key', controller.text);
  }

  void retrieve() async {
    var sharePref = await SharedPreferences.getInstance();
    var name = await sharePref.getString('name_key');
    setState(() {
      this.name = name ?? 'NA';
    });
  }

  void delete() async {
    var sharedPref = await SharedPreferences.getInstance();
    sharedPref.remove('name_key');
  }
}
