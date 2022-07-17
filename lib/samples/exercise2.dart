import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: TabBarScreen(),
  ));
}

class TabBarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          bottom: TabBar(
            unselectedLabelColor: Colors.black,
            labelColor: Colors.purple,
            indicatorColor: Colors.purple,
            tabs: [
              Tab(
                child: Text(
                  'SIGN UP',
                ),
              ),
              Tab(
                child: Text('LOGIN'),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [SignUpScreen(), LoginScreen()],
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  var groupVal = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Showcase App',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.purple,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Radio(
                          value: 1, groupValue: groupVal, onChanged: (val) {}),
                      Text('Admin'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          value: 2, groupValue: groupVal, onChanged: (val) {}),
                      Text('Project Owner'),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: 'Username',
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock),
                    labelText: 'Password',
                  ),
                  keyboardType: TextInputType.phone,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.purple),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    child: Text('Login'),
                  ),
                  onPressed: () {},
                ),
              ),
              Divider(
                color: Colors.grey,
              ),
              Text('or Connect with'),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Colors.blue[900]),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        child: Text('Facebook'),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.red[900]),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                        child: Text('Google'),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpScreen extends StatelessWidget {
  var groupVal = 1;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Showcase App',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.purple,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Radio(
                          value: 1, groupValue: groupVal, onChanged: (val) {}),
                      Text('Admin'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          value: 2, groupValue: groupVal, onChanged: (val) {}),
                      Text('Admin'),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: 'Username',
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    labelText: 'Email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock),
                    labelText: 'Password',
                  ),
                  keyboardType: TextInputType.visiblePassword,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.purple),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    child: Text('Signup'),
                  ),
                  onPressed: () {},
                ),
              ),
              Divider(
                color: Colors.grey,
              ),
              Text('or Connect with'),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Colors.blue[900]),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        child: Text('Facebook'),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.red[900]),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                        child: Text('Google'),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
